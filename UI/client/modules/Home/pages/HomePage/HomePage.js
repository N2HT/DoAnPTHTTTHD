import React from 'react';
import {Link} from 'react-router';
import Helmet from 'react-helmet';

export default class HomePage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="Home" />
        <h1>Home page</h1>
        <Link to='/about'>About us</Link>
      </div>
    );
  }
}
