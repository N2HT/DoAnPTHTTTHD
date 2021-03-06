/* eslint-disable react/jsx-first-prop-new-line,react/jsx-indent */
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
import SubHeader from 'material-ui/Subheader';
import IconButton from 'material-ui/IconButton';
import AddIcon from 'material-ui/svg-icons/content/add-circle-outline';
import {browserHistory} from 'react-router';
import apiCaller from '../../util/apiCaller';

export default class MerchantPage extends React.Component {
  state = {
    merchants: [],
  };

  componentWillMount() {
    let keyword = this.props.location.query.keyword.toLowerCase().trim();
    apiCaller(`merchant/search?name=${keyword}`).then((result) => {
      if (result[0]) {
        this.setState({merchants: result});
      }
    });
  }

  render() {
    return (
      <div>
        <Helmet title="Merchants"/>
        <SubHeader style={{fontSize: '1.5em'}}>
          <span>Merchants</span>
          <IconButton style={{top: 5}} onClick={() => {
            browserHistory.push('/merchant/add');
          }}>
            <AddIcon color="#747474"/>
          </IconButton>
        </SubHeader>
        <Table style={{height: '100%'}}>
          <TableHeader displaySelectAll={false}
                       adjustForCheckbox={false}
          >
            <TableRow>
              <TableHeaderColumn>ID</TableHeaderColumn>
              <TableHeaderColumn>Merchant Name</TableHeaderColumn>
              <TableHeaderColumn>Address</TableHeaderColumn>
              <TableHeaderColumn>Begin Day</TableHeaderColumn>
              <TableHeaderColumn>Merchant Type</TableHeaderColumn>
              <TableHeaderColumn>Area</TableHeaderColumn>
              <TableHeaderColumn>Is Activate</TableHeaderColumn>
            </TableRow>
          </TableHeader>
          <TableBody displayRowCheckbox={false} stripedRows={true} showRowHover={true}>
            {
              this.state.merchants.map((merchant, index) => {
                return (
                  <TableRow striped={true} key={index}>
                    <TableRowColumn>{merchant.MerchantId||'N/A'}</TableRowColumn>
                    <TableRowColumn>{merchant.MerchantName||'N/A'}</TableRowColumn>
                    <TableRowColumn>{merchant.Address||'N/A'}</TableRowColumn>
                    <TableRowColumn>
                      <span>{merchant.BeginDay?new Date(merchant.BeginDay).toLocaleDateString('vi-US'):'N/A'}</span>
                    </TableRowColumn>
                    <TableRowColumn>{merchant.MerchantType?merchant.MerchantType.MerchantTypeName||'N/A':'N/A'}</TableRowColumn>
                    <TableRowColumn>{merchant.Area?merchant.Area.AreaName||'N/A':'N/A'}</TableRowColumn>
                    <TableRowColumn>{merchant.Activate ? 'Activate' : 'In Activate'}</TableRowColumn>
                  </TableRow>);
              })
            }
          </TableBody>
        </Table>
      </div>
    );
  }
}
