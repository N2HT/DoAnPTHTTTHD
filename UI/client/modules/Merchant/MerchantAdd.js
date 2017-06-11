/* eslint-disable react/jsx-first-prop-new-line,react/jsx-indent,react/jsx-indent-props */
import React from 'react';
import Helmet from 'react-helmet';
import SubHeader from 'material-ui/Subheader';
import TextField from 'material-ui/TextField';
import RaisedButton from 'material-ui/RaisedButton';
import apiCaller from '../../util/apiCaller';

const style = {
    margin: 12
};

export default class MerchantAdd extends React.Component {
    state = {
        merchantName: '',
        merchantNameError: '',
        merchantAddress: '',
        merchantAddressError: ''
    };

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
                    <RaisedButton label="Save" primary={true} style={style} onClick={this.handleSaveMerchant} />
                </div>
            </div>
        );
    }
    handleSaveMerchant = () => {
        let merchant = {
            MerchantName: this.state.merchantName,
            Address: this.state.merchantAddress
        };
        apiCaller('merchant/add', 'post', merchant).then((result) => {
            if(result == 1) {
                alert('Save done');
            } else {
                alert('Save failed');
            }
        });
    }
}
