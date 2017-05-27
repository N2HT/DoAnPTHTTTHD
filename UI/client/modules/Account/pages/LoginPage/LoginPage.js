import React from 'react';
import Divider from 'material-ui/Divider';
import Paper from 'material-ui/Paper';
import {TextField, FlatButton, IconButton} from 'material-ui';
import ClearButton from 'material-ui/svg-icons/content/clear';
import {browserHistory} from 'react-router';
import Helmet from 'react-helmet';
import apiCaller from '../../../../util/apiCaller';
import {login} from '../../AccountActions';
import {connect} from 'react-redux';

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
  },
  loginFailed: {
    position: 'absolute',
    bottom: '-70px',
    width: '100%',
    backgroundColor: '#ffdce0',
    color: '#86181d'
  }
};

class LoginPage extends React.Component {
  constructor(props) {
    super(props);
    this.handleButtonLogin = this.handleButtonLogin.bind(this);
    this.state = {
      username: '',
      password: '',
      showLoginNotice: false
    }
  }
  handleButtonLogin() {
    console.log('Button Login clicked');
    // todo: let auth here
    this.props.dispatch(login(this.state.username, this.state.password)).then((data)=>{
      console.log('data');
      console.log(data);
      // If authentication succeed
      if( data.user && data.user.token ) {
        browserHistory.push('/');
      } else {
        this.setState({showLoginNotice: true});
      }
    }).catch((data)=>{
      console.log('data');
      console.log(data);
    });
  };
  render() {
    if(!this.state.showLoginNotice) {
      styles.loginFailed.display = 'none';
    } else {
      delete styles.loginFailed.display;
    }
    return(
      <Paper style={styles.paper} zDepth={2}>
        <Helmet title="Login"/>
        <Paper style={styles.imgIcon} zDepth={2} circle={true}>
          <img title="Card Processing" src="assets/images/appicon.png" width="50" height="50" />
        </Paper>
        <Paper style={styles.loginFailed} zDepth={2}>
          <span style={{
            top: '50%',
            position: 'absolute',
            transform: 'translateY(-50%)',
            marginLeft: 20
          }}>Incorrect username or password.</span>
          <IconButton style={{float: 'right'}} onClick={()=>{this.setState({showLoginNotice: false})}}>
            <ClearButton color="#86181d"/>
          </IconButton>
        </Paper>
        <div style={styles.title}>
          <h4 className={cssStyles['login-title']}>Login to Card Processing</h4>
        </div>
        <Divider />
        <TextField onChange={(e)=>{this.setState({username: e.target.value})}} hintText="Username" style={styles.textField} underlineShow={false} fullWidth={true} />
        <Divider />
        <TextField onChange={(e)=>{this.setState({password: e.target.value})}} hintText="Password" type="password" style={styles.textField} underlineShow={false} fullWidth={true} />
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

export default connect()(LoginPage);