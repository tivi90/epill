import axios from "axios";
import React from "react";

import {translate} from "react-i18next";
import {toast} from 'react-toastify';

import Accordion from "./accordion";
import Loading from "./loading";
import User from "./../util/User";
import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'

import {faHome} from "@fortawesome/free-solid-svg-icons";
import {faInfo, faCommentMedical, faAddressCard, faThumbsUp, faUserMd} from "@fortawesome/free-solid-svg-icons";


class DrugDetail extends React.Component {
    constructor(props) {
        super();
        this.state = {
            drug: undefined,
            showAdditionalInfo: false
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
                {t('usedWhen') + ": "}
                {drug.disease.map(disease => <span key={disease.id}>{disease.name}</span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}
            </section>
        );
    }

    renderPharmaceuticalForm(drug) {
        if (!drug.pharmaceuticalForm) {
            return;
        }

        const {t} = this.props;
        return (
            <section className="diseases">
                {t('pharmaceuticalForm') + ": "}
                {drug.pharmaceuticalForm.map(pharmaceuticalForm => <span
                    key={pharmaceuticalForm.id}>{pharmaceuticalForm.name}</span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}
            </section>
        );
    }

    renderActiveSubstance(drug) {
        if (!drug.activeSubstance)
            return null;

        const {t} = this.props;

        return (
            <p> {t('activeSubstance') + ": "}
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
            <section className="pzn">
                {t('pzn') + ": "}
                {drug.packaging.map(packaging => <span key={packaging.id}>{packaging.name} {packaging.pzn}</span>)
                    .reduce((prev, curr) => [prev, ', ', curr])}
            </section>
        );
    }


    renderIndicationGroup(drug) {
        if (!drug.indicationGroup || !drug.indicationGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section>
                {t('indicationGroup') + ": " + drug.indicationGroup.name}
            </section>
        );
    }

    renderProductGroup(drug) {

        if (!drug.productGroup || !drug.productGroup.name)
            return null;

        const {t} = this.props;

        return (
            <section>
                {t('productGroup') + ": " + drug.productGroup.name}
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
            <div className="  no-banner">

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
                                    <div className="col-lg-1 alert_style">
                                        <i className="fas fa-exclamation"></i></div>
                                    <div className="col-lg-11">
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
                                    <div className="col-lg-8">
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
                                    <div className="col-lg-4">
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
                                    <div className="col-lg-10">
                                        <p>Indem Sie Nebenwirkungen melden, können Sie dazu beitragen,
                                            dass mehr Informationen über die Sicherheit dieses Arzneimittels
                                            zur Verfügung gestellt werden.
                                        </p>
                                    </div>
                                    <div className="col-lg-2 icon_modal">
                                        <FontAwesomeIcon icon={faThumbsUp}/>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-10">
                                        <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren <b>Arzt oder
                                            Apotheker</b>.
                                            Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage
                                            angegeben
                                            sind.
                                        </p>
                                    </div>
                                    <div className="col-lg-2 icon_modal">
                                        <FontAwesomeIcon icon={faUserMd}/>
                                    </div>
                                </div>
                                <div className="row">
                                    <div className="col-lg-12">
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
                            <h1>{drug.name} {drug.productGroup && drug.productGroup.name &&
                            <span className="text-muted">{drug.productGroup.name}</span>}</h1>
                        </div>
                        {/*<h3>{drug.name} {drug.productGroup && drug.productGroup.name && <span className="text-muted">{drug.productGroup.name}</span> }</h3>*/}
                        {/*<span>v. {drug.version} | {t('publishingDate')}: {new Date(drug.year).toLocaleDateString()}</span>*/}

                        <div className="row featurette drug-detail-header">
                            <div
                                className="col-xs-12 col-sm-12 col-md-4">
                                <img className="featurette-image img-responsive center-block"
                                     alt={drug.name}
                                     title={drug.name}
                                     src={`/image/drug/${drug.id}`
                                     }></img>
                                <div className="drug-features margin-s">
                                    {this.renderDrugFeatures(drug)}
                                </div>
                            </div>
                            <div className="col-xs-12 col-sm-12 col-md-5 med_desc">
                                {User.isAuthenticated() && drug.personalizedInformation &&
                                <div className="alert alert-info alert-dismissable">
                                    <a href="#" className="close" data-dismiss="alert"
                                       aria-label="close">&times;</a>
                                    <span
                                        dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                                </div>
                                }

                                {this.renderPharmaceuticalForm(drug)}

                                {this.renderDisease(drug)}

                                {this.renderActiveSubstance(drug)}


                                <div className="additional-information">
                                    {showAdditionalInfo &&
                                    <section>
                                        {this.renderIndicationGroup(drug)}

                                        {this.renderProductGroup(drug)}

                                        {this.renderPZN(drug)}
                                    </section>
                                    }

                                    <p>
                                        <button className="btn btn-info"><a onClick={this.toggleShowAdditionalInfo}>
                                            {!showAdditionalInfo && <span>{t('viewDetails')}</span>}
                                            {showAdditionalInfo && <span>{t('hideDetails')}</span>}
                                        </a></button>
                                    </p>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

                <div className="container">
                    <div className="row text-center">
                        <div className="col-lg-4">
                            <div className="row"></div>
                            <div className="row">
                                <button type="button" className="btn btn-primary dropdown-toggle"><a
                                    style={{color: "white"}} href="#about">Vor
                                    der Einnahmen</a></button>
                            </div>
                        </div>
                        <div className="col-lg-4">
                            <div className="row">
                            </div>
                            <div className="row">
                                <button type="button" className="btn btn-primary dropdown-toggle"><a
                                    style={{color: "white"}} href="#anwendung">Anwendung</a>
                                </button>
                            </div>
                        </div>
                        <div className="col-lg-4">
                            <div className="row">
                            </div>
                            <div className="row">
                                <button type="button" className="btn btn-primary dropdown-toggle"><a
                                    style={{color: "white"}}
                                    href="#nebenwirkungen">Nebenwirkungen</a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                { /*Container (About Section)*/}
                <div id="about" className="container">
                    <div className="row">
                        <div className="col-sm-12 text-center">
                            <h2>Vor der Einnahme von Prospan® Hustensaft</h2>

                            <p style={{color: "black"}}>Besondere Vorsicht bei der Einnahme von Prospan® Hustensaft ist
                                erforderlich</p>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-4">
                            <ul id="nav-tabs-wrapper" className="nav nav-tabs nav-pills nav-stacked well">
                                <li className="active"><a href="#vtab1" data-toggle="tab">Allergie</a></li>
                                <li><a href="#vtab2" data-toggle="tab">Kinder</a></li>
                                <li><a href="#vtab3" data-toggle="tab">Schwangerschaft und Stillzeit
                                </a></li>
                                <li><a href="#vtab4" data-toggle="tab"> Verkehrstüchtigkeit und das Bedienen von
                                    Maschinen

                                </a></li>
                                <li><a href="#vtab5" data-toggle="tab"> Einnahme mit anderen Arzneimitteln

                                </a></li>
                                <li><a href="#vtab5" data-toggle="tab"> Zuckerkrank

                                </a></li>


                            </ul>
                        </div>
                        <div className="col-sm-8">
                            <div className="tab-content">
                                <div role="tabpanel" className="tab-pane fade in active" id="vtab1">
                                    <h3>Allergie</h3>
                                    <p>Prospan® Hustensaft darf <b>nicht</b> eingenommen werden, wenn
                                        Sie überempfindlich (allergisch) gegenüber dem wirksamen
                                        Bestandteil oder einem der sonstigen Bestandteile des Arzneimittels
                                        sind</p>
                                </div>
                                <div role="tabpanel" className="tab-pane fade" id="vtab2">
                                    <h3>Kinder</h3>
                                    <p><b>Kinder unter einem Jahr</b> <br/>
                                        Anwendung nur nach
                                        Rücksprache mit einem Arzt. Die Einnahme bei dieser Altersgruppe sollte nur
                                        unter sorgfältiger Beobachtung
                                        erfolgen, weil bei Kindern unter einem Jahr im Vergleich zu älteren
                                        Kindern besonders auf das Auftreten von Durchfall und Erbrechen
                                        zu achten ist.
                                    </p>
                                    <div className="alert alert-info" role="alert">Bitte beachten Sie auch die Hinweise
                                        unter <a
                                            href="#"><b>Nebenwirkungen</b></a>.
                                    </div>

                                </div>
                                <div role="tabpanel" className="tab-pane fade in" id="vtab3">
                                    <h3>Schwangerschaft und Stillzeit </h3>

                                    <div className="alert alert-danger" role="alert">
                                        <p>Dieses Arzneimittel soll in der Schwangerschaft und Stillzeit <b>nicht</b>
                                            angewendet werden, da keine ausreichenden Untersuchungen
                                            vorliegen.
                                        </p>
                                    </div>

                                </div>
                                <div role="tabpanel" className="tab-pane fade in" id="vtab4">
                                    <h3>Verkehrstüchtigkeit und das Bedienen von Maschinen</h3>
                                    <div className="alert alert-success" role="alert">
                                        <p>Es sind keine besonderen Vorsichtsmaßnahmen erforderlich.
                                        </p>
                                    </div>


                                </div>
                                <div role="tabpanel" className="tab-pane fade in" id="vtab5">
                                    <h3>Einnahme mit anderen Arzneimitteln</h3>
                                    <p>Dieses Arzneimittel enthält Sorbitol. Bei jeder Anwendung werden
                                        bis zu 1,9 g Sorbitol zugeführt.
                                        <div className="alert alert-warning" role="alert"> Bitte nehmen Sie Prospan®
                                            Hustensaft erst nach Rücksprache
                                            mit Ihrem Arzt ein, wenn Ihnen bekannt
                                            ist, dass Sie unter einer Unverträglichkeit gegenüber bestimmten Zuckern
                                            leiden.</div>


                                    </p>
                                </div>
                                <div role="tabpanel" className="tab-pane fade in" id="vtab5">
                                    <h3>Zuckerkrank</h3>
                                    <p>Es wurden keine Untersuchungen durchgeführt. Bisher sind keine
                                        Wechselwirkungen bekannt geworden.
                                        <div className="alert alert-warning" role="alert"> Bitte informieren Sie Ihren
                                            Arzt oder Apotheker, wenn Sie andere Arzneimittel einnehmen /
                                            anwenden bzw. vor kurzem eingenommen / angewendet haben,
                                            auch wenn es sich um nicht verschreibungspflichtige Arzneimittel
                                            handelt</div>

                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="container-fluid bg-grey">
                    <div className="container bg-grey" id="anwendung" style={{marginTop: "90px"}}>
                        <div className="row">
                            <div className="col-sm-12 text-center">
                                <h2>Anwendung von Prospan® Hustensaft </h2>

                            </div>
                        </div>

                        <div className="row text-center">


                            <div className="alert alert-info" role="alert"> Nehmen Sie Prospan® Hustensaft immer genau
                                nach der Anweisung
                                dieser Packungsbeilage ein. <br/> Bitte fragen Sie bei Ihrem Arzt oder
                                Apotheker nach, wenn Sie sich nicht ganz sicher sind.
                            </div>


                            <div className="col-sm-12">
                                <div className="panel with-nav-tabs panel-primary">
                                    <div className="panel-heading">
                                        <ul className="nav nav-tabs">
                                            <li className="active"><a href="#tab1primary" data-toggle="tab">Dosis</a>
                                            </li>
                                            <li><a href="#tab2primary" data-toggle="tab">Art</a></li>
                                            <li><a href="#tab3primary" data-toggle="tab">Dauer</a></li>

                                        </ul>
                                    </div>
                                    <div className="panel-body">
                                        <div className="tab-content">
                                            <div className="tab-pane fade in active" id="tab1primary">
                                                <div className="row">
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>


                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "60px"}}>

                                                        <i className="fas fa-baby"></i>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "60px"}}>

