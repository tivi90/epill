import axios from "axios";
import React from "react";

import {translate} from "react-i18next";

import User from "../util/User";
import AutoComplete from "./auto_complete";

class Carousel1 extends React.Component {
    constructor(props) {
        super();
        this.state = {
            drug: undefined
        }

    }

    generatePersonalizedAddress() {

        const {t} = this.props;
        var time = new Date().getHours();
        var greeting = null;

        switch (true) {
            case (time > 4 && time < 9):
                greeting = t("greetingMorning");
                break;
            case (time > 9 && time < 13):
                greeting = t("greetingNoon");
                break;
            case (time > 13 && time < 17):
                greeting = t("greetingHighNoon");
                break;
            case (time > 17 && time < 22):
                greeting = t("greetingEvening");
                break;
            default:
                greeting = t("greetingNight");
        }

        return (<h1>{greeting.replace("%User.firstname%", User.firstname)}</h1>);
    }

    componentWillMount() {

    }

    render() {
        const {t} = this.props;
        var title = null;
        title = t('drugs');

        return (
            <div id="myCarousel" className="carousel slide carousel-fade" data-ride="carousel">
                <div className="carousel-inner">
                    <div className="carousel-item active">
                        <div className="mask flex-center">
                            <div className="container">
                                <div className="row align-items-center">
                                    <div className="col-md-8 col-12 order-md-1 order-2">

                                        <h4>{title}</h4>
                                        <p>Select the medicine you prefer</p>
                                    </div>
                                    <div className="col-md-4 col-12 order-md-2 order-1"><img
                                        src="/assets/images/epil_circle.png" className="img-responsive" alt="slide"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        );
    }
}

export default translate()(Carousel1);