import React from 'react';
import {Link} from 'react-router';
export default class HomePage extends React.Component {
  render() {
    return (
      <div>
        <h1>Home page</h1>
        <span>This is Home Page -_-</span>
        <br />
        <span>Oh yeah! The Home Page loaded!</span>
        <br />
        <Link to='/about'>About us</Link>
      </div>
    );
  }
}
