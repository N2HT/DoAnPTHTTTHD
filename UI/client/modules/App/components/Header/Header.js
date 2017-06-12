import React, { Component } from 'react';
import {AppBar, SvgIcon, IconButton, Avatar, IconMenu, Badge} from 'material-ui';
import MenuIcon from 'material-ui/svg-icons/navigation/menu';
import NavigationClose from 'material-ui/svg-icons/navigation/close';
import {List, ListItem} from 'material-ui/List';
import SearchForm from '../SearchForm/SearchForm';
import DrawerMenu from '../DrawerMenu/DrawerMenu';
import {browserHistory} from 'react-router';
import {login} from '../../../Account/AccountActions';
import {connect} from 'react-redux';
// Import Style
import styles from './Header.css';
const navIconStyle = {
  marginTop: 5
};
const navTitleStyle = {
  height: 60,
  lineHeight: 60
};

const drawerMenuWidth = 250;

const navStyle = {
  height: 60,
  backgroundColor: '#3367d6'
};

const appIconStyle = {
  position: 'absolute',
  top: '50%',
  transform: 'translateY(-50%)',
  cursor: 'pointer',
  marginLeft: 10
};

const IconNotification = (props) => (
  <SvgIcon {...props}>
    <path d="M12 22c1.1 0 2-.9 2-2h-4c0 1.1.89 2 2 2zm6-6v-5c0-3.07-1.64-5.64-4.5-6.32V4c0-.83-.67-1.5-1.5-1.5s-1.5.67-1.5 1.5v.68C7.63 5.36 6 7.92 6 11v5l-2 2v1h16v-1l-2-2z"/>
  </SvgIcon>
);

class Header extends Component {
  constructor(props) {
    super(props);
    this.handleSwitchDrawerState = this.handleSwitchDrawerState.bind(this);
    this.handleAvatarClick = this.handleAvatarClick.bind(this);
    this.handleNotifyClick = this.handleNotifyClick.bind(this);
    this.handleLogout = this.handleLogout.bind(this);
    this.handleSettings = this.handleSettings.bind(this);
  }

  state = {
    isDrawerOpen: false,
    isNavAvMenuOpen: false,
    isNavNotifyMenuOpen: false
  };

  handleSwitchDrawerState() {
    this.setState((prevState) => ({
      isDrawerOpen: !prevState.isDrawerOpen
    }));
  }

  handleAvatarClick() {
    console.log('handleAvatarClick');
    this.setState((prevState)=>({
      isNavAvMenuOpen: !prevState.isNavAvMenuOpen,
      isNavNotifyMenuOpen: false
    }));
  }
  handleNotifyClick() {
    console.log('handleNotifyClick');
    this.setState((prevState)=>({
      isNavNotifyMenuOpen: !prevState.isNavNotifyMenuOpen,
      isNavAvMenuOpen: false
    }));
  }

  handleLogout() {
    console.log('handleLogout');
    this.setState({isNavAvMenuOpen: false});
    this.props.dispatch(login(null)).then(()=>{
      browserHistory.push("/login");
    });
  }
  handleSettings() {
    console.log('handleSettings');
    this.setState({isNavAvMenuOpen: false});
  }

  render() {
    return (
      <div className={styles.header}>
        <AppBar
          style={navStyle}
          titleStyle={navTitleStyle}
          iconStyleLeft={navIconStyle}
          iconStyleRight={navIconStyle}
          title={<SearchForm />}
          iconElementLeft={
            <div>
              <IconButton onClick={this.handleSwitchDrawerState}>
                {this.state.isDrawerOpen?<NavigationClose color="#fff"/>:<MenuIcon color="#fff"/>}
              </IconButton>
              <img onClick={()=>{browserHistory.push('/')}}
                   style={appIconStyle}
                   title="Card Processing" src="/assets/images/appicon.png" width="40" height="40" />
            </div>}
          iconElementRight={
            <div>
              <IconButton className={styles["notification-icon-button"]}>
                <Badge
                  badgeContent={1}
                  primary={true}
                  style={{padding: 0}}
                  badgeStyle={{top: -12, right: -12, backgroundColor: 'transparent'}}>
                  <IconNotification onClick={this.handleNotifyClick} color="#fff"/>
                </Badge>
              </IconButton>
              <IconButton onClick={this.handleAvatarClick}>
                <Avatar
                  className={styles.avatar}
                  color='#fff'
                  backgroundColor='#2850a7'
                  size={40}>A</Avatar>
              </IconButton>
            </div>}
        />
        <IconMenu
          style={{display: 'block'}}
          open={this.state.isNavAvMenuOpen}
          iconButtonElement={
            <Avatar
              style={{position: 'fixed', top: 40, right: 5}}
              size={0}/>
          }
          anchorOrigin={{horizontal: 'right', vertical: 'top'}}
          targetOrigin={{horizontal: 'right', vertical: 'top'}}>
          <List>
            <ListItem onClick={this.handleSettings} primaryText="Settings"/>
            <ListItem onClick={this.handleLogout} primaryText="Logout"/>
          </List>
        </IconMenu>
        <IconMenu
          style={{display: 'block'}}
          open={this.state.isNavNotifyMenuOpen}
          iconButtonElement={
            <Avatar
              style={{position: 'fixed', top: 40, right: 5}}
              size={0}/>
          }
          anchorOrigin={{horizontal: 'right', vertical: 'top'}}
          targetOrigin={{horizontal: 'right', vertical: 'top'}}>
          <List>
            <ListItem primaryText="All mail"/>
            <ListItem primaryText="Trash"/>
            <ListItem primaryText="Spam"/>
            <ListItem primaryText="Follow up"/>
          </List>
        </IconMenu>
        <DrawerMenu
          isOpen={this.state.isDrawerOpen}
          width={drawerMenuWidth}
          switchDrawerState={this.handleSwitchDrawerState}/>
      </div>
    );
  }
}

export default connect()(Header);