                                                        <i className="fas fa-child"></i>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "60px"}}>

                                                        <i className="fas fa-male"></i>
                                                        <i className="fas fa-blind"></i>
                                                    </div>
                                                </div>
                                                <div className="row">
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p style={{fontWeight: "bold"}}>Alter</p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p> Kinder unter 6 Jahren</p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p> Kinder von 6 - 12 Jahren</p>

                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p> Kinder ab 6 Jahren & Erwachsene</p>
                                                    </div>
                                                </div>
                                                <hr/>
                                                <div className="row">
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p style={{fontWeight: "bold"}}>Einzeldosis</p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>2,5 ml <br/> &#8793; <br/> 17,5 mg
                                                            Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>5 ml <br/> &#8793; <br/> 35 mg Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>5 ml <br/> &#8793; <br/> 35 mg Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                </div>
                                                <hr/>

                                                <div className="row">
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p style={{fontWeight: "bold"}}>Tagesgesamtdosis</p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>5 ml (2 x 2,5 ml) <br/> &#8793; <br/> 35 mg
                                                            Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>10 ml (2 x 5 ml) <br/> &#8793; <br/> 70 mg
                                                            Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                    <div className="col-lg-3" style={{fontSize: "16px"}}>

                                                        <p>15 ml (3 x 5 ml) <br/> &#8793; <br/> 105 mg
                                                            Efeublätter-Trockenextrakt
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div className="tab-pane fade" id="tab2primary">
                                                <div className="row">
                                                    <div className="col-lg-4 col-lg-offset-4">
                                                        <table className="table table-striped custab">
                                                            <tr>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> 1x</h4>
                                                                </td>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> Morgens</h4>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> 1x </h4>
                                                                </td>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> (Mittags)</h4>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> 1x</h4>
                                                                </td>
                                                                <td>
                                                                    <h4 style={{marginBottom: "0px"}}> Abends</h4>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </div>
                                                </div>
                                                <div className="alert alert-info" role="alert"> Die Flasche vor jedem
                                                    Gebrauch gut schütteln! <br/>
                                                    Zum Einnehmen mit dem beigefügten Messbecher <i
                                                        className="fas fa-glass-whiskey"></i>.
                                                </div>


                                            </div>
                                            <div className="tab-pane fade" id="tab3primary">
                                                <div className="row">
                                                    <div className="col-lg-8 col-lg-offset-2">
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
                                            <div className="tab-pane fade" id="tab4primary">Primary 4</div>
                                            <div className="tab-pane fade" id="tab5primary">Primary 5</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div id="nebenwirkungen" className="container" style={{marginTop: "90px"}}>
                    <div className="row">
                        <div className="col-sm-12 text-center">
                            <h2>Nebenwirkungen</h2>

                        </div>
                    </div>


                    <div className="row">
                        <div className="col-lg-12 text-center" style={{color: "black"}}>

                            Wie alle Arzneimittel kann Prospan® Hustensaft Nebenwirkungen
                            haben, die aber nicht bei jedem auftreten müssen. <br/>
                            Bei der Bewertung von Nebenwirkungen werden folgende Häufigkeiten zugrundegelegt:
                            <div className="row">
                                <div className="col-lg-4 col-lg-offset-4 text-left">
                                    <table className="table table-striped custab" style={{marginTop: "30px"}}>
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
                                                Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar
                                            </td>
                                        </tr>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-4">
                            <ul id="nav-tabs-wrapper" className="nav nav-tabs nav-pills nav-stacked well">
                                <li className="active"><a href="#vtab11" data-toggle="tab">Allergische Reaktionen</a></li>
                                <li><a href="#vtab12" data-toggle="tab">Magen-Darm-Beschwerden </a></li>


                            </ul>
                        </div>
                        <div className="col-sm-8">
                            <div className="tab-content">
                                <div role="tabpanel" className="tab-pane fade in active" id="vtab11"
                                     style={{padding: "25px"}}>
                                    <span className="label label-primary">Atemnot</span>
                                    <span className="label label-primary">Schwellungen</span>
                                    <span className="label label-primary">Hautrötungen</span>
                                    <span className="label label-primary">Juckreiz</span>
                                    <span className="label label-primary">Atemnot</span>
                                    <br/> <br/>

                                    <p><b>Häufigkeit:</b> Nicht bekannt</p>


                                </div>
                                <div role="tabpanel" className="tab-pane fade" id="vtab12" style={{padding: "20px"}}>
                                    Aufgrund des Sorbitolgehaltes: <br/>
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

                {
                    this.renderSectionList(drug)
                }

            </div>


        );

    }
}

export default translate()(DrugDetail);