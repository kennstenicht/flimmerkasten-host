import Component from '@glimmer/component';

interface Args {
  disabled: boolean,
  style: string
  type: string
}

export default class UiButtonComponent extends Component<Args> {
  // Defaults
  blockName = 'c-ui-button';


  // Getter and setter
  get type() {
    return this.args.type ?? 'button';
  }
}
