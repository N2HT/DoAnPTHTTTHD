import React from 'react';
import Divider from 'material-ui/Divider';
import Paper from 'material-ui/Paper';
import {TextField, FlatButton } from 'material-ui';
import {browserHistory} from 'react-router';
import Helmet from 'react-helmet';

import cssStyles from './LoginPage.css';

const styles = {
  paper: {
    margin: '0 20px',
    borderRadius: 3,
    width: 350,
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)'
  },
  textField: {
    paddingLeft: 20,
    paddingRight: 20
  },
  title: {
    borderRadius: '3px 3px 0 0',
    backgroundColor: '#3367d6',
    textAlign: 'center',
    height: 50,
    color: '#ffffff',
    position: 'relative'
  },
  buttonLogin: {
    width: '100%',
    color: '#f0ffff'
  },
  imgIcon: {
    position: 'absolute',
    marginTop: '-70px',
    left: '50%',
    transform: 'translateX(-50%)',
    width: 50,
    height: 50
  }
};

export default class LoginPage extends React.Component {
  constructor(props) {
    super(props);
    this.handleButtonLogin = this.handleButtonLogin.bind(this);
  }
  handleButtonLogin() {
    console.log('Button Login clicked');
    // todo: let auth here
    browserHistory.push('/');
  };
  render() {
    return(
      <Paper style={styles.paper} zDepth={2}>
        <Helmet title="Login"/>
        <Paper style={styles.imgIcon} zDepth={2} circle={true}>
          <img title="Card Processing" src="assets/images/appicon.png" width="50" height="50" />
        </Paper>
        <div style={styles.title}>
          <h4 className={cssStyles['login-title']}>Login to Card Processing</h4>
        </div>
        <Divider />
        <TextField hintText="Username" style={styles.textField} underlineShow={false} fullWidth={true} />
        <Divider />
        <TextField hintText="Password" type="password" style={styles.textField} underlineShow={false} fullWidth={true} />
        <Divider />
        <div style={{margin: 20}}>
          <FlatButton label="Login" style={styles.buttonLogin}
                      backgroundColor='#3367d6'
                      hoverColor='#9679c7'
                      onClick={this.handleButtonLogin}/>
        </div>
      </Paper>
    );
  }
}