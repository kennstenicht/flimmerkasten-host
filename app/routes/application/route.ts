import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import IntlService from 'ember-intl/services/intl';

export default class ApplicationRoute extends Route {
  // Services
  @service intl!: IntlService;


  // Hooks
  beforeModel() {
    // Set Locale
    this.intl.setLocale('de');
  }
}
