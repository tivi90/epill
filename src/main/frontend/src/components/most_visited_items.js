import axios from "axios";
import React from "react";

import {translate} from "react-i18next";

import DrugMiniature from "./drug_miniature";

import User from "./../util/User";

class MostVisitedItems extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            invocations: []
        };

        this.getMostVisitedItems = this.getMostVisitedItems.bind(this);
    }


    componentDidMount() {
        this.getMostVisitedItems();
    }

    getMostVisitedItems() {
        if (!User.isAuthenticated())
            return;

        axios.get(`/drug/frequentlyVisited`)
            .then(({data, status}) => {
                this.setState({invocations: data});
            });
    }


    render() {
        const {t} = this.props;
        const invocations = this.state.invocations;

        if (!invocations || invocations.length == 0) {
            return null;
        }

            return (
                <div className="container">
                    <div className="row"><h5>{t('mostVisitedItems')}</h5></div>
                    <div className="row">
                        <div className="col-md-12">
                            <div id="Carousel" className="carousel slide">
                                <div className="carousel-inner">
                                    {invocations
                                        .filter(invocation => {
                                            return invocation.drug.id < 7
                                        })
                                        .map(invocation => <DrugMiniature invocation={invocation}
                                                                                  key={invocation.drug.id}/>)}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            );
        }

}

export default translate()(MostVisitedItems);