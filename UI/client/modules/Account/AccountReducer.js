import {ACTIONS} from './AccountActions';

// Initial State
const initialState = {
  user: null
};

const AccountReducer = (state = initialState, action) => {
  switch (action.type) {
    case ACTIONS.LOGIN:
      state.user = action.user;
      // Store token when login success
      if(localStorage) {
        if(action.user && action.user.token) {
          localStorage.setItem("token", action.user.token);
        } else {
          localStorage.removeItem("token");
        }
      }
      return {...state};
    default:
      return state;
  }
};

/* Selectors */
// Get user had login
export const getUser = state => state.account.user;

export default AccountReducer;