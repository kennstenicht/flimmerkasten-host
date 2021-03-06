import Ember from 'ember';
import RouteInfo from '@ember/routing/-private/route-info';

declare global {
  interface Array<T> extends Ember.ArrayPrototypeExtensions<T> {}
  // interface Function extends Ember.FunctionPrototypeExtensions {}

  interface CustomRouteInfo extends RouteInfo {
    metadata: {
      metaTags: Function
    }
  }
}

export {};
