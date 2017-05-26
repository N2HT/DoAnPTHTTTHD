/* eslint-disable global-require */
import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './modules/App/App';

// require.ensure polyfill for node
if (typeof require.ensure !== 'function') {
  require.ensure = function requireModule(deps, callback) {
    callback(require);
  };
}

/* Workaround for async react routes to work with react-hot-reloader till
  https://github.com/reactjs/react-router/issues/2182 and
  https://github.com/gaearon/react-hot-loader/issues/288 is fixed.
 */
if (process.env.NODE_ENV !== 'production') {
  // Require async routes only in development for react-hot-reloader to work.
  require('./modules/Home/pages/HomePage/HomePage');
  require('./modules/Home/pages/AboutPage/AboutPage');
  require('./modules/Account/LoginPage');
  require('./modules/Agent/AgentPage');
  require('./modules/Merchant/MerchantPage');
  require('./modules/Report/ReportPage');
}

// react-router setup with code-splitting
// More info: http://blog.mxstbr.com/2016/01/react-apps-with-pages/
export default (
  <Route path="/" component={App}>
    <IndexRoute
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Home/pages/HomePage/HomePage').default);
        });
      }}
    />
    <Route
      path="/agents"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Agent/AgentPage').default);
        });
      }}
    />
    <Route
      path="/agent/new"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Agent/NewAgentPage').default);
        });
      }}
    />
    <Route
      path="/merchants"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Merchant/MerchantPage').default);
        });
      }}
    />
    <Route
      path="/reports"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Report/ReportPage').default);
        });
      }}
    />
    <Route
      path="/about"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Home/pages/AboutPage/AboutPage').default);
        });
      }}
    />
    <Route
      path="/login"
      getComponent={(nextState, cb) => {
        require.ensure([], require => {
          cb(null, require('./modules/Account/LoginPage').default);
        });
      }}
    />
  </Route>
);
