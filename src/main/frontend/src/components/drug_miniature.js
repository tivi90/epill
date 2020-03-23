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
                <div className="carousel-item active">
                    <div className="col-md-2 col-xs-12 carousel-haeufig"><Link
                        to={`/drug/${invocation.drug.id}/de`}>
                        <div className="row carousel-haeufig-pic">
                            <img src={`/image/drug/${invocation.drug.id}`} alt={invocation.drug.name}
                                 title={invocation.drug.name}
                                 className="img-responsive center-block"></img></div>
                        <div className="row">
                            <p className="carousel-haeufig-text">{invocation.drug.name}</p>

                        </div>
                    </Link>
                    </div>
                </div>
        )
            ;
    }
}

export default translate()(DrugMiniature);