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

const merchants = [
  {
    name: 'Cửa hàng của em',
    status: 'Ngon lành'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
  {
    name: 'Cửa hàng của đứa kế bên',
    status: 'Dẹp tiệm'
  },
  {
    name: 'Cửa hàng của em',
    status: 'Active'
  },
];

export default class MerchantPage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Merchants" />
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
              merchants.map((merchant, index) => {
                return (
                  <TableRow>
                    <TableRowColumn>{index}</TableRowColumn>
                    <TableRowColumn>{merchant.name}</TableRowColumn>
                    <TableRowColumn>{merchant.status}</TableRowColumn>
                  </TableRow>)
              })
            }
          </TableBody>
        </Table>
      </div>
    );
  }
}
