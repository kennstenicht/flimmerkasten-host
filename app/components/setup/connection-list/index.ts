import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { service } from '@ember/service';
import { action } from '@ember/object';
import { DataConnection } from 'peerjs';
import PeerService from 'flimmerkasten-host/services/peer';

interface Args {
}

export default class SetupComponent extends Component <Args> {
  // Services
  @service peer!: PeerService;


  // Defaults
  blockName = "c-setup-connection-list";
  @tracked value: string = '';


  // Actions
  @action
  sendMessage(connection: DataConnection) {
    connection.send(this.value);
  }
}
