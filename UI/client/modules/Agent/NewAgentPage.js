import React from 'react';
import FlatButton from 'material-ui/FlatButton';
import Dialog from 'material-ui/Dialog';
import TextField from 'material-ui/TextField';
import DropDownMenu from 'material-ui/DropDownMenu';
import MenuItem from 'material-ui/MenuItem';
import Checkbox from 'material-ui/Checkbox';
import {browserHistory} from 'react-router';
import {connect} from 'react-redux';
import {getUser} from '../Account/AccountReducer';
import MD5 from 'md5';

import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn,
} from 'material-ui/Table';

import Subheader from 'material-ui/Subheader';
import IconButton from 'material-ui/IconButton';
import AddIcon from 'material-ui/svg-icons/content/add-circle-outline';
import Helmet from 'react-helmet';

import apiCaller from '../../util/apiCaller';

const styles = {
  uploadButton: {
    verticalAlign: 'middle',
  },
  uploadInput: {
    cursor: 'pointer',
    position: 'absolute',
    top: 0,
    bottom: 0,
    right: 0,
    left: 0,
    width: '100%',
    opacity: 0,
  },
  chip: {
    margin: 4,
  },
  wrapper: {
    display: 'flex',
    flexWrap: 'wrap',
  },
  block: {
    maxWidth: 250,
  },
  toggle: {
    marginBottom: 16,
  },
  thumbOff: {
    backgroundColor: '#ffcccc',
  },
  trackOff: {
    backgroundColor: '#ff9d9d',
  },
  thumbSwitched: {
    backgroundColor: 'red',
  },
  trackSwitched: {
    backgroundColor: '#ff9d9d',
  },
  labelStyle: {
    color: 'red',
  },
};
class NewAgentPage extends React.Component {
  state = {
    selectedRows: [],
    isDialogOpen: false,
    // array mater
    masters: [],
    agents: [],
    areas: [],
    dropValueArea: -1,
    agentName: '',
    agentNameError: '',
    agentActive: false,
    agentUsername: '',
    agentUsernameError: '',
    agentPassword: '',
    agentPasswordError: '',
    agentMatchPassword: '',
    agentMatchPasswordError: ''
  };

  componentWillMount() {
    apiCaller('agent/getAll').then((result) => {
      if (result[0]) {
        console.log('agents', result);
        this.setState({agents: result});
      }
    });
    apiCaller('area/get').then((result) => {
      if (result[0]) {
        this.setState({areas: result});
      }
    });
  }

  // dropdown
  handleChangeArea = (event, index, value) => this.setState({dropValueArea: value});
  handleTextChange = (event) => this.setState({agentName: event.target.value});
  handleActiveCheck = (event, isInputChecked) => this.setState({agentActive: isInputChecked});

  isSelected = (index) => {
    return this.state.selected.indexOf(index) !== -1;
  };

  handleRowSelection = (selectedRows) => {
    this.setState({
      selectedRows: selectedRows
    });
    let selectedAgent = this.state.agents[selectedRows];
    console.log('selected rows', selectedRows);
    console.log('selectedAgent', selectedAgent);
    if(selectedAgent) {
      // Go to detail page
      browserHistory.push(`/agent/details?id=${selectedAgent.AgentId}`);
    } else {
      console.log('Agent not valid!');
    }
  };

  handleAdd = () => {
    console.log('handle click');
    this.setState({isDialogOpen: true});
  };
  handleClose = () => {
    console.log('handleClose');
    this.setState({isDialogOpen: false});
    this.resetFormData();
  };
  validateData() {
    let valid = true;
    if(!this.state.agentName || this.state.agentName==='') {
      this.setState({agentNameError: 'Agent name is required!'});
      valid = false;
    } else {
      this.setState({agentNameError: ''});
    }
    if(!this.state.agentUsername || this.state.agentUsername==='') {
      this.setState({agentUsernameError: 'Username is required!'});
      valid = false;
    } else {
      this.setState({agentUsernameError: ''});
    }
    if(!this.state.agentPassword || this.state.agentPassword==='') {
      this.setState({agentPasswordError: 'Password is required!'});
      valid = false;
    } else {
      this.setState({agentPasswordError: ''});
    }
    if(!this.state.agentMatchPassword || this.state.agentMatchPassword==='') {
      this.setState({agentMatchPasswordError: 'Retype password is required!'});
      valid = false;
    } else if(this.state.agentPassword !== this.state.agentMatchPassword) {
      this.setState({agentMatchPasswordError: 'Password and retype password not match!'});
      valid = false;
    } else {
      this.setState({agentMatchPasswordError: ''});
    }
    return valid;
  }
  handleSubmit = () => {
    console.log('handleSubmit');
    if(!this.validateData()) {
      return;
    }
    let privilege = {
      PrivilegeId: 2,
      PrivilegeName: 'Agent'
    };
    let account = {
      UserName: this.state.agentUsername,
      Password: MD5(this.state.agentPassword),
      Privilege: privilege
    };
    let agent = {
      AgentName: this.state.agentName,
      MasterId: this.props.user.Master.MasterId,
      Activate: this.state.agentActive,
      Area: this.state.dropValueArea == -1 ? null : this.state.areas[this.state.dropValueArea],
      Account: account
    };
    console.log('New agent:', agent);
    apiCaller('agent/add', 'post', agent).then((result) => {
      console.log('result', result);
      if(result && result.AgentId) {
        this.setState((prevState) => ({agents: [...prevState.agents, result]}));
        alert('Save done');
      } else {
        alert('Save failed');
      }
    });
    // Reset form data
    this.resetFormData();
    this.setState({isDialogOpen: false});
  };
  resetFormData() {
    this.setState({
      dropValueArea: -1,
      agentName: '',
      agentNameError: '',
      agentActive: false,
      agentUsername: '',
      agentUsernameError: '',
      agentPassword: '',
      agentPasswordError: '',
      agentMatchPassword: '',
      agentMatchPasswordError: ''
    })
  }

