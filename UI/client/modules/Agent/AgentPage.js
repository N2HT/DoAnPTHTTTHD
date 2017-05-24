import React from 'react';
import Helmet from 'react-helmet';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn,
} from 'material-ui/Table';

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

export default class AgentPage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Agents" />
        <Table>
          <TableHeader displaySelectAll={false}
                       adjustForCheckbox={false}>
            <TableRow>
              <TableHeaderColumn>#</TableHeaderColumn>
              <TableHeaderColumn>Name</TableHeaderColumn>
              <TableHeaderColumn>Status</TableHeaderColumn>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false}>
            {
              agents.map((agent, index) => {
                return (
                  <TableRow>
                    <TableRowColumn>{index}</TableRowColumn>
                    <TableRowColumn>{agent.name}</TableRowColumn>
                    <TableRowColumn>{agent.status}</TableRowColumn>
                  </TableRow>)
              })
            }
          </TableBody>
        </Table>
      </div>
    );
  }
}
