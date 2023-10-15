import Application from 'flimmerkasten-host/app';
import config from 'flimmerkasten-host/config/environment';
import * as QUnit from 'qunit';
import { setApplication } from '@ember/test-helpers';
import { setup } from 'qunit-dom';
import { start } from 'ember-qunit';
import './helpers/flash-message';

setApplication(Application.create(config.APP));

setup(QUnit.assert);

start();
