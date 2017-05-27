import React from 'react';
import {browserHistory} from 'react-router';
// Refs: https://medium.com/the-many/adding-login-and-authentication-sections-to-your-react-or-react-native-app-7767fd251bd1
class EnsureLoggedInContainer extends React.Component {
  componentDidMount() {
    let isLoggedIn = this.isLoggedIn = localStorage.getItem("token");
    if (!isLoggedIn) {
      browserHistory.push("/login");
    }
  }

  render() {
    if (this.isLoggedIn) {
      return this.props.children;
    } else {
      return null;
    }
  }
}

export default EnsureLoggedInContainer;