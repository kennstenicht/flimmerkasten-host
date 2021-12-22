import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import IntlService from 'ember-intl/services/intl';
import ConfirmService from 'flimmerkasten-host/services/confirm';

export default class ApplicationConfirmModalComponent extends Component {
  // Services
  @service confirm!: ConfirmService;
  @service intl!: IntlService;


  // Defaults
  blockName = 'c-application-confirm-modal';


  // Getter, setter and computed properties
  get cancelLabel() {
    return this.intl.t(`application.confirm.for.${this.confirm.type}.cancel`);
  }

  get confirmLabel() {
    return this.intl.t(`application.confirm.for.${this.confirm.type}.confirm`);
  }
}
