import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import FlashService from 'ember-cli-flash/services/flash-messages';
import ENV from 'flimmerkasten-host/config/environment';

export default class ApplicationComponent extends Component {
  // Services
  @service flashMessages!: FlashService;


  // Defaults
  blockName = 'c-application';


  // Getter and Setter
  get isDevelopment() {
    return ENV.environment === 'development';
  }
}
