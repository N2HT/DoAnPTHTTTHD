import React from 'react';
import PropTypes from 'prop-types';
import {browserHistory} from 'react-router';

import {AppBar, IconButton, Drawer} from 'material-ui';
import NavigationClose from 'material-ui/svg-icons/navigation/close';
import {List, ListItem} from 'material-ui/List';
import AgentIcon from 'material-ui/svg-icons/social/group';
import MerchantIcon from 'material-ui/svg-icons/action/store';
import ReportIcon from 'material-ui/svg-icons/editor/insert-chart';
import {getUser} from '../../../Account/AccountReducer';
import {connect} from 'react-redux';

const navStyle = {
  height: 60,
  backgroundColor: '#3367d6'
};

class DrawerMenu extends React.Component {
  constructor(props) {
    super(props);
    this.handleAgentsClick = this.handleAgentsClick.bind(this);
    this.handleMerchantsClick = this.handleMerchantsClick.bind(this);
    this.handleReportsClick = this.handleReportsClick.bind(this);
  }

  handleAgentsClick() {
    browserHistory.push('/agents');
    // Close drawer
    this.props.switchDrawerState();
  }

  handleMerchantsClick() {
    browserHistory.push('/merchants');
    // Close drawer
    this.props.switchDrawerState();
  }

  handleReportsClick() {
    browserHistory.push('/reports');
    // Close drawer
    this.props.switchDrawerState();
  }

  render() {
    let user = this.props.user;
    if(!user) {
      return null;
    }

    let userRole = null;
    if (user.Privilege) {
      userRole = user.Privilege.PrivilegeName;
    }
    if (userRole) {
      return (
        <Drawer
          docked={false}
          width={this.props.width}
          open={this.props.isOpen}
          onRequestChange={(open) => this.props.switchDrawerState()}>
          <AppBar
            style={navStyle}
            iconElementLeft={
              <span style={{
                color: '#f7f7f7',
                fontSize: '1.5em',
                top: '50%',
                position: 'absolute',
                transform: 'translateY(-50%)'
              }}>
              {userRole} admin
            </span>
            }
            iconElementRight={
              <IconButton onClick={this.props.switchDrawerState}>
                <NavigationClose/>
              </IconButton>}/>
          <List>
            {userRole.toLowerCase() === 'master' &&
            <ListItem primaryText='Agents' onClick={this.handleAgentsClick} leftIcon={<AgentIcon />}/>}
            {
              (userRole.toLowerCase() === 'master' || userRole.toLowerCase() === 'agent')
              && <ListItem primaryText='Merchants' onClick={this.handleMerchantsClick} leftIcon={<MerchantIcon />}/>
            }
            <ListItem primaryText='Reports' onClick={this.handleReportsClick} leftIcon={<ReportIcon />}/>
          </List>
          <span style={{
            bottom: 5,
            left: '50%',
            position: 'fixed',
            transform: 'translateX(-50%)'
          }}>NHT © 2017</span>
        </Drawer>
      );
    }
    return null;
  }
}

DrawerMenu.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  width: PropTypes.number.isRequired,
  switchDrawerState: PropTypes.func.isRequired,
  user: PropTypes.object
};

function mapStateToProps(state) {
  return {
    user: getUser(state)
  };
}

export default connect(mapStateToProps)(DrawerMenu);