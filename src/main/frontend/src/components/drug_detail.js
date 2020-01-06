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
import {
    faInfo,
    faCommentMedical,
    faAddressCard,
    faThumbsUp,
    faUserMd,
    faBaby,
    faChild,
    faMale,
    faGlassWhiskey,
    faChevronDown,
    faBlind
} from "@fortawesome/free-solid-svg-icons";
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
                <img src={"./../../assets/images/lab.svg"} className="infopic"/>

                <p><b> {t('usedWhen') + " "}</b></p>
                <p>   {drug.disease.map(disease => <span key={disease.id}>{disease.name} <br/></span>)
                    .reduce((prev, curr) => [prev, curr])}</p>
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
                {drug.pharmaceuticalForm.map(pharmaceuticalForm => <img key={pharmaceuticalForm.id}
                                                                        src={"./../../assets/p_form/" + pharmaceuticalForm.id + ".svg"}
                                                                        className="drug-feature-icon infopic"
                                                                        alt={pharmaceuticalForm.name}
                                                                        title={pharmaceuticalForm.name}></img>
                )
                    .reduce((prev, curr) => [prev, curr])}

                <p><b>  {t('pharmaceuticalForm') + ": "} </b></p>
                <span>{drug.pharmaceuticalForm.map(pharmaceuticalForm => <span
                    key={pharmaceuticalForm.id}>{pharmaceuticalForm.name} <br/> </span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}</span>
            </section>
        );
    }


    renderActiveSubstance(drug) {
        if (!drug.activeSubstance)
            return null;

        const {t} = this.props;

        return (
            <section><img src={"./../../assets/images/lab.svg"} className="infopic"/>

                <p><b> {t('activeSubstance') + " "}</b></p>
                <p>    {drug.activeSubstance.map(substance => <span key={substance.id}>{substance.name} <br/></span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}</p>

            </section>
        );
    }


    renderPZN(drug) {
        if (!drug.packaging)
            return null;

        const {t} = this.props;

        return (
            <section className="pzn diseases row">
                <img src={"./../../assets/images/lab.svg"} className="infopic"/>

                <p><b>  {t('pzn') + " "}</b>
                    {drug.packaging.map(packaging => <span key={packaging.id}>{packaging.name} {packaging.pzn}
                        <br/></span>)
                        .reduce((prev, curr) => [prev, curr])}</p>
            </section>
        );
    }

    renderIndicationGroup(drug) {
        if (!drug.indicationGroup || !drug.indicationGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section className="row diseases">
                <img src={"./../../assets/images/lab.svg"} className="infopic"/>

                <p><b>     {t('indicationGroup') + " "}  </b></p>
                <p>{drug.indicationGroup.name}</p>

            </section>
        );
    }

    renderProductGroup(drug) {

        if (!drug.productGroup || !drug.productGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section className="row diseases">
                <img src={"./../../assets/images/lab.svg"} className="infopic"/>

                <p><b>      {t('productGroup') + " "}</b></p>

                <p>{drug.productGroup.name}</p>

            </section>
        );
    }

    renderSectionOverview(drug) {
        if (!drug.packagingSection) {
            return null;
        }

        return drug.packagingSection.map((section => {
            return (
                <p key={section.id}>{section.topic.title}</p>
            );
        }));
    }

    renderPackSec(drug) {
        if (!drug.packagingSection) {
            return null;
        }

        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 1
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                        <h1>---</h1>{section.topic.title}</p>
                );
            })).reduce((prev, curr) => [prev, curr]);
        drug.packagingSection.getPackagingSectionByTopicAndDrug(1, 1);
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
        let itemClass = ["item  col-xs-4 col-sm-4 grid-group-item"]
        if (this.state.addClass) {
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
                                    Um einen bestmöglichen Behandlungserfosm zu erzielen, muss Prospan®
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

                        {/*<h3>{drug.name} {drug.productGroup && drug.productGroup.name && <span className="text-muted">{drug.productGroup.name}</span> }</h3>*/}
                        {/*<span>v. {drug.version} | {t('publishingDate')}: {new Date(drug.year).toLocaleDateString()}</span>*/}
                        {User.isAuthenticated() && drug.personalizedInformation &&
                        <div className="alert bubble  row w3-animate-right">
                            <div className="speech-bubble">
                                <a href="#" className="close" data-dismiss="alert"
                                   aria-label="close">&times;</a>
                                <span
                                    dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                            </div>

                            <img className="speech-bubble-person" src="./../../assets/images/logo_chat.png"/>

                        </div>
                        }
                        <div className="row featurette drug-detail-header">

                            <div className="col-xs-12 col-sm-12 col-md-3">
                                <img className="featurette-image img-responsive center-block"
                                     alt={drug.name}
                                     title={drug.name}
                                     src={`/image/drug/${drug.id}`
                                     }></img>
                                <div className="row med_head">
                                    <span>{drug.name}</span>
                                </div>
                                <div className="drug-features ">
                                    {drug.drugFeature.map(feature => {
                                        return (

                                            <span key={feature.id}>

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

                                <div className="row tab_headers">
                                    <ul className="nav nav-pills brand-pills nav-stacked" role="tablist">
                                        <li role="presentation" className="brand-nav active"><a href="#tab1"
                                                                                                aria-controls="tab1"
                                                                                                role="tab"
                                                                                                data-toggle="tab">Algemeine
                                            Informationen</a></li>
                                        <div id="arrow-down">
                                            <FontAwesomeIcon icon={faChevronDown}/>
                                        </div>
                                        <li role="presentation" className="brand-nav"><a href="#tab2"
                                                                                         aria-controls="tab2"
                                                                                         role="tab"
                                                                                         data-toggle="tab">Vor der
                                            Anwendung </a></li>
                                        <div id="arrow-down">
                                            <FontAwesomeIcon icon={faChevronDown}/>
                                        </div>
                                        <li role="presentation" className="brand-nav"><a href="#tab3"
                                                                                         aria-controls="tab3"
                                                                                         role="tab"
                                                                                         data-toggle="tab">Anwendung</a>
                                        </li>
                                        <div id="arrow-down">
                                            <FontAwesomeIcon icon={faChevronDown}/>
                                        </div>
                                        <li role="presentation" className="brand-nav"><a href="#tab4"
                                                                                         aria-controls="tab4"
                                                                                         role="tab"
                                                                                         data-toggle="tab">Nebenwirkungen
                                        </a></li>
                                    </ul>


                                </div>


                            </div>


                            <div className="col-xs-12 col-sm-12 col-md-9 infobox">
                                <div className="tab-content">
                                    <div role="tabpanel" className="tab-pane active w3-animate-opacity" id="tab1">
                                        <div className="row content_header">
                                            <span>Algemeine Informationen</span>
                                            <hr/>
                                            <p>Baymycard 10 mg ist ein Arzneimittel zur Behandlung der chronisch
                                                stabilen Angina pectoris (Belastungsangina) und des Bluthochdrucks. Bei
                                                der chronisch stabilen Angina pectoris sind die Blutgefäße, die das Herz
                                                kranzförmig umgeben (Herzkranzgefäße), verengt, so dass der Herzmuskel
                                                nicht ausreichend mit Sauerstoff versorgt wird. Nisoldipin, der
                                                Wirkstoff in Baymycard 10 mg, führt zu einer Erweiterung der
                                                Herzkranzgefäße und anderer Blutgefäße, verbessert so die Durchblutung
                                                und steigert die Sauerstoffzufuhr. Ein erhöhter Blutdruck wird
                                                normalisiert.</p>
                                        </div>

                                        <div className="row">
                                            <div className="col-sm-4 text-center infopart">
                                                {this.renderPharmaceuticalForm(drug)}
                                            </div>
                                            <div className="col-sm-4 text-center infopart">
                                                {this.renderDisease(drug)}
                                            </div>
                                            <div className="col-sm-4 text-center infopart">
                                                {this.renderActiveSubstance(drug)}
                                            </div>

                                        </div>

                                        {showAdditionalInfo &&
                                        <div className="row">

                                            <div className="additional-information">

                                                <section>
                                                    <div className="col-sm-4 text-center infopart">
                                                        {this.renderIndicationGroup(drug)}
                                                    </div>
                                                    <div className="col-sm-4 text-center infopart">
                                                        {this.renderProductGroup(drug)}
                                                    </div>
                                                    <div className="col-sm-4 text-center infopart">
                                                        {this.renderPZN(drug)}
                                                    </div>

                                                </section>


                                            </div>

                                        </div>}


                                        <div className="row text-center">
                                            <p>
                                                <a onClick={this.toggleShowAdditionalInfo}>
                                                    <button className="btn btn-secondary">
                                                        {!showAdditionalInfo && <span>{t('viewDetails')}</span>}
                                                        {showAdditionalInfo && <span>{t('hideDetails')}</span>}
                                                    </button>
                                                </a>
                                            </p>
                                        </div>
                                    </div>
                                    <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab2">

                                    </div>
                                    <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab3">
                                        <div className="alert bubble  row w3-animate-right">
                                            <div className="speech-bubble">
                                                <a href="#" className="close" data-dismiss="alert"
                                                   aria-label="close">&times;</a>
                                                <span
                                                    dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                                            </div>

                                            <img className="speech-bubble-person"
                                                 src="./../../assets/images/logo_chat.png"/>

                                        </div>
                                        <div className="row">
                                            <div className="content_header">
                                                <span>Art</span>
                                                <hr/>
                                            </div>
                                            <div className="col-sm-4 text-center ">


                                                <div className="circle-badge">
                                                    <img style={{width: "50px"}}
                                                         src={"./../../assets/images/other/8clock.png"}></img><br/>
                                                    <strong>Morgens</strong> <br/>
                                                    <span>6 - 12 Uhr</span>

                                                </div>
                                                <span className="times">1x <FontAwesomeIcon
                                                    icon={faGlassWhiskey}/></span>

                                            </div>
                                            <div className="col-sm-4 text-center ">


                                                <div className="circle-badge">
                                                    <img style={{width: "50px"}}
                                                         src={"./../../assets/images/other/12clock.png"}></img><br/>
                                                    <strong>Mittags</strong> <br/>
                                                    <span>12 - 17 Uhr</span>


                                                </div>
                                                <span className="times">1x <FontAwesomeIcon
                                                    icon={faGlassWhiskey}/></span>

                                            </div>
                                            <div className="col-sm-4 text-center  ">


                                                <div className="circle-badge">
                                                    <img style={{width: "50px"}}
                                                         src={"./../../assets/images/other/17clock.png"}></img><br/>

                                                    <strong>Abends</strong> <br/>
                                                    <span>17 - 21 Uhr</span>


                                                </div>
                                                <span className="times">1x <FontAwesomeIcon
                                                    icon={faGlassWhiskey}/></span>

                                            </div>
                                        </div>
                                        <div className="alert alert-info alert_dose" role="alert">
<div className="row">
                                            <div className="col-sm-6 text-center alert_details"><img className="liquid" src={"./../../assets/images/other/liquid.png"}></img><br/> Die
                                                Flasche vor jedem
                                                Gebrauch gut schütteln!
                                            </div>

                                            <div className="col-sm-6 text-center alert_details">

                                                <FontAwesomeIcon className="med_cup" icon={faGlassWhiskey}/><br/>
                                            Zum Einnehmen mit dem beigefügten Messbecher
                                        </div>
                                    </div> </div>
                                    <div className="row content_header">
                                        <span>Dosierung</span>
                                        <hr/>
                                    </div>
                                    <div className="row">
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>


                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "60px"}}>
                                            <FontAwesomeIcon icon={faBaby}/>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "60px"}}>
                                            <FontAwesomeIcon icon={faChild}/>

                                            <i className="fas fa-child"></i>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "60px"}}>
                                            <FontAwesomeIcon icon={faMale}/>
                                            <FontAwesomeIcon icon={faBlind}/>

                                            <i className="fas fa-male"></i>
                                            <i className="fas fa-blind"></i>
                                        </div>
                                    </div>
                                    <div className="row">
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p style={{fontWeight: "bold"}}>Alter</p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p> Kinder unter 6 Jahren</p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p> Kinder von 6 - 12 Jahren</p>

                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p> Kinder ab 6 Jahren & Erwachsene</p>
                                        </div>
                                    </div>
                                    <hr/>
                                    <div className="row">
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p style={{fontWeight: "bold"}}>Einzeldosis</p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>2,5 ml <br/> &#8793; <br/> 17,5 mg
                                                Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>5 ml <br/> &#8793; <br/> 35 mg Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>5 ml <br/> &#8793; <br/> 35 mg Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                    </div>
                                    <hr/>

                                    <div className="row">
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p style={{fontWeight: "bold"}}>Tagesgesamtdosis</p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>5 ml (2 x 2,5 ml) <br/> &#8793; <br/> 35 mg
                                                Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>10 ml (2 x 5 ml) <br/> &#8793; <br/> 70 mg
                                                Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                        <div className="col-sm-3" style={{fontSize: "16px"}}>

                                            <p>15 ml (3 x 5 ml) <br/> &#8793; <br/> 105 mg
                                                Efeublätter-Trockenextrakt
                                            </p>
                                        </div>
                                    </div>


                                    <div className="row">
                                        <div className=" content_header">
                                            <span>Dosierung</span>
                                            <hr/>
                                        </div>
                                        <div className="col-sm-8 col-sm-offset-2">
                                            Die Behandlungsdauer richtet sich jeweils nach der Art und
                                            Schwere
                                            des Krankheitsbildes; sie sollte in der Regel <b>1
                                            Woche </b> betragen. Wenn
                                            die Beschwerden jedoch länger als 1 Woche anhalten, sollte
                                            medizinischer Rat eingeholt werden.
                                            <div className="alert alert-warning" role="alert"> Bitte
                                                sprechen Sie mit Ihrem Arzt oder Apotheker,
                                                wenn Sie den
                                                Eindruck haben, dass die Wirkung von Prospan® Hustensaft zu
                                                stark
                                                oder zu schwach ist.</div>
                                        </div>
                                    </div>


                                </div>
                                <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab4">
                                    <div className="row">
                                        <div className="col-sm-12 text-center" style={{color: "black"}}>

                                            Wie alle Arzneimittel kann Prospan® Hustensaft Nebenwirkungen
                                            haben, die aber nicht bei jedem auftreten müssen. <br/>
                                            Bei der Bewertung von Nebenwirkungen werden fosmende Häufigkeiten
                                            zugrundegelegt:
                                            <div className="row">
                                                <div className="col-sm-8 col-sm-offset-2 text-left">
                                                    <table className="table table-striped custab"
                                                           style={{marginTop: "30px"}}>
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <b>Sehr häufig</b>
                                                            </td>
                                                            <td>
                                                                mehr als 1 Behandelter von 10
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b> Häufig</b></td>
                                                            <td>
                                                                1 bis 10 Behandelte von 100
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b> Gelegentlich</b></td>
                                                            <td>
                                                                1 bis 10 Behandelte von 1.000
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b> Selten</b></td>
                                                            <td>
                                                                1 bis 10 Behandelte von 10.000
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b> Sehr selten</b>
                                                            </td>
                                                            <td>
                                                                weniger als 1 Behandelter von 10.000
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <b> Nicht bekannt</b>
                                                            </td>
                                                            <td>
                                                                Häufigkeit auf Grundlage der verfügbaren Daten nicht
                                                                abschätzbar
                                                            </td>
                                                        </tr>
                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div className="row">
                                        <div className=" content_header">
                                            <span>Allergische Reaktionen</span>
                                            <hr/>
                                        </div>
                                        <div className="row">
                                            <span className="label label-primary">Atemnot</span>
                                            <span className="label label-primary">Schwellungen</span>
                                            <span className="label label-primary">Hautrötungen</span>
                                            <span className="label label-primary">Juckreiz</span>
                                            <span className="label label-primary">Atemnot</span></div>

                                        <div className=" content_header">
                                            <span>Magen-Darm-Beschwerden </span>
                                            <hr/>
                                        </div>
                                        <div className="row">
                                            Aufgrund des Sorbitosmehaltes: <br/>
                                            <span className="label label-primary">Übelkeit</span>
                                            <span className="label label-primary">Erbrechen</span>
                                            <span className="label label-primary">Durchfall</span>
                                            <span className="label label-primary">abführende Wirkung</span>
                                            <br/>
                                            <p><b>Häufigkeit:</b> Nicht bekannt</p>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>


                    </div>
                </div>
            </div>

            < div
        className = "container" >

            {this.renderPackSec(drug)}
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
        < /div>
        {
            this.renderSectionList(drug)
        }

    </div>

    );


    }
    }


    export default translate()(DrugDetail);
