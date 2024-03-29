import Service from '@ember/service';
import { action } from '@ember/object';
import { tracked } from '@glimmer/tracking';

export default class ConfirmService extends Service {
  // Defaults
  @tracked showPrompt: boolean = false;
  @tracked type?: string;
  @tracked data?: any;
  @tracked resolve: Function = () => {};

  // Functions
  @action
  ask(type: string, data?: any) {
    this.type = type;
    this.data = data;
    this.showPrompt = true;

    return new Promise((resolve: Function) => {
      this.resolve = resolve;
    });
  }

  reset() {
    this.showPrompt = false;
    this.resolve = () => {};
  }

  // Actions
  @action
  confirm() {
    this.resolve(true);
    this.reset();
  }

  @action
  cancel() {
    this.resolve(false);
    this.reset();
  }
}
