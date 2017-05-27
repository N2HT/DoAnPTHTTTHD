/**
 * Root Reducer
 */
import { combineReducers } from 'redux';

// Import Reducers
import app from './modules/App/AppReducer';
import account from './modules/Account/AccountReducer';

// Combine all reducers into one root reducer
export default combineReducers({
  app,
  account
});
