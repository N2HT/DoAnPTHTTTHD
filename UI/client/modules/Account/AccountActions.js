import callApi from '../../util/apiCaller';
// Export Constants
export const ACTIONS = {
  LOGIN: 'LOGIN'
};

// Export Actions
export function login(username, password) {
  return (dispatch) => {
    return callApi('user/login', 'post', {
      username,
      password
    }).then(res => dispatch(loginAction(res.user)));
  };
}
export function loginAction(user) {
  return {
    type: ACTIONS.LOGIN,
    user
  };
}