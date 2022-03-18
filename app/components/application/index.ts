import Component from '@glimmer/component';
import { service } from '@ember/service';
import FlashMessageService from 'ember-cli-flash/services/flash-messages';

export default class ApplicationComponent extends Component {
  // Services
  @service flashMessages!: FlashMessageService;


  // Defaults
  blockName = 'c-application';
}
