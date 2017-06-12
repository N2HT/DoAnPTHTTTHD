import callApi from '../../util/apiCaller';
// Export Constants
export const ACTIONS = {
  LOGIN: 'LOGIN',
  FETCH_USER_BY_TOKEN: 'FETCH_USER_BY_TOKEN'
};

// Export Actions
export function login(username, password) {
  return (dispatch) => {
    return callApi('user/login', 'post', {
      username,
      password
    }).then(res => dispatch(loginAction(res)));
  };
}
export function loginAction(loginInfo) {
  return {
    type: ACTIONS.LOGIN,
    loginInfo
  };
}
// Check the token is valid?
export function fetchUserByToken(token) {
  return (dispatch) => {
    return callApi(`user/getUserFromToken`, 'post', token).then(res => dispatch(fetchUserByTokenAction(res)));
  };
}
export function fetchUserByTokenAction(user) {
  return {
    type: ACTIONS.FETCH_USER_BY_TOKEN,
    user
  };
}