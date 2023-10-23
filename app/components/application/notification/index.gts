import Component from '@glimmer/component';
import { action } from '@ember/object';
import { hash } from '@ember/helper';
import { on } from '@ember/modifier';
import { isPresent } from '@ember/utils';
import didInsert from '@ember/render-modifiers/modifiers/did-insert';
import { next } from '@ember/runloop';
import Flash from 'ember-cli-flash/flash/object';
// @ts-ignore
import svgJar from 'ember-svg-jar/helpers/svg-jar';
import eq from 'ember-truth-helpers/helpers/eq';
import bem from 'flimmerkasten-host/helpers/bem';
import styles from './styles.css';

interface NotificationSignature {
  Element: HTMLDivElement;
  Args: {
    flash: Flash & {
      message?: string;
      sticky?: boolean;
      type?: string;
    };
  };
}

export default class Notification extends Component<NotificationSignature> {
  // Functions
  @action preventExiting() {
    const flash = this.args.flash;

    if (isPresent(flash)) {
      flash.preventExit();
    }
  }

  @action allowExiting() {
    const flash = this.args.flash;

    if (isPresent(flash) && !flash.exiting) {
      flash.allowExit();
    }
  }

  @action startProgress(element: HTMLElement) {
    // @ts-ignore
    const duration = this.args.flash?.timeout || 0;

    element.style.transitionDuration = `${duration}ms`;

    next(this, function () {
      element.style.width = `100%`;
    });
  }

  <template>
    <div
      class={{bem styles (hash type=@flash.type is-exiting=@flash.exiting)}}
      role='alert'
      ...attributes
      {{on 'mouseenter' this.preventExiting}}
      {{on 'mouseleave' this.allowExiting}}
    >
      <div
        class={{bem styles 'close'}}
        role='button'
        {{on 'click' @flash.destroyMessage}}
      >
        {{svgJar 'cancel' class='o-icon'}}
      </div>
      {{#if (eq @flash.type 'success')}}
        {{svgJar 'check_circle' class=(bem styles 'icon')}}
      {{else}}
        {{svgJar 'error' class=(bem styles 'icon')}}
      {{/if}}
      <div class={{bem styles 'content'}}>
        <div class={{bem styles 'message'}}>
          {{@flash.message}}
        </div>
        {{#unless @flash.sticky}}
          <div class={{bem styles 'progress'}}>
            <div
              class={{bem styles 'bar'}}
              {{didInsert this.startProgress}}
            ></div>
          </div>
        {{/unless}}
      </div>
    </div>
  </template>
}
