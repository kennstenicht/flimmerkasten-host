import Component from '@glimmer/component';
import { tracked } from '@glimmer/tracking';
import { Input } from '@ember/component';
import { fn } from '@ember/helper';
import { on } from '@ember/modifier';
import { service } from '@ember/service';
import { action } from '@ember/object';
import t from 'ember-intl/helpers/t';
import { DataConnection } from 'peerjs';
import PeerService from 'flimmerkasten-host/services/peer';
import bem from 'flimmerkasten-host/helpers/bem';
import Button from 'flimmerkasten-host/components/ui/button';

interface ConnectionListSignature {
  Element: HTMLDivElement;
}

export default class ConnectionList extends Component<ConnectionListSignature> {
  // Services
  @service peer!: PeerService;

  // Defaults
  blockName = 'c-setup-connection-list';
  @tracked value: string = '';

  // Actions
  @action sendMessage(connection: DataConnection) {
    connection.send(this.value);
  }

  <template>
    <div class={{bem this.blockName}} ...attributes>
      {{#if this.peer.hasConnection}}
        {{#each-in this.peer.connections as |id connection|}}
          <div class={{bem this.blockName 'connection'}}>
            Display:
            {{connection.metadata.display.id}}
            {{id}}
            <br />
            Peer:
            {{connection.peer}}
            <br />
            Size:
            {{connection.metadata.window.width}}
            x
            {{connection.metadata.window.height}}
            px
            {{! template-lint-disable require-input-label }}
            <Input @value={{this.value}} />
            <Button
              type='button'
              {{on 'click' (fn this.sendMessage connection)}}
            >
              Send
            </Button>
          </div>
        {{/each-in}}
      {{else}}
        <div class={{bem this.blockName 'connection'}}>
          {{t 'setup.connectionList.noConnection'}}
        </div>
      {{/if}}
    </div>
  </template>
}
