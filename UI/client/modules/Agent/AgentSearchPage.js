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
    agents: []
  };

  componentWillMount() {
    let keyword = this.props.location.query.keyword.toLowerCase().trim();
    apiCaller(`agent/search?name=${keyword}`).then((result) => {
      console.log('result search', result);
      if (result[0]) {
        this.setState({agents: result});
      }
    });
  }

  handleTextChange = (event) => this.setState({agentName: event.target.value});

  handleRowSelection = (selectedRows) => {
    this.setState({
      selectedRows: selectedRows
    });
    let selectedAgent = this.state.agents[selectedRows];
    console.log('selected rows', selectedRows);
    console.log('selectedAgent', selectedAgent);
    if(selectedAgent) {
      // Go to detail page
      browserHistory.push(`/agent/details/${selectedAgent.AgentId}`);
    } else {
      console.log('Agent not valid!');
    }
  };

  render() {
    return (
      <div>
        <Helmet title="Search agents" />
        <Subheader style={{fontSize: '1.5em'}}>
          <span>Search agents</span>
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