import Component from '@glimmer/component';
import bem from 'flimmerkasten-host/helpers/bem';
import ConnectionList from './connection-list';

interface SetupSignature {
  Element: HTMLDivElement;
}

export default class Setup extends Component<SetupSignature> {
  // Defaults
  blockName = 'c-setup';

  <template>
    <div class={{bem this.blockName}} ...attributes>
      <div class='o-layout'>
        <div class='o-layout__item u-2/3'></div>
        <div class='o-layout__item u-1/3'>
          <ConnectionList />
        </div>
      </div>
    </div>
  </template>
}
