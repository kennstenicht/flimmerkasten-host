import Component from '@glimmer/component';
import { service } from '@ember/service';
import Confirm from 'flimmerkasten-host/services/confirm';
// @ts-ignore
import { keyResponder, onKey } from 'ember-keyboard';

@keyResponder
export default class ApplicationConfirm extends Component {
  // Services
  @service confirm!: Confirm;


  // Defaults
  blockName = 'c-application-confirm';


  // Keyboard actions
  @onKey('Enter')
  confirmOnEnter(event: Event) {
    this.confirm.confirm();
    event.preventDefault();
  }

  @onKey('Escape')
  cancelOnEscape(event: Event) {
    this.confirm.cancel();
    event.preventDefault();
  }
}
