import Route from '@ember/routing/route';
import { inject as service } from '@ember/service';
import IntlService from 'ember-intl/services/intl';
import HeadDataService from 'flimmerkasten-host/services/head-data';

export default class ApplicationRoute extends Route {
  // Services
  @service headData!: HeadDataService;
  @service intl!: IntlService;


  // Hooks
  beforeModel() {
    // Set Locale
    this.intl.setLocale('de');

    // Setup head data fallback tags
    this.headData.fallbackMetaTags = {
      title: this.intl.t('application.meta.title'),
      description: this.intl.t('application.meta.description'),
      type: 'website',
      structuredData: null,
    }
  }
}
