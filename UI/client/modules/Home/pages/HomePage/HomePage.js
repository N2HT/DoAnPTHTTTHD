import React from 'react';
import {Link} from 'react-router';
import Helmet from 'react-helmet';
import apiCaller from '../../../../util/apiCaller';

export default class HomePage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Home" />
        <h1>Home page</h1>
        <input type="button" onClick={()=>{
          apiCaller('test').then((data)=>{
            console.log('data receive', data);
          });
        }} value="Test API auth"/>
        <Link to='/about'>About us</Link>
      </div>
    );
  }
}
