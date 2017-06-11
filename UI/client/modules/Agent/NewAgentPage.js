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
    dropValueParens:-1,
    // array mater
    masters: [],
    parens:[],
    areas:[]
  };
  componentWillMount() {
    apiCaller('master/get').then((result) => {
      if(result[0]) {
        this.setState({masters : result});
      }
    });
    apiCaller('agent/getAll').then((result) => {
      if(result[0]) {
        this.setState({parens : result});
      }
    });
    apiCaller('agent/getAll').then((result) => {
      if(result[0]) {
        this.setState({parens : result});
      }
    });
  }
  // dropdown
  handleChangeMaster = (event, index, value) => this.setState({dropValueMaster:value});
  handleChangeParent = (event, index, value) => this.setState({dropValueParens:value});
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
    ///
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
      <Table onRowSelection={this.handleRowSelection}>
        <TableHeader>
          <TableRow>
            <TableHeaderColumn>ID</TableHeaderColumn>
            <TableHeaderColumn>Name</TableHeaderColumn>
            <TableHeaderColumn>Status</TableHeaderColumn>
          </TableRow>
        </TableHeader>
        <TableBody>
          <TableRow selected={this.isSelected(0)}>
            <TableRowColumn>1</TableRowColumn>
            <TableRowColumn>John Smith</TableRowColumn>
            <TableRowColumn>Employed</TableRowColumn>
          </TableRow>
          <TableRow selected={this.isSelected(1)}>
            <TableRowColumn>2</TableRowColumn>
            <TableRowColumn>Randal White</TableRowColumn>
            <TableRowColumn>Unemployed</TableRowColumn>
          </TableRow>
          <TableRow selected={this.isSelected(2)}>
            <TableRowColumn>3</TableRowColumn>
            <TableRowColumn>Stephanie Sanders</TableRowColumn>
            <TableRowColumn>Employed</TableRowColumn>
          </TableRow>
          <TableRow>
            <TableRowColumn selected={this.isSelected(3)}>4</TableRowColumn>
            <TableRowColumn>Steve Brown</TableRowColumn>
            <TableRowColumn>Employed</TableRowColumn>
          </TableRow>
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
          <TextField
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
          <DropDownMenu value={this.state.dropValueParens} onChange={this.handleChangeParent}>
            {
              this.state.parens.map((paren, index) => {
                return (
                  <MenuItem key={index} value={paren.AgentId} primaryText={paren.AgentName}/>
                )
              })
            }
          </DropDownMenu>
          <br />
          <Toggle
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
          <DropDownMenu value={this.state.dropValue} onChange={this.handleChange}>
            <MenuItem value={1} label="Account" primaryText="Morning" />
            <MenuItem value={2} primaryText="Afternoon" />
            <MenuItem value={3} primaryText="Evening" />
            <MenuItem value={4} primaryText="Night" />
          </DropDownMenu>
        </div>
      </Dialog>
    </div>
    );
  }
}
