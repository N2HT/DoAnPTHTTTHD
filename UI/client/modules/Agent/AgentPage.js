import React from 'react';
import Helmet from 'react-helmet';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn
} from 'material-ui/Table';
import Subheader from 'material-ui/Subheader';
import IconButton from 'material-ui/IconButton';
import AddIcon from 'material-ui/svg-icons/content/add-circle-outline';
import {browserHistory} from 'react-router';
import apiCaller from '../../util/apiCaller';

export default class AgentPage extends React.Component {
  state = {
    agents: []
  };
  componentWillMount() {
    apiCaller('agent/getAll').then((result) => {
      if(result[0]) {
        this.setState({agents : result});
      }
    });
  }
  render() {
    return (
      <div>
        <Helmet title="Agents" />
        <Subheader style={{fontSize: '1.5em'}}>
          <span>Agents</span>
          <IconButton style={{top: 5}} onClick={()=>{browserHistory.push('/agent/new')}}>
            <AddIcon color="#747474"/>
          </IconButton>
        </Subheader>
        <Table style={{height: '100%'}}>
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
              this.state.agents.map((agent, index) => {
                return (
                  <TableRow key={index}>
                    <TableRowColumn>{agent.AgentId}</TableRowColumn>
                    <TableRowColumn>{agent.AgentName}</TableRowColumn>
                    <TableRowColumn>{agent.Area.AreaName}</TableRowColumn>
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
