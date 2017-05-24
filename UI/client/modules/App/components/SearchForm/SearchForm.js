import React, {Component} from 'react';

import SearchIcon from 'material-ui/svg-icons/action/search';
import IconButton from 'material-ui/IconButton';
import TextField from 'material-ui/TextField';

const styles = {
  wrapper: {
    backgroundColor: '#2850a7',
    height: 40,
    margin: '10px 40px 0 60px',
    borderRadius: 2,
    position: 'relative'
  },
  searchIcon: {
    position: 'absolute'
  },
  searchInput: {
    lineHeight: 40,
    height: 40,
    width: '100%',
    paddingRight: 30,
    position: 'absolute',
    color: '#fff'
  },
  textField: {
    position: 'relative',
    marginLeft: 40,
    width: '100%'
  },
  hint: {position: 'absolute', top: 12, color: '#738dc6'},
  icon: {width: 30, height: 30, padding: 5, marginTop: 5, marginLeft: 5, position: 'absolute'}
};
const iconViewBox = '0 0 30 30';

export default class SearchForm extends Component {
  constructor(props) {
    super(props);
    this.state = {inputValue: ''};
    this.handleTextChange = this.handleTextChange.bind(this);
  }

  handleTextChange(e) {
    let inputValue = e.target.value;
    this.setState({inputValue});
  }
  
  render() {
    return (
      <div style={styles.wrapper}>
        <IconButton style={styles.icon}>
          <SearchIcon viewBox={iconViewBox} color="#fff" />
        </IconButton>
        <TextField
          onChange={this.handleTextChange}
          value={this.state.inputValue}
          hintText="Search..."
          inputStyle={styles.searchInput}
          style={styles.textField}
          hintStyle={styles.hint}
          underlineShow={false} />
      </div>
    );
  }
}