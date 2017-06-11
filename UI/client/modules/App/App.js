import React, { Component } from 'react';
import PropTypes from 'prop-types';
import {MuiThemeProvider, getMuiTheme} from 'material-ui/styles';
import {connect} from 'react-redux';

// Import Style
import styles from './App.css';

// Import Components
import Helmet from 'react-helmet';
import DevTools from './components/DevTools';
import Header from './components/Header/Header';

// Import Actions
import { toggleAddPost } from './AppActions';
import { getUser } from '../Account/AccountReducer';

export class App extends Component {
  constructor(props) {
    super(props);
    this.state = { isMounted: false };
    this.muiThemeSetting = getMuiTheme(null, {userAgent: 'all'});
  }

  componentDidMount() {
    this.setState({isMounted: true}); // eslint-disable-line
  }

  render() {
    let isLoggedIn = false;
    let user = this.props.user;
    if(this.state.isMounted) {
      isLoggedIn = user && user.AccountId;
    }
    let location = this.props.location;
    return (
      <MuiThemeProvider muiTheme={this.muiThemeSetting}>
        <div>
          {this.state.isMounted && !window.devToolsExtension && process.env.NODE_ENV === 'development' && <DevTools />}
          <div className={styles.wrapper}>
            <Helmet
              title="CardProcessingSystem"
              titleTemplate="%s - CardProcessingSystem"
              meta={[
                { charset: 'utf-8' },
                {
                  'http-equiv': 'X-UA-Compatible',
                  content: 'IE=edge',
                },
                {
                  name: 'viewport',
                  content: 'width=device-width, initial-scale=1',
                },
              ]}
            />
            {this.state.isMounted && location.pathname !== '/login' && isLoggedIn && <Header />}
            <div className={styles.container}>
              {this.props.children}
            </div>
          </div>
        </div>
      </MuiThemeProvider>
    );
  }
}

App.propTypes = {
  children: PropTypes.object.isRequired,
  user: PropTypes.object
};

function mapStateToProps(state) {
  return {
    user: getUser(state)
  };
}

export default connect(mapStateToProps)(App);
