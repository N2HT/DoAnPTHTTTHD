import {ACTIONS} from './AccountActions';

// Initial State
const initialState = {
  user: null,
  token: null
};

const AccountReducer = (state = initialState, action) => {
  switch (action.type) {
    case ACTIONS.LOGIN:
      if(action.loginInfo && action.loginInfo.user) {
        state.user = action.loginInfo.user;
      } else {
        state.user = null;
      }
      // Store token when login success
      if(localStorage) {
        if(action.loginInfo && action.loginInfo.token) {
          localStorage.setItem("token", action.loginInfo.token);
        } else {
          localStorage.removeItem("token");
        }
      }
      return {...state};
    case ACTIONS.FETCH_USER_BY_TOKEN:
      state.user = action.user;
      return {...state};
    default:
      return state;
  }
};

/* Selectors */
// Get user had login
export const getUser = state => state.account.user;
export const getToken = state => state.account.token;

export default AccountReducer;