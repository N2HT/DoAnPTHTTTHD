import React from 'react';
import {Link} from 'react-router';
import Test from '../../../../../models/test';

export default class HomePage extends React.Component {
  constructor(props) {
    super(props);
    this.user = Test;
    this.user.age = 30;

  }
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
