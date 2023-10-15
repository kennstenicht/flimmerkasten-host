import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import { service } from '@ember/service';
// @ts-ignore
import { keyResponder, onKey } from 'ember-keyboard';
import bem from 'flimmerkasten-host/helpers/bem';
import Button from 'flimmerkasten-host/components/ui/button';
import Confirm from 'flimmerkasten-host/services/confirm';

interface ConfirmModalSignature {
  Element: HTMLDivElement;
}

@keyResponder
export default class ConfirmModal extends Component<ConfirmModalSignature> {
  // Services
  @service declare confirm: Confirm;

  // Defaults
  blockName = 'c-application-confirm';

  // Functions
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

  <template>
    <div
      class={{bem
        this.blockName
        modifier=(hash is-open=this.confirm.showPrompt)
      }}
      ...attributes
    >
      <div
        class={{bem this.blockName 'overlay'}}
        role='button'
        {{on 'click' this.confirm.cancel}}
      ></div>
      <div class={{bem this.blockName 'container'}}>
        {{#if this.confirm.showPrompt}}
          <div class={{bem this.blockName 'content'}}>
            <Button
              @icon='delete'
              @style='danger'
              type='button'
              {{on 'click' this.confirm.confirm}}
            >
              Cancel
            </Button>
            <Button
              @icon='cancel'
              @style='secondary'
              type='button'
              {{on 'click' this.confirm.cancel}}
            >
              Confirm
            </Button>
          </div>
        {{/if}}
      </div>
    </div>
  </template>
}
