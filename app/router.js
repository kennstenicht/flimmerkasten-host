import EmberRouter from '@ember/routing/router';
import config from 'flimmerkasten-host/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('setup', { path: '/' });

  // Error
  this.route('error', { path: '/*path' });
});
