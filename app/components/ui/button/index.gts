import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import svgJar from 'ember-svg-jar/types';
import bem from 'flimmerkasten-host/helpers/bem';
import styles from './styles.css';

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

// eslint-disable-next-line ember/no-empty-glimmer-component-classes
export default class Button extends Component<ButtonSignature> {
  <template>
    <button
      class={{bem styles (hash style=@style has-label=(has-block))}}
      ...attributes
    >
      {{#if @icon}}
        {{svgJar @icon class=(bem styles 'icon')}}
      {{/if}}
      {{#if (has-block)}}
        <div class={{bem styles 'label'}}>
          {{yield}}
        </div>
      {{/if}}
    </button>
  </template>
}
