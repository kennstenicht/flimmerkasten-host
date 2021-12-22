import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import Confirm from 'flimmerkasten-host/services/confirm';
// @ts-ignore
import { keyResponder, onKey } from 'ember-keyboard';
// @ts-ignore
import move from 'ember-animated/motions/move';
// @ts-ignore
import TransitionContext from 'ember-animated/-private/transition-context';
// @ts-ignore
import { easeOut, easeIn } from 'ember-animated/easings/cosine';

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


  // Functions
  *slideFromBottom(
    {
      insertedSprites,
      removedSprites
    }: TransitionContext
  ) {
    for (let sprite of removedSprites) {
      sprite.endAtPixel({ y: window.innerHeight });
      move(sprite, { easing: easeIn });
    }

    for (let sprite of insertedSprites) {
      sprite.startAtPixel({ y: window.innerHeight });
      move(sprite, { easing: easeOut });
    }
  }
}
