import React from 'react';
import {browserHistory} from 'react-router';
// Refs: https://medium.com/the-many/adding-login-and-authentication-sections-to-your-react-or-react-native-app-7767fd251bd1
import {fetchUserByToken} from '../Account/AccountActions';
import {connect} from 'react-redux';

class EnsureLoggedInContainer extends React.Component {
  state = {
    isLoggedIn: false
  };
  componentDidMount() {
    let token = localStorage.getItem("token");
    // Check the token is valid?
    this.props.dispatch(fetchUserByToken(token)).then((result) => {
      // Token is valid and get user succeed
      if(result.user && result.user.AccountId) {
        this.setState({isLoggedIn: true});
      } else { // Authentication failed
        this.setState({isLoggedIn: false}, () => {
          browserHistory.push("/login");
        });
      }
    });
  }

  render() {
    if (this.state.isLoggedIn) {
      return this.props.children;
    } else {
      return null;
    }
  }
}

export default connect()(EnsureLoggedInContainer);