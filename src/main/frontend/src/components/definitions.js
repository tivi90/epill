import axios from "axios";
import React from "react";

import {Link} from "react-router-dom";

import {translate} from "react-i18next";

// See https://facebook.github.io/react/docs/forms.html for documentation about forms.
class Definitions extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
        		
        };

    }

	// for html conversion
	createMarkup(text) { return {__html: text}; };


    renderWordExplaination(drug) {

        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return wordExplaination
            .map((section => {
                return (
                    <div key={section.id} className="modal fade" id={section.name.toLowerCase().split(' ').join('_')}
                         tabIndex="-1" role="dialog"
                         aria-hidden="true">
                        <div className="modal-dialog" role="document">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <i class="fas fa-question"></i>
                                    <h3>{section.name}
                                    </h3>
                                    <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div className="modal-body" style={{color: "black"}}>

                                    <p key={section.id}><span
                                        dangerouslySetInnerHTML={this.createMarkup(section.description)}/>
                                    </p></div>
                                <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                            </div>
                        </div>
                    </div>
                );
            })).reduce((prev, curr) => [prev, curr]);

    }


    render() {
        const {t} = this.props;

        return (
			<div>{this.renderWordExplaination()}</div>
        );
    }
}

export default translate()(Definitions);