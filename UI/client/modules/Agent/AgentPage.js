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
import MoreVertIcon from 'material-ui/svg-icons/navigation/more-vert';
const agents = [
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
  {
    name: 'NHHS',
    status: 'Disable'
  },
  {
    name: 'SCB',
    status: 'Active'
  },
];

import {browserHistory} from 'react-router';

export default class AgentPage extends React.Component {
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
              <TableHeaderColumn>#</TableHeaderColumn>
              <TableHeaderColumn>Name</TableHeaderColumn>
              <TableHeaderColumn>Status</TableHeaderColumn>
              <TableHeaderColumn/>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false}>
            {
              agents.map((agent, index) => {
                return (
                  <TableRow key={index}>
                    <TableRowColumn>{index}</TableRowColumn>
                    <TableRowColumn>{agent.name}</TableRowColumn>
                    <TableRowColumn>{agent.status}</TableRowColumn>
                    <TableRowColumn>
                      <IconButton><MoreVertIcon/></IconButton>
                    </TableRowColumn>
                  </TableRow>)
              })
            }
          </TableBody>
        </Table>
      </div>
    );
  }
}
