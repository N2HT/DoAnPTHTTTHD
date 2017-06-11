import React from 'react';
import FlatButton from 'material-ui/FlatButton';
import Dialog from 'material-ui/Dialog';
import ContentAdd from 'material-ui/svg-icons/content/add';
import TextField from 'material-ui/TextField';
import DropDownMenu from 'material-ui/DropDownMenu';
import MenuItem from 'material-ui/MenuItem';
import Chip from 'material-ui/Chip';
import Toggle from 'material-ui/Toggle';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn,
} from 'material-ui/Table';

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
export default class NewAgentPage extends React.Component {

  state = {
    selected: [1],
    isDialogOpen: false,
    dropValueMaster: -1,
    dropValueparents: -1,
    dropValueArea: -1,
    dropValueAccount: -1,
    textValue: '',
    isToogleChage: false,
    // array mater
    masters: [],
    parents: [],
    areas: [],
    accounts: []
  };

  componentWillMount() {
    apiCaller('master/get').then((result) => {
      if (result[0]) {
        this.setState({masters: result});
      }
    });
    apiCaller('agent/getAll').then((result) => {
      if (result[0]) {
        this.setState({parents: result});
      }
    });
    apiCaller('area/get').then((result) => {
      if (result[0]) {
        this.setState({areas: result});
      }
    });
    apiCaller('user/get').then((result) => {
      if (result[0]) {
        this.setState({accounts: result});
      }
    });
  }

  // dropdown
  handleChangeMaster = (event, index, value) => this.setState({dropValueMaster: value});
  handleChangeParent = (event, index, value) => this.setState({dropValueparents: value});
  handleChangeArea = (event, index, value) => this.setState({dropValueArea: value});
  handleChangeAccount = (event, index, value) => this.setState({dropValueAccount: value});
  handleTextChange = (event) => this.setState({textValue: event.target.value});
  handleToogleChange = (event, isInputChecked) => this.setState({isToogleChage: isInputChecked});

  isSelected = (index) => {
    return this.state.selected.indexOf(index) !== -1;
  };

  handleRowSelection = (selectedRows) => {
    this.setState({
      selected: selectedRows,
    });
  };

  handleAdd = () => {
    console.log('handle click');
    this.setState({isDialogOpen: true});
  };
  handleClose = () => {
    console.log('handleClose');
    this.setState({isDialogOpen: false});
  };
  handleSubmit = () => {
    console.log('handleSubmit');
    let agent = {
      AgentName: this.state.textValue,
      MasterId: this.state.dropValueMaster,
      ParentAgentId: this.state.dropValueparents,
      Activate: this.state.isToogleChage,
      AreaId: this.state.dropValueArea,
      AccountId: this.state.dropValueAccount
    };
    apiCaller('agent/add', 'post', agent).then((result) => {
      console.log('result', result);
      if(result.AgentId) {
        this.setState((prevState) => ({parents: [...prevState.parents, result]}));
        alert('Save done');
      } else {
        alert('Save failed');
      }
    });
    this.setState({isDialogOpen: false});
  };

  render() {
    const actions = [
      <FlatButton
        label="Cancel"
        primary={true}
        onTouchTap={this.handleClose}
      />,
      <FlatButton
        label="Submit"
        primary={true}
        keyboardFocused={true}
        onTouchTap={this.handleSubmit}
      />,
    ];
    return (
      <div>
        <FlatButton onClick={this.handleAdd} label="Add" labelPosition="before" primary={true} icon={<ContentAdd />}/>
        <Table style={{height: '100%'}} onRowSelection={this.handleRowSelection}>
          <TableHeader displaySelectAll={false}
                       adjustForCheckbox={false}>
            <TableRow>
              <TableHeaderColumn>ID</TableHeaderColumn>
              <TableHeaderColumn>Name</TableHeaderColumn>
              <TableHeaderColumn>Area</TableHeaderColumn>
              <TableHeaderColumn>Status</TableHeaderColumn>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false}>
            {
              this.state.parents.map((agent, index) => {
                return (
                  <TableRow key={index}>
                    <TableRowColumn>{agent.AgentId}</TableRowColumn>
                    <TableRowColumn>{agent.AgentName}</TableRowColumn>
                    <TableRowColumn>{agent.Area?agent.Area.AreaName:''}</TableRowColumn>
                    <TableRowColumn>{agent.Activate ? 'Active' : 'In Active'}</TableRowColumn>
                  </TableRow>)
              })
            }
          </TableBody>
        </Table>
        <Dialog
          title="Dialog With Actions"
          actions={actions}
          modal={false}
          open={this.state.isDialogOpen}
          onRequestClose={this.handleClose}
          autoScrollBodyContent={true}
        >
          <div>
            <TextField onChange={this.handleTextChange} value={this.state.textValue}
                       hintText="Agent Name"
            />
            <br />
            <DropDownMenu value={this.state.dropValueMaster} onChange={this.handleChangeMaster}>
              {
                this.state.masters.map((mater, index) => {
                  return (
                    <MenuItem key={index} value={mater.MasterId} primaryText={mater.MasterName}/>
                  )
                })
              }
            </DropDownMenu>
            <br />
            <DropDownMenu value={this.state.dropValueparents} onChange={this.handleChangeParent}>
              {
                this.state.parents.map((paren, index) => {
                  return (
                    <MenuItem key={index} value={paren.AgentId} primaryText={paren.AgentName}/>
                  )
                })
              }
            </DropDownMenu>
            <br />
            <Toggle onToggle={this.handleToogleChange}
                    label="Active"
                    style={styles.toggle}
            />
            <br />
            <DropDownMenu value={this.state.dropValueArea} onChange={this.handleChangeArea}>
              {
                this.state.areas.map((area, index) => {
                  return (
                    <MenuItem key={index} value={area.AreaId} primaryText={area.AreaName}/>
                  )
                })
              }
            </DropDownMenu>
            <br />
            <DropDownMenu value={this.state.dropValueAccount} onChange={this.handleChangeAccount}>
              {
                this.state.accounts.map((account, index) => {
                  return (
                    <MenuItem key={index} value={account.AccountId} primaryText={account.UserName}/>
                  )
                })
              }
            </DropDownMenu>
          </div>
        </Dialog>
      </div>
    );
  }
}
