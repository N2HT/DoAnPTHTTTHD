import React from 'react';
import PropTypes from 'prop-types';
import {AppBar, IconButton, Drawer} from 'material-ui';
import NavigationClose from 'material-ui/svg-icons/navigation/close';
import {List, ListItem} from 'material-ui/List';

import ContentInbox from 'material-ui/svg-icons/content/inbox';
import ActionGrade from 'material-ui/svg-icons/action/grade';
import ContentSend from 'material-ui/svg-icons/content/send';
import ContentDrafts from 'material-ui/svg-icons/content/drafts';

const navStyle = {
  height: 60,
  backgroundColor: '#3367d6'
};

const menuItems = [
  "Agents",
  "Merchants",
  "Reports"
];

export default class DrawerMenu extends React.Component {
  render() {
    return (
      <Drawer
        width={this.props.width}
        open={this.props.isOpen}>
        <AppBar
          style={navStyle}
          title="MENU"
          iconElementLeft={
            <IconButton style={{cursor: 'default'}}/>
          }
          iconElementRight={
            <IconButton onClick={this.props.switchDrawerState}>
              <NavigationClose/>
            </IconButton>}/>
        <List>
          {
            menuItems.map((menuItem, index)=>
              <ListItem primaryText={menuItem} key={index} leftIcon={<ContentInbox />}/>
            )
          }
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
}

DrawerMenu.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  width: PropTypes.number.isRequired,
  switchDrawerState: PropTypes.func.isRequired
};