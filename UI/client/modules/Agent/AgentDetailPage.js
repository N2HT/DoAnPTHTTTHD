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

export default class AgentDetailPage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Detail agent" />
        <Subheader style={{fontSize: '1.5em'}}>
          <span>Detail agent</span>
          <IconButton style={{top: 5}} onClick={()=>{browserHistory.push('/agent/new')}}>
            <AddIcon color="#747474"/>
          </IconButton>
        </Subheader>
        <div>
          
        </div>
      </div>
    );
  }
}
