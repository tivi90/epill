import React from "react";

import {HashRouter as Router, Link, Route, Switch} from "react-router-dom";
import {translate} from "react-i18next";
import {withRouter} from "react-router-dom";

import User from "./../util/User";
import UserMenue from "./user_menue";
import AutoComplete from "./auto_complete";
import MenueItem from "./menue_item";


class Navigation extends React.Component {

    constructor(props) {
        super(props);
    }

    componentDidMount() {

    }

    updateNavigation() {
        this.forceUpdate();
    }

    render() {
        const {t} = this.props;

        return (
            <div>

                <div className="container-fluid info_navbar">
                    <div className="container">
                        <Link to="/" className="navbar-brand">
                            <img src="/assets/images/logo_v.svg" className="logo"></img>
                        </Link>
                        <div style={{float: "right"}}>
                            <AutoComplete {...this.props}  />
                        </div>
                    </div>
                </div>
                <nav className="navbar navbar-default">
                    <div className="container">
                        <div className="navbar-header">
                            <button type="button" className="navbar-toggle collapsed" data-toggle="collapse"
                                    data-target="#navbar" aria-expanded="false">
                                <span className="icon-bar"></span>
                                <span className="icon-bar"></span>
                                <span className="icon-bar"></span>
                            </button>
                        </div>
                        <div id="navbar" className="collapse navbar-collapse">
                            <ul className="nav navbar-nav">
                                <MenueItem title="about" to="/about"/>
                                <MenueItem title="drugs" to="/drug/list"/>
                            </ul>


                            <UserMenue/>
                        </div>
                    </div>
                </nav>
            </div>

        );
    }
}

export default Navigation;