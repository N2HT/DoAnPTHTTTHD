import React from 'react';
import {
  Table,
  TableBody,
  TableHeader,
  TableHeaderColumn,
  TableRow,
  TableRowColumn,
} from 'material-ui/Table';
import {Link} from 'react-router';
import Helmet from 'react-helmet';
import {callJavaApi} from '../../../../util/apiCaller';
import {getUser} from '../../../Account/AccountReducer';
import {connect} from 'react-redux';
import {PieChart, Pie, Sector, Cell, Tooltip} from 'recharts';
import RefreshIndicator from 'material-ui/RefreshIndicator';

const cardTypes = [
  'Visa Card',
  'Master Card',
  'Debit Card',
  'Foreign Key Card'
];

const COLORS = ['#0088FE', '#00C49F', '#FFBB28', '#FF8042'];
const RADIAN = Math.PI / 180;
const renderCustomizedLabel = ({cx, cy, midAngle, innerRadius, outerRadius, percent, name, index}) => {
  const radius = innerRadius + (outerRadius - innerRadius) * 0.5;
  const x = cx + radius * Math.cos(-midAngle * RADIAN);
  const y = cy + radius * Math.sin(-midAngle * RADIAN);

  return (
    <text x={x} y={y} fill="white" textAnchor={x > cx ? 'start' : 'end'} dominantBaseline="central">
      {`${(percent * 100).toFixed(0)}%`}
    </text>
  );
};

const pieChartRadius = 120;
const pieChartSize = pieChartRadius * 2;

class HomePage extends React.Component {
  state = {
    reportRecords: [],
    cardChartData: [],
    dataLoaded: false
  };
  componentWillMount() {
    let user = this.props.user;
    if(!user) {
      return;
    }
    this.setState({dataLoaded: false})
    let userRole = null;
    if (user.Privilege) {
      userRole = user.Privilege.PrivilegeName;
    }
    console.log('user', user);
    let currentDate = new Date();
    let stringDate = `${currentDate.getMonth()+1}-${currentDate.getDate()}-${currentDate.getFullYear()}`;
    switch (userRole.toLowerCase()) {
      case 'master':
        callJavaApi(`report/master/dailyReport/${user.Master.MasterId}/${stringDate}`).then((results)=>{
          console.log('results', results);
          if(results && results[0]) {
            this.setState({reportRecords: results});
            let cardChartData = [];
            results.map((record) => {
              if(record.netAmount>0) {
                cardChartData.push({
                  name: cardTypes[record.cardType-1],
                  value: record.netAmount
                })
              }
            });
            console.log('cardChartData', cardChartData);
            this.setState({cardChartData, dataLoaded: true});
          } else {
            console.log('Data empty');
          }
        });
        break;
      case 'agent':
        callJavaApi(`report/agent/dailyReport/${user.Agent.AgentId}/${stringDate}`).then((results)=>{
          console.log('results', results);
          if(results && results[0]) {
            this.setState({reportRecords: results});
            let cardChartData = [];
            results.map((record) => {
              if(record.netAmount>0) {
                cardChartData.push({
                  name: cardTypes[record.cardType-1],
                  value: record.netAmount
                })
              }
            });
            console.log('cardChartData', cardChartData);
            this.setState({cardChartData, dataLoaded: true});
          } else {
            console.log('Data empty');
          }
        });
        break;
      case 'merchant':
        callJavaApi(`report/merchant/dailyReport/${user.Merchant.MerchantId}/${stringDate}`).then((results)=>{
          console.log('results', results);
          if(results && results[0]) {
            this.setState({reportRecords: results});
            let cardChartData = [];
            results.map((record) => {
              if(record.netAmount>0) {
                cardChartData.push({
                  name: cardTypes[record.cardType-1],
                  value: record.netAmount
                })
              }
            });
            console.log('cardChartData', cardChartData);
            this.setState({cardChartData, dataLoaded: true});
          } else {
            console.log('Data empty');
          }
        });
        break;
      default:
        console.log('User role not valid!');
    }
  }
  render() {
    let currentDate = new Date();
    let stringDate = `${currentDate.getDate()}-${currentDate.getMonth()+1}-${currentDate.getFullYear()}`;
    return (
      <div>
        <Helmet title="Home"/>
        <h1>Dashboard</h1>
        <h3>Daily report: {stringDate}</h3>
        <div style={{position: 'relative', width: '100%', margin: '10px 0', display: this.state.dataLoaded?'block':'none'}}>
          <PieChart style={{left: '50%', transform: 'translateX(-50%)'}}
                    width={pieChartSize} height={pieChartSize+100} onMouseEnter={this.onPieEnter}>
            <Pie
              data={this.state.cardChartData}
              labelLine={false}
              label={renderCustomizedLabel}
              outerRadius={pieChartRadius}
              fill="#8884d8"
              animationBegin={200}
              animationDuration={800}
            >
              {
                this.state.cardChartData.map((entry, index) => <Cell key={index} fill={COLORS[index % COLORS.length]}/>)
              }
            </Pie>
            <Tooltip/>
          </PieChart>
        </div>
        <div style={{display: this.state.dataLoaded?'block':'none'}}>
          <Table style={{ height: '100%' }}>
            <TableHeader displaySelectAll={false}
                         adjustForCheckbox={false}
            >
              <TableRow>
                <TableHeaderColumn>#</TableHeaderColumn>
                <TableHeaderColumn>Card Type</TableHeaderColumn>
                <TableHeaderColumn>Sale Amount</TableHeaderColumn>
                <TableHeaderColumn>Return Amount</TableHeaderColumn>
                <TableHeaderColumn>Sale Count</TableHeaderColumn>
                <TableHeaderColumn>Return Count</TableHeaderColumn>
                <TableHeaderColumn>Net Amount</TableHeaderColumn>
                <TableHeaderColumn>From Date</TableHeaderColumn>
              </TableRow>
            </TableHeader>
            <TableBody displayRowCheckbox={false}>
              {
                this.state.reportRecords.map((row, index) => {
                  return (
                    <TableRow key={index}>
                      <TableRowColumn>{index}</TableRowColumn>
                      <TableRowColumn>{row.cardType?cardTypes[row.cardType-1]:"N/A"}</TableRowColumn>
                      <TableRowColumn>{row.saleAmount}</TableRowColumn>
                      <TableRowColumn>{row.returnAmount}</TableRowColumn>
                      <TableRowColumn>{row.saleCount}</TableRowColumn>
                      <TableRowColumn>{row.returnCount}</TableRowColumn>
                      <TableRowColumn>{row.netAmount}</TableRowColumn>
                      <TableRowColumn>
                        <span>{new Date(row.fromDate).toLocaleDateString('vi-US')}</span>
                      </TableRowColumn>
                    </TableRow>);
                })
              }
            </TableBody>
          </Table>
        </div>
        <div style={{position: 'absolute', transform: 'translate(-50%, -50%)', top: '50%', left: '50%', display: this.state.dataLoaded?'none':'block'}}>
          <RefreshIndicator
            size={40}
            left={10}
            top={0}
            status="loading"
            style={{
              display: 'inline-block',
              position: 'relative'
            }}
          />
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return {
    user: getUser(state)
  };
}

export default connect(mapStateToProps)(HomePage);
