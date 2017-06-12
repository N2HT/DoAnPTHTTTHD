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
import apiCaller from '../../../../util/apiCaller';

import {PieChart, Pie, Sector, Cell, Tooltip} from 'recharts';
const data = [
  {name: 'Card A', value: 400},
  {name: 'Card B', value: 300},
  {name: 'Card C', value: 300},
  {name: 'Card D', value: 200}
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

const tableData = [
  {
    cardType: "1",
    saleAmount: 100000,
    returnAmount: 20000,
    saleCount: 100,
    returnCount: 20,
    netAmount: 50,
    fromDate: "2017-05-09"
  },{
    cardType: "2",
    saleAmount: 100000,
    returnAmount: 20000,
    saleCount: 100,
    returnCount: 20,
    netAmount: 50,
    fromDate: "2017-05-10"
  },{
    cardType: "3",
    saleAmount: 100000,
    returnAmount: 20000,
    saleCount: 100,
    returnCount: 20,
    netAmount: 50,
    fromDate: "2017-05-22"
  },
];

const pieChartRadius = 120;
const pieChartSize = pieChartRadius * 2;

export default class HomePage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Home"/>
        <h1>Dashboard</h1>
        <div style={{position: 'relative', width: '100%', margin: '10px 0'}}>
          <PieChart style={{left: '50%', transform: 'translateX(-50%)'}}
                    width={pieChartSize} height={pieChartSize+100} onMouseEnter={this.onPieEnter}>
            <Pie
              data={data}
              labelLine={false}
              label={renderCustomizedLabel}
              outerRadius={pieChartRadius}
              fill="#8884d8"
              animationBegin={200}
              animationDuration={800}
            >
              {
                data.map((entry, index) => <Cell key={index} fill={COLORS[index % COLORS.length]}/>)
              }
            </Pie>
            <Tooltip/>
          </PieChart>
        </div>
        <div>
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
                tableData.map((row, index) => {
                  return (
                    <TableRow key={index}>
                      <TableRowColumn>{index}</TableRowColumn>
                      <TableRowColumn>{row.cardType?row.cardType:"N/A"}</TableRowColumn>
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
      </div>
    );
  }
}
