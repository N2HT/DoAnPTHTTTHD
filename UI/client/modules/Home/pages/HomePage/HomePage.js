import React from 'react';
import {Link} from 'react-router';

export default class HomePage extends React.Component {
  render() {
    return (
      <div>
        <h1>Home page</h1>
        <Link to='/about'>About us</Link>
      </div>
    );
  }
}
