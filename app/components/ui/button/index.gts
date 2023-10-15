import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import svgJar from 'ember-svg-jar/types';
import bem from 'flimmerkasten-host/helpers/bem';

interface ButtonSignature {
  Element: HTMLButtonElement;
  Args: {
    icon?: 'delete' | 'cancel';
    style?: string;
  };
  Blocks: {
    default: [];
  };
}

export default class Button extends Component<ButtonSignature> {
  // Defaults
  blockName = 'c-ui-button';

  <template>
    <button
      class={{bem
        this.blockName
        modifiers=(hash style=@style has-label=(has-block))
      }}
      ...attributes
    >
      {{#if @icon}}
        {{svgJar @icon class=(bem this.blockName 'icon')}}
      {{/if}}
      {{#if (has-block)}}
        <div class={{bem this.blockName 'label'}}>
          {{yield}}
        </div>
      {{/if}}
    </button>
  </template>
}
