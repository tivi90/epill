import axios from "axios";
import React from "react";

import {translate} from "react-i18next";
import {toast} from 'react-toastify';

import Accordion from "./accordion";
import Loading from "./loading";
import User from "./../util/User";
import BeforeTaking from "./before_taking";
import Usage from "./usage";
import SideEffect from "./sideEffect";

import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'

import {faHome} from "@fortawesome/free-solid-svg-icons";
import {faInfo, faCommentMedical, faAddressCard, faThumbsUp, faUserMd} from "@fortawesome/free-solid-svg-icons";
import {Link} from "react-router-dom";


class DrugDetail extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            drug: undefined,
            showAdditionalInfo: false,

        }

        this.toggleShowAdditionalInfo = this.toggleShowAdditionalInfo.bind(this);
        this.toggleOriginalAndTailoredText = this.toggleOriginalAndTailoredText.bind(this);
    }

    init() {
        axios.get(`/drug/${this.props.match.params.id}/de`)
            .then(({data, status}) => {
                this.setState({
                    drug: data
                });
            });
    }

    componentWillMount() {
        this.init();
    }

    componentWillReceiveProps(props) {
        this.props = props;
        this.init();
    }

    createMarkup(text) {
        return {__html: text};
    };

    //=============================

    toggleShowAdditionalInfo() {
        this.setState({showAdditionalInfo: !this.state.showAdditionalInfo});
    }


    toggleOriginalAndTailoredText(section) {

        var url = (section.isTailored) ? `packagingSection/tailored/${section.topic.id}/${this.props.match.params.id}` : `packagingSection/${section.topic.id}/${this.props.match.params.id}`;

        axios.get(url).then(({data, status}) => {

            switch (status) {
                case 200:
                    var idx = -1;
                    for (var i = 0; i < this.state.drug.packagingSection.length; i++) {
                        if (this.state.drug.packagingSection[i]["id"] == section["id"]) {
                            idx = i;
                            break;
                        }
                    }

                    this.state.drug.packagingSection[idx] = data;
                    this.setState(this.state);

                    break;
                default:
                    const {t} = this.props;
                    const options = {
                        position: toast.POSITION.BOTTOM_CENTER
                    };
                    toast.error(t('errorOccured'), options);
                    break;
            }
        });

    }


    //=============================

    toggleTaking(drug) {
        if (drug.isTaken) {
            this.removeFromTakingList(drug.id);
        } else {
            this.addToTakingList(drug.id);
        }
    }

    addToTakingList(id) {

        axios.post('/drug/taking/add', {id: id}, {
            validateStatus: (status) => {
                return (status >= 200 && status < 300) || status == 400 || status == 401
            }
        })
            .then(({data, status}) => {
                const {t} = this.props;
                const options = {
                    position: toast.POSITION.BOTTOM_CENTER
                };

                switch (status) {
                    case 200:
                        toast.success(t('addToTakingListSuccess'), options);
                        this.state.drug.isTaken = true;
                        this.setState(this.state.drug);
                        break;
                    case 400:
                        toast.error(t('addToTakingListFailed'), options);
                        break;
                    case 401:
                        console.log(data, "not permitted");
                        break;
                }
            });
    }

    removeFromTakingList(id) {
        axios.post('/drug/taking/remove', {id: id}, {
            validateStatus: (status) => {
                return (status >= 200 && status < 300) || status == 400 || status == 401
            }
        })
            .then(({data, status}) => {
                const {t} = this.props;
                const options = {
                    position: toast.POSITION.BOTTOM_CENTER
                };

                switch (status) {
                    case 200:
                        toast.success(t('removeFromTakingListSuccess'), options);
                        this.state.drug.isTaken = !this.state.drug.isTaken;
                        this.setState(this.state.drug);
                        break;
                    case 400:
                        toast.error(t('removeFromTakingListFailed'), options);
                        break;
                    case 401:
                        console.log(data, "not permitted");
                        break;
                }
            });
    }


    /**
     * toggle add/remove to/from remember/taking list
     */

    toggleRemember(drug) {
        if (drug.isRemembered) {
            this.removeFromRememberList(drug.id);
        } else {
            this.addToRememberList(drug.id);
        }
    }

    addToRememberList(id) {
        axios.post('/drug/remember/add', {id: id}, {
            validateStatus: (status) => {
                return (status >= 200 && status < 300) || status == 400 || status == 401 || status == 405
            }
        })
            .then(({data, status}) => {
                const {t} = this.props;
                const options = {
                    position: toast.POSITION.BOTTOM_CENTER
                };

                switch (status) {
                    case 200:
                        toast.success(t('addToRememberListSuccess'), options);
                        this.state.drug.isRemembered = true;
                        this.setState(this.state.drug);
                        break;
                    case 400:
                        toast.error(t('addToRememberListFailed'), options);
                        break;
                    case 401:
                        console.log(data, "not permitted");
                        break;
                    case 405:
                        console.log(data, "Method not allowed");
                        break;
                }
            });
    }

    removeFromRememberList(id) {
        axios.post('/drug/remember/remove', {id: id}, {
            validateStatus: (status) => {
                return (status >= 200 && status < 300) || status == 400 || status == 401 || status == 405
            }
        })
            .then(({data, status}) => {
                const {t} = this.props;
                const options = {
                    position: toast.POSITION.BOTTOM_CENTER
                };

                switch (status) {
                    case 200:
                        toast.success(t('removeFromRememberListSuccess'), options);
                        this.state.drug.isRemembered = !this.state.drug.isRemembered;
                        this.setState(this.state.drug);
                        break;
                    case 400:
                        toast.error(t('removeFromRememberListFailed'), options);
                        break;
                    case 401:
                        console.log(data, "not permitted");
                        break;
                    case 405:
                        console.log(data, "Method not allowed");
                        break;
                }
            });
    }


    //=============================


    renderDrugFeatures(drug) {

        if (!drug.drugFeature)
            return;

        return (
            <p>
                {drug.drugFeature.map(feature => <img key={feature.id}
                                                      src={"./../../assets/icons/" + feature.id + ".svg"}
                                                      alt={feature.drugFeature} title={feature.drugFeature}
                                                      className="drug-feature-icon"></img>)}
            </p>
        );
    }

    renderDisease(drug) {
        if (!drug.disease) {
            return;
        }

        const {t} = this.props;
        return (
            <section className="diseases">
                <p><b> {t('usedWhen') + ": "}</b></p>
                <ul> {drug.disease.map(disease => <li key={disease.id}>{disease.name}</li>)
                    .reduce((prev, curr) => [prev, curr])}</ul>
            </section>
        );
    }

    renderPharmaceuticalForm(drug) {
        if (!drug.pharmaceuticalForm) {
            return;
        }

        const {t} = this.props;
        return (
            <section className="diseases row">
                <p><b>  {t('pharmaceuticalForm') + ": "} </b></p>
                <ul>  {drug.pharmaceuticalForm.map(pharmaceuticalForm => <li
                    key={pharmaceuticalForm.id}>{pharmaceuticalForm.name} <img style={{width: "55px"}}
                                                                               key={pharmaceuticalForm.id}
                                                                               src={"./../../assets/p_form/" + pharmaceuticalForm.id + ".svg"}
                                                                               className="drug-feature-icon"
                                                                               alt={pharmaceuticalForm.name}
                                                                               title={pharmaceuticalForm.name}></img>
                </li>)
                    .reduce((prev, curr) => [prev, curr])}</ul>


            </section>
        );
    }


    renderActiveSubstance(drug) {
        if (!drug.activeSubstance)
            return null;

        const {t} = this.props;

        return (
            <p><b> {t('activeSubstance') + ": "}</b>
                {drug.activeSubstance.map(substance => <span key={substance.id}>{substance.name}</span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}
            </p>
        );
    }

    renderPZN(drug) {
        if (!drug.packaging)
            return null;

        const {t} = this.props;

        return (
            <section className="pzn row">
                <p><b>  {t('pzn') + ": "}</b></p>
                <ul>    {drug.packaging.map(packaging => <li key={packaging.id}>{packaging.name} {packaging.pzn}</li>)
                    .reduce((prev, curr) => [prev, curr])}</ul>
            </section>
        );
    }


    renderIndicationGroup(drug) {
        if (!drug.indicationGroup || !drug.indicationGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section className="row">
                <p><b>     {t('indicationGroup') + ": "}  </b></p>
                <ul>
                    <li>{drug.indicationGroup.name}</li>
                </ul>
            </section>
        );
    }

    renderProductGroup(drug) {

        if (!drug.productGroup || !drug.productGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section className="row">
                <p><b>      {t('productGroup') + ": "}</b></p>
                <ul>
                    <li>{drug.productGroup.name}</li>
                </ul>
            </section>
        );
    }

    renderSectionOverview(drug) {
        if (!drug.packagingSection) {
            return null;
        }

        return drug.packagingSection.map((section => {
            return (
                <li key={section.id}>{section.topic.title}</li>
            );
        }));
    }

    renderSectionList(drug) {
        if (!drug.packagingSection) {
            return null;
        }

        return drug.packagingSection.map((section => {
            return (<Accordion section={section} toggleOriginalAndTailoredText={this.toggleOriginalAndTailoredText}
                               key={section.id}/>);
        }));
    }


    render() {
        const {t} = this.props;
        const drug = this.state.drug;
        const showAdditionalInfo = this.state.showAdditionalInfo;
        let itemClass = ["item  col-xs-4 col-lg-4 grid-group-item"]
        if(this.state.addClass) {
            itemClass.push('list-group-item');
        }

        if (!drug) {
            // Do not show anything while loading.
            return (
                <div className="container marketing no-banner">
                    <div className='page-header'>
                        <h3></h3>
                    </div>
                    <Loading/>
                </div>
            );
        }

        return (

            <div className="no-banner">

                {/*Button INFO*/}
                <div className="round-button-outer report-round-button">
                    <div id="reportBtn" className="round-button-inner-main" data-toggle="modal" data-target="#info">
                        <FontAwesomeIcon icon={faInfo}/> <i className="fas fa-info"></i>
                    </div>
                </div>
                <div className="modal fade" id="info" tabIndex="-1" role="dialog" aria-labelledby="adressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h2>Informationen
                                </h2>
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <p style={{fontWeight: "bold"}}> Lesen Sie die gesamte e-Packungsbeilage sorgfältig
                                    durch,

                                    denn
                                    sie enthält wichtige Informationen für Sie.
                                    Um einen bestmöglichen Behandlungserfolg zu erzielen, muss Prospan®
                                    Hustensaft jedoch vorschriftsmäßig angewendet werden.</p>

                                <ul>
                                    <li>Fragen Sie Ihren Apotheker, wenn Sie weitere Informationen oder
                                        einen Rat benötigen.
                                    </li>
                                    <li>Wenn sich Ihre Symptome verschlimmern oder nach 7 Tagen keine
                                        Besserung eintritt, müssen Sie auf jeden Fall einen Arzt aufsuchen.
                                    </li>

                                </ul>
                                <div className="row alert alert-danger" role="alert">
                                    <div className="col-md-1 alert_style">
                                        <i className="fas fa-exclamation"></i></div>
                                    <div className="col-md-11">
                                        <p> Wenn eine der aufgeführten Nebenwirkungen Sie erheblich beeinträchtigt oder
                                            Sie Nebenwirkungen
                                            bemerken, die nicht in dieser
                                            Gebrauchsinformation angegeben sind, informieren Sie bitte Ihren
                                            <b>Arzt oder Apotheker</b>.</p>
                                    </div>
                                </div>
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" data-dismiss="modal">Schließen
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
                {/*Button INFO ENDE*/}

                {/*Button Address*/}
                <div className="round-button-outer report-round-button no_animation" style={{top: "190px"}}>
                    <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                         data-target="#adress">
                        <FontAwesomeIcon icon={faAddressCard}/> <i className="fas fa-address-card"></i></div>
                </div>
                <div className="modal fade" id="adress" tabIndex="-1" role="dialog" aria-labelledby="adressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h2>Pharmazeutischer Unternehmer und Hersteller</h2>

                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <div className="row">
                                    <div className="col-md-8">
                                        <p> Engelhard Arzneimittel GmbH & Co. KG <br/>
                                            Herzbergstr. 3 <br/>
                                            61138 Niederdorfelden <br/>
                                            <b>Tel.:</b> 06101 / 539 – 300 <br/>
                                            <b>Fax:</b> 06101 / 539 – 315 <br/>
                                            <b> Internet:</b> <a
                                                href="http://www.engelhard-am.de">http://www.engelhard-am.de</a> <br/>
                                            <b> E-Mail:</b> <a
                                                href="mailto:info@engelhard-am.de">info@engelhard-am.de</a> <br/>

                                        </p>
                                    </div>
                                    <div className="col-md-4">
                                        <img className="img-responsive" src="/assets/images/Engelhard_Logo_2013.png"/>
                                    </div>
                                </div>
                            </div>
                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" data-dismiss="modal">Schließen
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                {/*Button  Address ENDE*/}

                {/*Button REPORT*/}
                <div className="round-button-outer report-round-button no_animation" style={{top: "280px"}}>
                    <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                         data-target="#melden">
                        <FontAwesomeIcon icon={faCommentMedical}/>
                    </div>
                </div>
                <div className="modal fade" id="melden" tabIndex="-1" role="dialog" aria-labelledby="adressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <h2>Meldung von Nebenwirkungen </h2>
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <div className="row  alert alert-success" role="alert">
                                    <div className="col-md-10">
                                        <p>Indem Sie Nebenwirkungen melden, können Sie dazu beitragen,
                                            dass mehr Informationen über die Sicherheit dieses Arzneimittels
                                            zur Verfügung gestellt werden.
                                        </p>
                                    </div>
                                    <div className="col-md-2 icon_modal">
                                        <FontAwesomeIcon icon={faThumbsUp}/>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-md-10">
                                        <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren <b>Arzt oder
                                            Apotheker</b>.
                                            Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage
                                            angegeben
                                            sind.
                                        </p>
                                    </div>
                                    <div className="col-md-2 icon_modal">
                                        <FontAwesomeIcon icon={faUserMd}/>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-md-12">
                                        <p><b>Weitere Möglichkeit:</b><br/>
                                            Bundesinstitut für Arzneimittel und Medizinprodukte <br/>
                                            Abt. Pharmakovigilanz<br/>
                                            Kurt-Georg-Kiesinger Allee 3,<br/> D-53175 Bonn<br/>
                                            <b>Website:</b> <a href="www.bfarm.de">www.bfarm.de
                                            </a></p>
                                    </div>
                                </div>
                            </div>

                            <div className="modal-footer">
                                <button type="button" className="btn btn-secondary" data-dismiss="modal">Schließen
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                {/*Button REPORT ENDE*/
                }

                <div className='page-header bg_grey'>
                    <div className="container  no-banner">

                        <div className='btn-toolbar pull-right'>
                            <div className='btn-group'></div>
                        </div>
                        {User.isAuthenticated()
                        &&
                        <div className='btn-toolbar pull-right'>
                            <div className='btn-group'>
                                <button type="button" className="btn btn-like" onClick={() => this.toggleTaking(drug)}>
                                    <span
                                        className={"glyphicon white" + ((!drug.isTaken) ? " glyphicon-heart" : " glyphicon-minus")}></span>
                                </button>

                                <button type="button" className="btn btn-add" onClick={() => this.toggleRemember(drug)}>
                                    <span
                                        className={"glyphicon white" + ((!drug.isRemembered) ? " glyphicon-plus" : " glyphicon-minus")}></span>
                                </button>
                            </div>
                        </div>
                        }
                        <div className="row med_head">
                            <h1>{drug.name}</h1>
                        </div>
                        {/*<h3>{drug.name} {drug.productGroup && drug.productGroup.name && <span className="text-muted">{drug.productGroup.name}</span> }</h3>*/}
                        {/*<span>v. {drug.version} | {t('publishingDate')}: {new Date(drug.year).toLocaleDateString()}</span>*/}

                        <div className="row featurette drug-detail-header">
                            <div className="col-xs-12 col-sm-12 col-md-4">
                                <img className="featurette-image img-responsive center-block"
                                     alt={drug.name}
                                     title={drug.name}
                                     src={`/image/drug/${drug.id}`
                                     }></img>
                                <div className="drug-features ">
                                    {drug.drugFeature.map(feature => {
                                        return (

                                            <span style={{float: "left"}} key={feature.id}>

                                                <img key={feature.id} data-toggle="modal" data-target={"#" + feature.id}
                                                     src={"./../../assets/icons/" + feature.id + ".svg"}
                                                     className="drug-feature-icon" alt={feature.drugFeature}
                                                     title={feature.drugFeature}></img>


                                                <div id={feature.id} className="modal fade" role="dialog">
                                                    <div className="modal-dialog">

                                                        <div className="modal-content">
                                                            <div className="modal-header">
                                                                <button type="button" className="close"
                                                                        data-dismiss="modal">&times;</button>
                                                                <h2 className="modal-title"><img style={{width: "40px"}}
                                                                                                 key={feature.id}
                                                                                                 data-toggle="modal"
                                                                                                 data-target={"#" + feature.id}
                                                                                                 src={"./../../assets/icons/" + feature.id + ".svg"}
                                                                                                 className="drug-feature-icon"
                                                                                                 alt={feature.drugFeature}
                                                                                                 title={feature.drugFeature}></img> {feature.drugFeature}
                                                                </h2>
                                                            </div>
                                                            <div className="modal-body">

                                                                <div
                                                                    dangerouslySetInnerHTML={this.createMarkup(feature.descriptionDrug)}/>

                                                            </div>
                                                            <div className="modal-footer">
                                                                <button type="button" className="btn btn-default"
                                                                        data-dismiss="modal">Close
                                                                </button>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>

                                            </span>

                                        )
                                    })
                                    }


                                </div>

                            </div>
                            <div className="col-xs-12 col-sm-12 col-md-7 infobox">
                            <div className="col-xs-12 col-sm-12 col-md-6 med_desc">
                                {User.isAuthenticated() && drug.personalizedInformation &&
                                <div className="alert row w3-animate-right">
                                    <div className="speech-bubble">
                                        <a href="#" className="close" data-dismiss="alert"
                                           aria-label="close">&times;</a>
                                        <span
                                            dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                                    </div>

                                    <img className="speech-bubble-person" src="./../../assets/images/logo_chat.png"/>

                                </div>
                                }

                                {this.renderPharmaceuticalForm(drug)}

                                {this.renderDisease(drug)}

                                {this.renderActiveSubstance(drug)}

                                <p>
                                    <a onClick={this.toggleShowAdditionalInfo}>
                                        <button className="btn btn-info">
                                            {!showAdditionalInfo && <span>{t('viewDetails')}</span>}
                                            {showAdditionalInfo && <span>{t('hideDetails')}</span>}
                                        </button>
                                    </a>
                                </p>
                            </div>
                            <div className="col-xs-12 col-sm-12 col-md-6 med_desc">

                                <div className="additional-information">
                                    {showAdditionalInfo &&
                                    <section>
                                        {this.renderIndicationGroup(drug)}

                                        {this.renderProductGroup(drug)}

                                        {this.renderPZN(drug)}
                                    </section>
                                    }


                                </div>

                            </div>
                            </div>
                         </div>
                    </div>
                </div>

                <div className="container">

                    <div className="row">
                        <div className="panel with-nav-tabs panel-default">
                            <div className="panel-heading">
                                <ul className="nav nav-tabs">
                                    <li className="active"><a href="#tab1default" data-toggle="tab">Vor der
                                        Einnahme </a></li>
                                    <li><a href="#tab2default" data-toggle="tab">Anwendnung</a></li>
                                    <li><a href="#tab3default" data-toggle="tab">Nebenwirkungen</a></li>

                                </ul>
                            </div>
                            <div className="panel-body">
                                <div className="tab-content">
                                    <div className="tab-pane fade in active" id="tab1default"><BeforeTaking/></div>
                                    <div className="tab-pane fade" id="tab2default"><Usage/></div>
                                    <div className="tab-pane fade" id="tab3default"><SideEffect/></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                {
                    this.renderSectionList(drug)
                }

            </div>


        );


    }
}





export default translate()(DrugDetail);
