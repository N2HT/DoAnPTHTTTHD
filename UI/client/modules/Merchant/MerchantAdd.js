/* eslint-disable react/jsx-first-prop-new-line,react/jsx-indent,react/jsx-indent-props */
import React from 'react';
import Helmet from 'react-helmet';
import SubHeader from 'material-ui/Subheader';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import apiCaller from '../../util/apiCaller';
import Checkbox from 'material-ui/Checkbox';
import MD5 from 'md5';

import {browserHistory} from 'react-router';
import {connect} from 'react-redux';
import {getUser} from '../Account/AccountReducer';

const style = {
    margin: 12
};

class MerchantAdd extends React.Component {
    state = {
        merchantName: '',
        merchantNameError: '',
        merchantAddress: '',
        merchantAddressError: '',
        merchantUsername: '',
        merchantPassword: '',
        merchantActive: false
    };

    handleActiveCheck = (event, isInputChecked) => this.setState({merchantActive: isInputChecked});

    render() {
        return (
            <div>
                <Helmet title="Add Merchant"/>
                <SubHeader style={{fontSize: '1.5em'}}>
                    <span>Add Merchant</span>
                </SubHeader>
                <div>
                    <TextField
                        fullWidth={true}
                        hintText="Merchant name"
                        errorText={this.state.merchantNameError}
                        value={this.state.merchantName}
                        onChange={(e) => {
                            this.setState({merchantName: e.target.value})
                        }}
                    />
                    <br />
                    <TextField
                        fullWidth={true}
                        hintText="Merchant address"
                        errorText={this.state.merchantAddressError}
                        value={this.state.merchantAddress}
                        onChange={(e) => {
                            this.setState({merchantAddress: e.target.value})
                        }}
                    />
                    <TextField
                        fullWidth={true}
                        hintText="Username"
                        value={this.state.merchantUsername}
                        onChange={(e) => {
                            this.setState({merchantUsername: e.target.value})
                        }}
                    />
                    <TextField
                        fullWidth={true}
                        type="password"
                        hintText="Password"
                        value={this.state.merchantPassword}
                        onChange={(e) => {
                            this.setState({merchantPassword: e.target.value})
                        }}
                    />
                    <br />
                    <Checkbox
                      label="Active"
                      style={{marginBottom: 16}}
                      onCheck={this.handleActiveCheck}
                    />
                    <RaisedButton label="Save" primary={true} style={style} onClick={this.handleSaveMerchant} />
                </div>
            </div>
        );
    }
    handleSaveMerchant = () => {
        let privilege = {
            PrivilegeId: 3,
            PrivilegeName: 'Merchant'
        };
        let account = {
            UserName: this.state.merchantUsername,
            Password: MD5(this.state.merchantPassword),
            Privilege: privilege
        };
        let merchant = {
            MerchantName: this.state.merchantName,
            MasterId: this.props.user.Master.MasterId,
            Activate: this.state.merchantActive,
            Address: this.state.merchantAddress,
            Account: account
        };
        console.log('New merchant:', merchant);
        apiCaller('merchant/add', 'post', merchant).then((result) => {
            console.log('result', result);
            if(result && result.MerchantId) {
                alert('Save done');
                browserHistory.push('/merchants')
            } else {
                alert('Save failed');
            }
        });
    }
}

function mapStateToProps(state) {
    return {
        user: getUser(state)
    };
}

export default connect(mapStateToProps)(MerchantAdd);