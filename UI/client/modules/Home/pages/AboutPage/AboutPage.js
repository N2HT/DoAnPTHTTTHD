import React from 'react';
import {Link} from 'react-router';
import Helmet from 'react-helmet';

export default class AboutPage extends React.Component {
  render() {
    return (
      <div>
        <Helmet title="About" />
        <h1>About page</h1>
        <ul>
          <li>1542250 - Nguyễn Thanh Nhàn - thanhnhan7794@gmail.com</li>
          <li>1542223 - Trần Đình Hiệp - trandinhhiephtd@gmail.com</li>
          <li>1542282 - Nguyễn Văn Trọng - nguyentrong1701@gmail.com</li>
          <li>1542226 - Ngô Trung Hiếu - ngotrunghieu10@gmail.com</li>
          <li>1542289 - Nguyễn Thị Trí Tuệ - ntttue.gl@gmail.com</li>
          <Link to='/'>Back</Link>
        </ul>
      </div>
    );
  }
}
