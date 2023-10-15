import Component from '@glimmer/component';
import { hash } from '@ember/helper';
import bem from 'flimmerkasten-host/helpers/bem';
import ConnectionList from './connection-list';
import styles from './styles.css';
import layout from 'flimmerkasten-host/assets/styles/objects/layout.css';

interface SetupSignature {
  Element: HTMLDivElement;
}

export default class Setup extends Component<SetupSignature> {
  // Defaults
  blockName = 'c-setup';

  <template>
    <div class={{bem styles}} ...attributes>
      <div class={{bem layout}}>
        <div class={{bem layout 'item' (hash mobile='1/2')}}></div>
        <div class={{bem layout 'item' (hash mobile='1/2')}}>
          <ConnectionList />
        </div>
      </div>
    </div>
  </template>
}
