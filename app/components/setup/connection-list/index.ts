import Component from '@glimmer/component';
import { inject as service } from '@ember/service';
import PeerService from 'flimmerkasten-host/services/peer';

interface Args {
}

export default class SetupComponent extends Component <Args> {
  // Services
  @service peer!: PeerService;
}
