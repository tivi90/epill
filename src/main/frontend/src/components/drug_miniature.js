import axios from "axios";
import React from "react";

import {Link} from "react-router-dom";
import {translate} from "react-i18next";

class DrugMiniature extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            invocation: this.props.invocation
        }
    }


    componentWillMount() {

    }

    componentWillReceiveProps(props) {
        this.props = props;
    }


    render() {

        const {t} = this.props;
        const invocation = this.state.invocation;

        return (
                 <div className="col-md-2 col-xs-4 carousel-haeufig">
                    <Link to={`/drug/${invocation.drug.id}/de`}>
                        <div className="row carousel-haeufig-pic">
                            <div className="col-md-12">
                            <img src={`/image/drug/${invocation.drug.id}`} alt={invocation.drug.name}
                                 title={invocation.drug.name}
                                 className="img-haeufig center-block img-responsive"></img>
                            </div>
                        </div>
                        <div className="row">
                            <div className="col-md-12">
                            <p className="carousel-haeufig-text">{invocation.drug.name}</p>
                            </div>
                        </div>
                    </Link>
                </div>
         )
            ;
    }
}

export default translate()(DrugMiniature);