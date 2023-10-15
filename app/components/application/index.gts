import Component from '@glimmer/component';
import { service } from '@ember/service';
import FlashMessageService from 'ember-cli-flash/services/flash-messages';
import bem from 'flimmerkasten-host/helpers/bem';
import Notification from './notification';
import ConfirmModal from './confirm-modal';

interface ApplicationSignature {
  Element: HTMLDivElement;
  Blocks: {
    default: [];
  };
}

export default class Application extends Component<ApplicationSignature> {
  // Services
  @service declare flashMessages: FlashMessageService;

  // Defaults
  blockName = 'c-application';

  <template>
    <div class={{bem this.blockName}} ...attributes>
      <div class={{bem this.blockName 'notifications'}}>
        {{#each this.flashMessages.queue as |flash|}}
          <Notification @flash={{flash}} />
        {{/each}}
      </div>
      <div class={{bem this.blockName 'content'}}>
        {{yield}}
      </div>
      <ConfirmModal />
    </div>
  </template>
}
