import React from 'react';
import Helmet from 'react-helmet';
import Subheader from 'material-ui/Subheader';
import apiCaller from '../../util/apiCaller';
import FlatButton from 'material-ui/FlatButton';
import TextField from 'material-ui/TextField';
import Toggle from 'material-ui/Toggle';
import Dialog from 'material-ui/Dialog';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn,
} from 'material-ui/Table';
import {connect} from 'react-redux';
import {getUser} from '../Account/AccountReducer';

class AgentDetailPage extends React.Component {
  constructor(props) {
    super(props);
    this.agentID = props.location.query.id.trim();
    this.state = {
      agent: null,
      agentActive: false,
      isShowDialog: false,
      message: ''
    };
  }
  componentWillMount() {
    apiCaller(`agent/get?id=${this.agentID}`).then(agent=>{
      console.log('agent load', agent);
      if(agent && agent.AgentId) {
        this.setState({agent, agentActive: agent.Active});
      } else {
        console.log('Agent not found!');
      }
    });
  }
  handleSendMessage = () => {
    this.setState({isShowDialog: true});
  };
  handleActiveCheck = (event, isInputChecked) => {
    let message = isInputChecked?'Do you want to active agent':'Do you want to deactivate agent';
    if(confirm(message )== true) {
      let agent = this.state.agent;
      if(isInputChecked) {
        apiCaller(`agent/activate?id=${agent.AgentId}`, 'put').then(res=>{
          if(res==1) {
            agent.Activate = isInputChecked;
            this.setState({agentActive: isInputChecked});
            alert('Active agent success!');
          } else {
            alert('Active agent failed! Please try again later!');
          }
        });
      } else {
        apiCaller(`agent/inactivate?id=${agent.AgentId}`, 'put').then(res=>{
          if(res==1) {
            agent.Activate = isInputChecked;
            this.setState({agentActive: isInputChecked});
            alert('Deactivate agent success!');
          } else {
            alert('Deactivate agent failed! Please try again later!');
          }
        });
      }
    }
  };
  handleClose = () => {
    this.setState({isShowDialog: false, message: ''});
  };
  handleSubmit = () => {
    //
    let message = this.state.message.trim();
    if(message && message !== '') {
      let agent = this.state.agent;
      let user = this.props.user;
      console.log('user', user);
      let userPrevilege = user.Privilege.PrivilegeName.toLowerCase();
      let userID = null;
      switch (userPrevilege) {
        case 'master':
          userID = user.Master.MasterId;
          break;
        case 'agent':
          userID = user.Master.AgentId;
          break;
        case 'merchant':
          userID = user.Master.MerchantId;
          break;
      }
      let messageObject = {
        UserIdSend: userID,
        UserIdReceive: agent.AgentId,
        MessageTypeId: 1,
        MessageContent: message,
        Time: new Date().toDateString()
      };
      apiCaller('message/send', 'post', messageObject).then((result)=>{
        console.log('message send result:', result);
        if(result == 1) {
          this.setState({isShowDialog: false});
          alert('Message send success!');
        } else {
          alert('Message send failed!');
        }
      });
    }
    console.log('send message', message);
  };
  handleMessageChange = (e) => {
    this.setState({message: e.target.value});
  };

  render() {
    if(!this.state.agent) {
      return null;
    }
    let agent = this.state.agent;
    const actions = [
      <FlatButton
        label="Cancel"
        primary={true}
        onTouchTap={this.handleClose}
        backgroundColor='#eeeeee'
        hoverColor='#eeeeee'
        style={{marginRight: 10}}/>,
      <FlatButton
        label="Send"
        primary={true}
        onTouchTap={this.handleSubmit}
        backgroundColor='#4caf50'
        hoverColor='#4caf50'
        style={{color: '#fff'}}/>
    ];
    return (
      <div>
        <Helmet title="Agent details" />
        <Subheader style={{fontSize: '1.5em'}}>
          <span>Agent details</span>
          <FlatButton
            label="Send Message"
            primary={true}
            onTouchTap={this.handleSendMessage}
            backgroundColor='#4caf50'
            hoverColor='#4caf50'
            style={{color: '#fff', marginLeft: 10}}/>
        </Subheader>
        <div>
          <div className="agent-content" style={{margin: '10px 0'}}>
            <Table style={{height: '100%'}}>
              <TableHeader displaySelectAll={false}
                           adjustForCheckbox={false} style={{backgroundColor: '#3367d6'}}>
                <TableRow>
                  <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>Field</TableHeaderColumn>
                  <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>Value</TableHeaderColumn>
                </TableRow>
              </TableHeader>
              <TableBody displayRowCheckbox={false} stripedRows={true} showRowHover={true}>
                <TableRow>
                  <TableRowColumn>Name</TableRowColumn>
                  <TableRowColumn>{agent.AgentName||'N/A'}</TableRowColumn>
                </TableRow>
                <TableRow>
                  <TableRowColumn>Area</TableRowColumn>
                  <TableRowColumn>{agent.Area?agent.Area.AreaName:'N/A'}</TableRowColumn>
                </TableRow>
                <TableRow>
                  <TableRowColumn>Active</TableRowColumn>
                  <TableRowColumn>
                    <Toggle onToggle={this.handleActiveCheck} toggled={this.state.agentActive}/>
                  </TableRowColumn>
                </TableRow>
              </TableBody>
            </Table>
          </div>
        </div>
        <Dialog
          title="Send message to agent"
          actions={actions}
          modal={false}
          open={this.state.isShowDialog}
          onRequestClose={this.handleClose}
          autoScrollBodyContent={true}>
          <div>
            <TextField onChange={this.handleMessageChange} value={this.state.message}
                       hintText="Type message here..." fullWidth={true}
                       rows={3}/>
          </div>
        </Dialog>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    user: getUser(state)
  };
}

export default connect(mapStateToProps)(AgentDetailPage);