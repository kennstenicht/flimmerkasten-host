import Service from '@ember/service';
import { action } from '@ember/object';
import { service } from '@ember/service';
import { registerDestructor } from '@ember/destroyable';
import { TrackedMap } from 'tracked-built-ins';
import Peer, { DataConnection } from 'peerjs';
import { restartableTask, timeout } from 'ember-concurrency';
import FlashMessageService from 'ember-cli-flash/services/flash-messages';

export default class PeerService extends Service {
  // Services
  @service declare flashMessages: FlashMessageService;

  // Defaults
  connections: TrackedMap<string, DataConnection> = new TrackedMap();
  peer?: Peer;

  // Constrcutor
  constructor() {
    super(...arguments);

    registerDestructor(this, () => {
      this.peer?.destroy();
    });
  }

  // Getter, setter and computed properties
  get hasConnection() {
    return Boolean(this.connections.size);
  }

  // Actions
  @action
  onPeerConnection(connection: DataConnection) {
    connection.on('data', (data: any) => {
      console.log(connection.peer, 'received', data);
    });

    connection.on('close', () => {
      this.connections.delete(connection.peer);
    });

    connection.on('open', () => {
      this.connections.set(connection.peer, connection);
    });
  }

  @action
  onPeerError(error: any) {
    switch (error.type) {
      case 'network':
        this.retryPeerConnection.perform();
        break;

      default:
        this.flashMessages.warning(`${error.type}: ${error}`);
        break;
    }
  }

  // Tasks
  createPeerConnection = restartableTask(async () => {
    this.peer = new Peer('master-peer', {
      secure: true,
    });

    this.peer.on('error', this.onPeerError);
    this.peer.on('connection', this.onPeerConnection);
  });

  retryPeerConnection = restartableTask(async () => {
    await timeout(10000);

    this.createPeerConnection.perform();
  });
}