  render() {
    const actions = [
      <FlatButton
        label="Cancel"
        primary={true}
        onTouchTap={this.handleClose}
        backgroundColor='#eeeeee'
        hoverColor='#eeeeee'
        style={{marginRight: 10}}/>,
      <FlatButton
        label="Submit"
        primary={true}
        onTouchTap={this.handleSubmit}
        backgroundColor='#4caf50'
        hoverColor='#4caf50'
        style={{color: '#fff'}}/>
    ];
    return (
      <div>
        <Helmet title="Agents" />
        <Subheader style={{fontSize: '1.5em'}}>
          <span>Agents</span>
          <IconButton style={{top: 5}} onClick={this.handleAdd}>
            <AddIcon color="#747474"/>
          </IconButton>
        </Subheader>
        <Table style={{height: '100%'}} onRowSelection={this.handleRowSelection}>
          <TableHeader displaySelectAll={false}
                       adjustForCheckbox={false} style={{backgroundColor: '#3367d6'}}>
            <TableRow>
              <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>ID</TableHeaderColumn>
              <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>Name</TableHeaderColumn>
              <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>Area</TableHeaderColumn>
              <TableHeaderColumn style={{color: '#fff', fontSize: '1.1em'}}>Status</TableHeaderColumn>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false} stripedRows={true} showRowHover={true}>
            {
              this.state.agents.map((agent, index) => {
                return (
                  <TableRow key={index}>
                    <TableRowColumn>{agent.AgentId||'N/A'}</TableRowColumn>
                    <TableRowColumn>{agent.AgentName||'N/A'}</TableRowColumn>
                    <TableRowColumn>{agent.Area?agent.Area.AreaName:'N/A'}</TableRowColumn>
                    <TableRowColumn>{agent.Activate ? 'Active' : 'In Active'}</TableRowColumn>
                  </TableRow>)
              })
            }
          </TableBody>
        </Table>
        <Dialog
          title="Add new Agent"
          actions={actions}
          modal={false}
          open={this.state.isDialogOpen}
          onRequestClose={this.handleClose}
          autoScrollBodyContent={true}>
          <div>
            <TextField onChange={this.handleTextChange} value={this.state.agentName}
                       hintText="Agent Name *" fullWidth={true}
                       errorText={this.state.agentNameError}/>
            <br />
            <TextField onChange={(e)=>{this.setState({agentUsername: e.target.value})}}
                       value={this.state.agentUsername}
                       hintText="User name *"
                       fullWidth={true}
                       errorText={this.state.agentUsernameError}/>
            <br />
            <TextField onChange={(e)=>{this.setState({agentPassword: e.target.value})}}
                       value={this.state.agentPassword}
                       hintText="Password *" fullWidth={true}
                       errorText={this.state.agentPasswordError}
                       type="password"/>
            <br />
            <TextField onChange={(e)=>{this.setState({agentMatchPassword: e.target.value})}}
                       value={this.state.agentMatchPassword}
                       hintText="Retype password *" fullWidth={true}
                       errorText={this.state.agentMatchPasswordError}
                       type="password"/>
            <br />
            <DropDownMenu style={{marginLeft: -24}} value={this.state.dropValueArea} onChange={this.handleChangeArea}>
              <MenuItem key={-1} value={-1} primaryText="None" label="Select area"/>
              {
                this.state.areas.map((area, index) => {
                  return (
                    <MenuItem key={index} value={index} primaryText={area.AreaName}/>
                  )
                })
              }
            </DropDownMenu>
            <br />
            <Checkbox
              label="Active"
              style={{marginBottom: 16}}
              onCheck={this.handleActiveCheck}
            />
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

export default connect(mapStateToProps)(NewAgentPage);