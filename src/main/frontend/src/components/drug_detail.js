import axios from "axios";
import React from "react";
import scrollToComponent from 'react-scroll-to-component';
import {translate} from "react-i18next";
import {toast} from 'react-toastify';
import {
    BrowserView,
    MobileView,
    isBrowser,
    isMobile
} from 'react-device-detect';
import Accordion from "./accordion";
import Loading from "./loading";
import User from "./../util/User";

import {FontAwesomeIcon} from '@fortawesome/react-fontawesome'
import {
    faInfo,
    faCommentMedical,
    faAddressCard,
    faChevronDown,
    faHashtag,
    faCrosshairs
} from "@fortawesome/free-solid-svg-icons";
import {Link} from "react-router-dom";

class DrugDetail extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            drug: undefined,
            showAdditionalInfo: false,
            intervalId: 0,
            thePosition: false,
            width: window.innerWidth,

        }

        this.toggleShowAdditionalInfo = this.toggleShowAdditionalInfo.bind(this);
        this.toggleOriginalAndTailoredText = this.toggleOriginalAndTailoredText.bind(this);
    }

    //=============================
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


    renderSectionList(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection.map((section => {
            return (<Accordion section={section} toggleOriginalAndTailoredText={this.toggleOriginalAndTailoredText}
                               key={section.id}/>);
        }));
    }

    /**
     * Speechbubble
     */
    renderSpeechPersonalizedInformation = () => {
        let that = this;
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <div className="alert modal1 " data-dismis="alert">
                    <div className=" alert bubble_right row w3-animate-right">
                        <div className=" speech-bubble_right">
                            <a href="#" className="close" data-dismiss="alert"
                               aria-label="close">&times;</a>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                        </div>
                        <img className="speech-bubble_right-person"
                             src="./../../assets/images/logo_chat.png" alt={"speechbubble"}/>
                    </div>
                </div>
            </div>
        )
    }
    //Spechbubble end


    /**
     * Buttons
     */

    renderInfoButton = () => {
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <div className="round-button-outer report-round-button round_info hidden-lg hidden-md">
                    <div id="reportBtn" className="round-button-inner-main" data-toggle="modal"
                         data-target="#info">
                        <FontAwesomeIcon icon={faInfo}/>
                    </div>
                </div>
                <div className="modal fade" id="info" tabIndex="-1" role="dialog" aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>Informationen
                                </h2>

                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                <span
                    dangerouslySetInnerHTML={this.createMarkup(t("textinfo").replace("%XXX%", drug.name))}/>
                            </div>
                            <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    renderReportButton = () => {
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <div className="round-button-outer report-round-button no_animation round_nebenwirkung">
                    <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                         data-target="#melden">
                        <FontAwesomeIcon icon={faCommentMedical}/>
                    </div>
                </div>
                <div className="modal fade" id="melden" tabIndex="-1" role="dialog"
                     aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>Meldung von Nebenwirkungen </h2>

                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <span dangerouslySetInnerHTML={this.createMarkup(t("inform"))}/>
                            </div>
                            <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
            </div>
        )
    }
    renderStoreButton = () => {
        const {t} = this.props;
        const drug = this.state.drug;
        return (<div>
                <div className="round-button-outer report-round-button no_animation round_aufbewahrung">
                    <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                         data-target="#aufbewahrung">
                        <i className="fas fa-archive"></i>
                    </div>
                </div>
                <div className="modal fade" id="aufbewahrung" tabIndex="-1" role="dialog"
                     aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>Aufbewahrung des Medikaments</h2>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.renderPackStore(drug)}
                            </div>
                            <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    renderPackStore(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 7
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            }))
            .reduce((prev, curr) => [prev, curr]);
    }

    renderLikeButton = () => {
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <div className="like-button-outer1 like-round-button round_heart">
                    <div type="button" className="like-button-inner-main1 like-button-heart"
                         onClick={() => this.toggleTaking(drug)}>
                <span
                    className={" white" + ((!drug.isTaken) ? " far fa-heart" : " fas fa-heart")}/>
                    </div>
                </div>
            </div>
        )
    }
    renderAddButton = () => {
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <div className="like-button-outer1 like-round-button round_plus">
                    <div type="button" className="like-button-inner-main1 like-button-plus"
                         onClick={() => this.toggleRemember(drug)}>
                <span
                    className={"glyphicon white" + ((!drug.isRemembered) ? " glyphicon-plus" : " glyphicon-minus")}/>
                    </div>
                </div>
            </div>
        )
    }

    renderWordExplanationButton(drug) {
        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return (
            <div>
                <div className="round-button-outer1 report-round-button1 round_def">
                    <div id="defBtn" className="round-button-inner-main1" data-toggle="modal" data-target="#def">
                        <i className="fas fa-book"/></div>
                </div>
                <div className="modal fade" id="def" tabIndex="-1" role="dialog" aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2><i className="fas fa-book"/> Fachausdrücke
                                </h2>

                            </div>
                            <div className="modal-body" style={{color: "black"}}>

                                {this.renderWordExplanationsdesktop(drug)}
                                {this.renderWordExplanationsmobile(drug)}

                                <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }

    renderWordExplanation(drug) {

        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return drug.wordExplaination
            .map((section => {
                return (
                    <div key={section.id} className="modal fade" id={section.name.toLowerCase().split(' ').join('_')}
                         tabIndex="-1" role="dialog"
                         aria-hidden="true">
                        <div className="modal-dialog" role="document">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <i className="fas fa-question"></i>
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

    renderWordExplanationsdesktop(drug) {

        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return (
            <div>
                <input type="text" id="myInput" onKeyUp={this.searchWord.bind(this)} placeholder="Begriff eingeben"
                       title="Begriff eingeben"/>
                <table id="myTable" className="table table-bordered table-striped hidden-xs">
                    <thead>
                    <tr>
                        <th>Begriff</th>
                        <th>Erklärung</th>
                    </tr>
                    </thead>
                    <tbody>
                    <script src="assets/js/ownjs.js"></script>
                    {drug.wordExplaination
                        .map((section => {
                            return (
                                <tr key={section.id}>
                                    <td><p key={section.id}>{section.name}</p></td>
                                    <td><p key={section.id}><span
                                        dangerouslySetInnerHTML={this.createMarkup(section.description)}/>
                                    </p></td>
                                </tr>
                            )
                        })).reduce((prev, curr) => [prev, curr])}
                    </tbody>
                </table>
            </div>
        )

    }

    renderWordExplanationsmobile(drug) {

        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return (
            <div>
                <script src="assets/js/ownjs.js"></script>
                {drug.wordExplaination
                    .map((section => {
                        return (
                            <div className="row hidden-lg hidden-md hidden-sm explain_box" key={section.id}>
                                <h4>{section.name}</h4>
                                <p key={section.id}><span
                                    dangerouslySetInnerHTML={this.createMarkup(section.description)}/>
                                </p>
                            </div>


                        )
                    })).reduce((prev, curr) => [prev, curr])}

            </div>
        )

    }

    renderCompanyButton = () => {
        return (
            <div>
                <span className="pharmadetails" data-toggle="modal"
                      data-target="#address">
                <FontAwesomeIcon icon={faAddressCard}/> Pharmazeutischer Unternehmer und Hersteller</span>
            </div>
        )
    }

    renderPackcompany(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 4
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.address)}/>
                    </p>
                );
            }))
            .reduce((prev, curr) => [prev, curr]);
    }

    renderBackToMedbutton = () => {
        return (
            <div>
                <a href="#/drug/list">  <button type="button" className="btn btn-primary"><i className="far fa-arrow-alt-circle-left"/> zurück zu den
                    Medikamenten</button></a>
            </div>
        )
    }

    //END Buttons

    /**
     * Basic Informations
     */
    renderBasicInformation = () => {
        let that = this;
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <div>
                <img className="featurette-image img-responsive center-block"
                     alt={drug.name}
                     title={drug.name}
                     src={`/image/drug/${drug.id}`
                     }>
                </img>
                <div className="row med_head">
                    <span>{drug.name}</span>
                </div>
                <div className="drug-features ">
                    {this.renderDrugFeaturesDesc(drug)}
                    <div>
                        <div style={{cursor: "pointer"}} data-toggle="modal"
                             data-target="#infoicons"><i
                            className="fas fa-info-circle circleinfo_icon"/></div>
                    </div>
                </div>
            </div>
        )
    }

    renderListLevels = () => {
        return (
            <div>
                <ul className="nav nav-pills brand-pills nav-stacked hidden-xs hidden-sm "
                    role="tablist">
                    <li role="presentation" className="brand-nav active">
                        <a href="#tab1"
                           aria-controls="tab1"
                           role="tab"
                           data-toggle="tab">Allgemeine
                            Informationen</a></li>
                    <div id="arrow-down">
                        <FontAwesomeIcon icon={faChevronDown}/>
                    </div>
                    <li role="presentation" className="brand-nav">
                        <a href="#tab2"
                           aria-controls="tab2"
                           role="tab"
                           data-toggle="tab">Vor der
                            Anwendung </a></li>
                    <div id="arrow-down">
                        <FontAwesomeIcon icon={faChevronDown}/>
                    </div>
                    <li role="presentation" className="brand-nav">
                        <a href="#tab3"
                           aria-controls="tab3"
                           role="tab"
                           data-toggle="tab">Anwendung</a>
                    </li>
                    <div id="arrow-down">
                        <FontAwesomeIcon icon={faChevronDown}/>
                    </div>
                    <li role="presentation" className="brand-nav">
                        <a href="#tab4"
                           aria-controls="tab4"
                           role="tab"
                           data-toggle="tab">Nebenwirkungen
                        </a></li>
                </ul>
            </div>
        )
    }

    renderPackVersion = () => {
        let that = this;
        const {t} = this.props;
        const drug = this.state.drug;
        return (
            <span>v. {drug.version} | {t('publishingDate')}: {new Date(drug.year).toLocaleDateString()}</span>
        )
    }

    //END Basic Informations


    /**
     * Level 1: General Informations
     */

    renderPackGeneralInstructions(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return (<div>
                <h1>Allgemeine Informationen</h1>
                <hr/>
                {drug.packagingSection
                    .filter(section => {
                        return section.topic.id === 8
                    })
                    .map((section => {
                        return (
                            <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </p>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
            </div>
        )
    }

    renderDrugFeatures(drug) {
        if (!drug.drugFeature) {
            return;
        }
        return (
            <span>
                {drug.drugFeature
                    .map(feature =>
                        <img key={feature.id} src={"./../../assets/icons/" + feature.id + ".svg"}
                             alt={feature.drugFeature}
                             title={feature.drugFeature} className="drug-feature-icon">
                        </img>
                    )
                }
                </span>
        );
    }

    renderDrugFeaturesDesc(drug) {
        const {t} = this.props;
        if (!drug.drugFeature) {
            return null;
        }
        return (

            <span>
                {drug.drugFeature.map(feature => {
                    return (
                        <span key={feature.id}>
    <img key={feature.id} data-toggle="modal" data-target={"#" + feature.id}
         src={"./../../assets/icons/" + feature.id + ".svg"} className="drug-feature-icon"
         alt={feature.drugFeature} title={feature.drugFeature}/>
    <div id={feature.id} className="modal fade" role="dialog">
    <div className="modal-dialog">
    <div className="modal-content">
    <div className="modal-header">
    <button type="button" className="close"
            data-dismiss="modal">&times;</button>
    <h2 className="modal-title">
    <img style={{width: "40px"}}
         key={feature.id}
         data-toggle="modal"
         data-target={"#" + feature.id}
         src={"./../../assets/icons/" + feature.id + ".svg"}
         className="drug-feature-icon"
         alt={feature.drugFeature}
         title={feature.drugFeature}>
    </img>
        {feature.drugFeature}
    </h2>
    </div>
    <div className="modal-body text-left">
    <div
        dangerouslySetInnerHTML={this.createMarkup(feature.descriptionDrug)}/>
    </div>
    <span
        dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
    </div>
    </div>
    </div>
    </span>

                    )
                })
                }</span>)
    }

    renderDisease(drug) {
        if (!drug.disease) {
            return null;
        }
        const {t} = this.props;
        return (
            <section className="diseases">
                <FontAwesomeIcon className="infopic" icon={faCrosshairs}/>
                <p><b> {t('usedWhen') + " "}</b></p>
                <p>{drug.disease.map(disease => <span key={disease.id}>{disease.name} <br/></span>)
                    .reduce((prev, curr) => [prev, curr])}</p>
            </section>
        );
    }

    renderPharmaceuticalForm(drug) {
        if (!drug.pharmaceuticalForm) {
            return null;
        }
        const {t} = this.props;
        return (
            <div className="col-sm-4 col-xs-6 text-center infopart" data-toggle="modal"
                 data-target="#drugform">
                <section className="diseases row" style={{cursor: "pointer"}}>
                    {drug.pharmaceuticalForm
                        .map(pharmaceuticalForm =>
                            <img key={pharmaceuticalForm.id}
                                 src={"./../../assets/p_form/" + pharmaceuticalForm.id + ".svg"}
                                 className="drug-feature-icon infopic" alt={pharmaceuticalForm.name}
                                 title={pharmaceuticalForm.name}/>
                        )
                        .reduce((prev, curr) => [prev, curr]
                        )
                    }
                    <p>
                        <b>{t('pharmaceuticalForm') + ": "} </b>
                    </p>
                    <span>
                {drug.pharmaceuticalForm
                    .map(pharmaceuticalForm =>
                            <span
                                key={pharmaceuticalForm.id}>{pharmaceuticalForm.name} <br/>
    </span>
                    )
                    .reduce((prev, curr) => [prev, ', ', curr]
                    )
                }
                </span>
                </section>
                <div style={{cursor: "pointer"}} data-toggle="modal"
                     data-target="#drugform"><i
                    className="fas fa-info-circle circleinfo_icon"/></div>
            </div>
        );
    }

    renderPharmaceuticalFormDesc(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 9
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPharmaceuticalFormImg(drug) {
        if (!drug.pharmaceuticalForm) {
            return;
        }
        const {t} = this.props;
        return (
            <span>
                {drug.pharmaceuticalForm
                    .map(pharmaceuticalForm =>
                        <img key={pharmaceuticalForm.id}
                             src={"./../../assets/p_form/" + pharmaceuticalForm.id + ".svg"}
                             className="img-drugform"
                             alt={pharmaceuticalForm.name}
                             title={pharmaceuticalForm.name}/>
                    )
                    .reduce((prev, curr) => [prev, curr])
                }
                </span>
        );
    }

    renderPackContent(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 10
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            }))
            .reduce((prev, curr) => [prev, curr]);
    }

    renderActiveSubstance(drug) {
        if (!drug.activeSubstance)
            return null;
        const {t} = this.props;
        return (
            <section><img src={"./../../assets/images/lab.svg"} className="infopic" alt={"lab"}/>
                <p>
                    <b> {t('activeSubstance') + " "}</b>
                </p>
                <p>
                    {drug.activeSubstance
                        .map(substance =>
                            <span key={substance.id}>{substance.name} <br/></span>
                        )
                        .reduce((prev, curr) => [prev, ', ', curr])
                    }
                </p>
            </section>
        );
    }

    renderPackMoreActiveSubstance(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 11
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPZN(drug) {
        if (!drug.packaging) {
            return null;
        }
        const {t} = this.props;
        return (
            <div className="col-sm-4 col-xs-6 text-center infopart">
                <section className="pzn diseases row">
                    <FontAwesomeIcon className="infopic" icon={faHashtag}/>
                    <p>
                        <b>{t('pzn') + " "}</b>
                        {drug.packaging
                            .map(packaging =>
                                <span key={packaging.id}>
    <br/>
                                    {packaging.name}
                                    <br/>
                                    {packaging.pzn}
                                    <br/>
    </span>)
                            .reduce((prev, curr) => [prev, curr])
                        }
                    </p>
                </section>
            </div>
        );
    }

    renderIndicationGroup(drug) {
        if (!drug.indicationGroup || !drug.indicationGroup.name) {
            return null;
        }
        const {t} = this.props;
        return (
            <div className="col-sm-4 col-xs-6 text-center infopart">
                <section className="row diseases">
                    <img src={"./../../assets/images/ind_group.svg"} alt={"ind_group"} className="infopic"/>
                    <p>
                        <b> {t('indicationGroup') + " "}  </b>
                    </p>
                    <p>
                        {drug.indicationGroup.name}
                    </p>
                </section>
            </div>
        );
    }

    renderProductGroup(drug) {
        if (!drug.productGroup || !drug.productGroup.name) {
            return null;
        }
        const {t} = this.props;
        return (
            <div className="col-sm-4 col-xs-6 text-center infopart">
                <section className="row diseases">
                    <img src={"./../../assets/images/productgroup.png"} alt={"productgroup"} className="infopic"/>
                    <p>
                        <b>{t('productGroup') + " "}</b>
                    </p>
                    <p>
                        {drug.productGroup.name}
                    </p>
                </section>
            </div>
        );
    }

    // renderSectionOverview(drug) {
    //     if (!drug.packagingSection) {
    //         return null;
    //     }
    //     return drug.packagingSection.map((section => {
    //         return (
    //             <p key={section.id}>{section.topic.title}</p>
    //         );
    //     }));
    // }

    //END Level 1:  General Informations


    /**
     * Level 2: Before Application
     */
    renderPackLevel2Warning(drug) {
        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 3
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            }))
            .reduce((prev, curr) => [prev, curr]);
    }

    //END Level 2: Before Application


    /**
     * Level 3: Application
     */
    renderPackLevel3Dosage(drug) {

        if (!drug.packagingSection) {
            return null;
        }
        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 5
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            }))
            .reduce((prev, curr) => [prev, curr]);
    }

    //END Level 3: Application


    /**
     * Level 4: Adverse effects
     */
    renderPackLevel4Adverse(drug) {

        if (!drug.packagingSection) {
            return null;
        }
        return (
            <div>
                {drug.packagingSection
                    .filter(section => {
                        return section.topic.id === 6
                    })
                    .map((section => {
                        return (
                            <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </p>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])}
                <div className="row" style={{marginBottom: "30px"}}>
                    <h4>Folgende Nebenwirkungen können auftreten:
                    </h4>
                    <p style={{fontStyle: "italic"}}>
                        Bei der Bewertung von Nebenwirkungen werden folgende Häufigkeitsangaben zugrunde gelegt. Klicken
                        Sie auf die Kachel um Informationen zu den Nebenwikungen zu erhalten
                    </p>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12 neben_tile brightgreen"
                         data-toggle="modal"
                         data-target="#neben_sehrhaeufig">
                        <h1>Sehr häufig</h1>
                        <p>Die Nebenwirkung betrifft mehr als 1 Behandelten von 10
                        </p>
                    </div>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12  neben_tile brightgreen"
                         data-toggle="modal"
                         data-target="#neben_haeufig">
                        <h1>Häufig</h1>
                        <p>Die Nebenwirkung betrifft 1 bis 10 Behandelte von 100
                        </p>
                    </div>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12  neben_tile brightyellow"
                         data-toggle="modal"
                         data-target="#neben_gelegentlich">
                        <h1>Gelegentlich</h1>
                        <p>Die Nebenwirkung betrifft 1 bis 10 Behandelte von 1.000
                        </p>
                    </div>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12  neben_tile brightred"
                         data-toggle="modal"
                         data-target="#neben_selten">
                        <h1>Selten</h1>
                        <p>Die Nebenwirkung betrifft 1 bis 10 Behandelte von 10.000
                        </p>
                    </div>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12  neben_tile brightred"
                         data-toggle="modal"
                         data-target="#neben_sehrselten">
                        <h1>Sehr selten</h1>
                        <p>Die Nebenwirkung betrifft weniger als 1 Behandelten von
                            10.000
                        </p>
                    </div>
                    <div onClick={this.renderhide.bind(this)}
                         className="col-sm-6 col-xs-12  neben_tile brightgrey"
                         data-toggle="modal"
                         data-target="#neben_nichtbekannt">
                        <h1>Nicht bekannt</h1>
                        <p>Häufigkeit auf Grundlage der verfügbaren Daten nicht
                            abschätzbar
                        </p>
                    </div>
                    <div className="col-sm-12 col-xs-12  neben_tile nebenall"
                         data-toggle="modal"
                         data-target="#neben_all">
                        <h1>Alle Nebenwirkungen</h1>
                        <p>Hier werden alle möglichen Nebenwirkungen aufgelistet
                        </p>
                    </div>
                </div>
            </div>
        )
    }

    rendersehrhaeufigdesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="sehrhaeufig_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="sehrhaeufig" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    renderhaeufigdesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="haeufig_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="haeufig" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    rendergelegentlichdesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="gelegentlich_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="gelegentlich" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    renderseltendesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="selten_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="selten" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    rendersehrseltendesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="sehrselten_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="sehrselten" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    rendernichtbekanntdesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <table className="sideffect_table hidden-xs">
                <thead>
                <tr>
                    <th>Erkrankung</th>
                    <th>Nebenwirkung</th>
                </tr>
                </thead>
                <tbody className="nichtbekannt_cont">
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <tr id="nichtbekannt" key={section.id} className={section.number}>
                                <td key={section.id}>{section.purpose}</td>
                                <td className="sectiontext"
                                    dangerouslySetInnerHTML={this.createMarkup(section.text)}/>

                            </tr>
                        );
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }
                </tbody>
            </table>
        )
    }

    renderalldesktop(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <div>

                <input onKeyUp={this.searchAdverseEffectDesktop.bind(this)} type="text" id="search" placeholder="Suche"
                       className="hidden-xs myInput"/>
                <table id="table" className="sideffect_table hidden-sm hidden-xs">
                    <thead>
                    <tr>
                        <th>Erkrankung</th>
                        <th>Nebenwirkung</th>
                    </tr>
                    </thead>
                    <tbody className=" ">
                    {drug.sideEffectContent
                        .map((section => {
                            return (
                                <tr key={section.id}>
                                    <td key={section.id}>{section.purpose}</td>
                                    <td className="sectiontext"
                                        dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                </tr>
                            );
                        }))
                        .reduce((prev, curr) => [prev, curr])
                    }
                    </tbody>
                </table>
            </div>
        )
    }

    rendersehrhaeufigmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="sehrhaeufig_cont hidden-sm hidden-md hidden-lg  ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <div className="neben_xs">
                                            <h4>Erkrankung</h4>
                                            <b> <span key={section.id}>{section.purpose}</span></b>
                                            <h4>Nebenwirkung:</h4>
                                            <span className="sectiontext"
                                                  dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    renderhaeufigmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="haeufig_cont hidden-sm hidden-md hidden-lg  ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    rendergelegentlichmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="gelegentlich_cont hidden-sm hidden-md hidden-lg  ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    renderseltenmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="selten_cont hidden-sm hidden-md hidden-lg  ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    rendersehrseltenmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="sehrselten_cont hidden-sm hidden-md hidden-lg  ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    rendernichtbekanntmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (<div>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div className="nichtbekannt_cont hidden-sm hidden-md hidden-lg ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    renderallmobile(drug) {
        if (!drug.sideEffectContent) {
            return null;
        }
        return (
            <div>
                <input id="mysideEffect" onKeyUp={this.searchAdverseEffect.bind(this)} type="text" placeholder="Search.."
                       className="hidden-sm hidden-md hidden-lg myInput"/>
                {drug.sideEffectContent
                    .map((section => {
                        return (
                            <div id="myDIV" className="all_cont   hidden-md hidden-lg ">
                                <div key={section.id} className={section.number}>
                                    <div className="neben_xs">
                                        <h4>Erkrankung</h4>
                                        <b> <span key={section.id}>{section.purpose}</span></b>
                                        <h4>Nebenwirkung:</h4>
                                        <span className="sectiontext"
                                              dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                                    </div>
                                </div>
                            </div>
                        )
                    }))
                    .reduce((prev, curr) => [prev, curr])
                }</div>
        )
    }

    renderhide = () => {
        $(".sehrhaeufig_cont > .2").css("display", "none");
        $(".sehrhaeufig_cont > .3").css("display", "none");
        $(".sehrhaeufig_cont > .4").css("display", "none");
        $(".sehrhaeufig_cont > .5").css("display", "none");
        $(".sehrhaeufig_cont > .6").css("display", "none");
        $(".haeufig_cont > .1").css("display", "none");
        $(".haeufig_cont > .3").css("display", "none");
        $(".haeufig_cont > .4").css("display", "none");
        $(".haeufig_cont > .5").css("display", "none");
        $(".haeufig_cont > .6").css("display", "none");
        $(".gelegentlich_cont > .1").css("display", "none");
        $(".gelegentlich_cont > .2").css("display", "none");
        $(".gelegentlich_cont > .4").css("display", "none");
        $(".gelegentlich_cont > .5").css("display", "none");
        $(".gelegentlich_cont > .6").css("display", "none");
        $(".selten_cont > .1").css("display", "none");
        $(".selten_cont > .2").css("display", "none");
        $(".selten_cont > .3").css("display", "none");
        $(".selten_cont > .5").css("display", "none");
        $(".selten_cont > .6").css("display", "none");
        $(".sehrselten_cont > .1").css("display", "none");
        $(".sehrselten_cont > .2").css("display", "none");
        $(".sehrselten_cont > .3").css("display", "none");
        $(".sehrselten_cont > .4").css("display", "none");
        $(".sehrselten_cont > .6").css("display", "none");
        $(".nichtbekannt_cont > .1").css("display", "none");
        $(".nichtbekannt_cont > .2").css("display", "none");
        $(".nichtbekannt_cont > .3").css("display", "none");
        $(".nichtbekannt_cont > .4").css("display", "none");
        $(".nichtbekannt_cont > .5").css("display", "none");
    }

    //END Level 4: Adverse effects


    /**
     * Functions
     */
    windowscroll = () => {
        window.scroll(0, 300);
    }

    scrollToTop = () => {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }
    renderGoTopIcon = () => {
        return (
            <div>
                <span onClick={this.scrollToTop.bind(this)} id="button_top"></span>
            </div>
        )
    }


    searchAdverseEffectDesktop = () => {
        $(document).ready(function(){
            $("#search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#table tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    }


    searchWord = () => {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("myInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("myTable");
        tr = table.getElementsByTagName("tr");
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    }

    searchAdverseEffect = () => {
        $("#mysideEffect").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#myDIV div").filter(function () {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
    }

    componentWillMount() {
        window.addEventListener('resize', this.handleWindowSizeChange);
    }

    componentWillUnmount() {
        window.removeEventListener('resize', this.handleWindowSizeChange);
    }

    handleWindowSizeChange = () => {
        this.setState({width: window.innerWidth});
    };

    //END Functions

    renderAllModals = () => {
        let that = this;
        const {t} = this.props;
        const drug = this.state.drug;
        const showAdditionalInfo = this.state.showAdditionalInfo;

        return (
            <div>
                <div className="modal fade" id="neben_info" tabIndex="-1" role="dialog"
                     aria-labelledby="neben_info"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>Angaben zur Häufigkeit von Nebenwirkungen
                                </h2>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <span dangerouslySetInnerHTML={this.createMarkup(t("frequency_sideeffect"))}/>
                            </div>
                            <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="drugform" tabIndex="-1"
                     role="dialog"
                     aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>Inhalt und Darstellung des
                                    Medikaments</h2>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                <div className="row">
                                    <div
                                        className="col-sm-2 col-xs-12 xs-center">{this.renderPharmaceuticalFormImg(drug)}</div>
                                    <div className="col-sm-10 col-xs-12  ">
                                        {this.renderPharmaceuticalFormDesc(drug)}
                                    </div>
                                </div>
                                <div className="row">
                                    <div
                                        className="col-sm-2 col-xs-12 xs-center"><i
                                        className="drug_pack_icon fas fa-prescription-bottle-alt"></i>
                                    </div>
                                    <div className="col-sm-10 col-xs-12 xs-center"
                                         style={{paddingTop: "10px"}}>
                                        {this.renderPackContent(drug)}
                                    </div>
                                </div>
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="infosubstance" tabIndex="-1"
                     role="dialog"
                     aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                {drug.activeSubstance.map(substance =>
                                    <h2 key={substance.id}><img
                                        src={"./../../assets/images/lab.svg"}
                                        className="infopic"
                                        alt={"lab"}/> {substance.name}
                                    </h2>)
                                    .reduce((prev, curr) => [prev, ', ', curr])}
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                <span> {drug.activeSubstance.map(substance =>
                    <span
                        key={substance.id}>{substance.name} ist ein Arzneistoff aus der Gruppe der sogenannten {substance.substanceGroup.name}.</span>)
                    .reduce((prev, curr) => [prev, ', ', curr])} </span>
                                {this.renderPackMoreActiveSubstance(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_sehrhaeufig" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_info"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightgreen">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Sehr häufig
                                </h2>
                                <p>Die Nebenwirkung betrifft mehr als 1 Behandelten von
                                    10 </p>
                                <p><b>Bedeutung</b> <br/>Bei mehr als 10 % der
                                    Behandelten
                                    ist die Nebenwirkung aufgetreten.
                                </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.rendersehrhaeufigdesktop(drug)}
                                {this.rendersehrhaeufigmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_haeufig" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_haeufig"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightgreen">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Häufig </h2>
                                <p>Die Nebenwirkung betrifft 1 bis 10 Behandelte von
                                    100 </p>
                                <p><b>Bedeutung</b> <br/>Bei 1 bis 10 % der Behandelten
                                    ist
                                    die Nebenwirkung aufgetreten.
                                </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.renderhaeufigdesktop(drug)}
                                {this.renderhaeufigmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_gelegentlich" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_gelegentlich"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightyellow">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Gelegentlich </h2>
                                <p> Die Nebenwirkung betrifft 1 bis 10 Behandelte von
                                    1.000 </p>
                                <p><b>Bedeutung</b> <br/>Bei 0,1 % bis 1 % der
                                    Behandelten
                                    ist die Nebenwirkung aufgetreten.
                                </p>

                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.rendergelegentlichdesktop(drug)}
                                {this.rendergelegentlichmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_selten" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_selten"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightred">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Selten </h2>
                                <p> Die Nebenwirkung betriff 1 bis 10 Behandelte von
                                    10.000 </p>
                                <p><b>Bedeutung</b><br/> Bei 0,01 % bis 0,1 % der
                                    Behandelten
                                    ist die Nebenwirkung aufgetreten.
                                </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.renderseltendesktop(drug)}
                                {this.renderseltenmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_sehrselten" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_sehrselten"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightred">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Sehr selten
                                </h2>
                                <p> Die Nebenwirkung betrifft weniger als 1 Behandelten
                                    von 10.000 </p>
                                <p><b>Bedeutung</b> <br/>Bei weniger als 0,01 % der
                                    Behandelten ist die Nebenwirkung aufgetreten.
                                </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.rendersehrseltendesktop(drug)}
                                {this.rendersehrseltenmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_nichtbekannt" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_nichtbekannt"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightgrey">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Nicht Bekannt </h2>
                                <p> Häufigkeit auf Grundlage der verfügbaren Daten nicht
                                    abschätzbar </p>
                                <p><b>Bedeutung</b> <br/> Es sind nur Einzelfälle
                                    bekannt,
                                    daraus kann die Häufigkeit des Auftretens nicht
                                    bestimmt werden.

                                </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.rendernichtbekanntdesktop(drug)}
                                {this.rendernichtbekanntmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="neben_all" tabIndex="-1"
                     role="dialog" aria-labelledby="neben_all"
                     aria-hidden="true">
                    <div className="modal-dialog modal-lg" role="document">
                        <div className="modal-content brightgrey">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2>
                                    Alle Nebenwirkungen</h2>
                                <p> Hier finden Sie alle möglichen Nebenwirkungen. </p>
                            </div>
                            <div className="modal-body" style={{color: "black"}}>
                                {this.renderalldesktop(drug)}
                                {this.renderallmobile(drug)}
                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="infoicons" tabIndex="-1" role="dialog"
                     aria-labelledby="addressLabel"
                     aria-hidden="true">
                    <div className="modal-dialog" role="document">
                        <div className="modal-content">
                            <div className="modal-header">
                                <button type="button" className="close"
                                        data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                <h2> Was bedeuten die Symbole?
                                </h2>
                            </div>
                            <div className="modal-body text-center-xs" style={{color: "black"}}>
                                {drug.drugFeature.map(feature =>
                                        <div className="row">
                                            <div className="col-sm-1 col-xs-12">
                                                <img key={feature.id}
                                                     src={"./../../assets/icons/" + feature.id + ".svg"}
                                                     alt={feature.drugFeature}
                                                     title={feature.drugFeature}
                                                     className="drug-feature-icon icon_page"/>
                                            </div>
                                            <div
                                                className="col-sm-11 col-xs-12 drug-feature-title">
    <span className="drug-feature-title"
          key={feature.id}>{feature.drugFeature}</span>
                                            </div>
                                        </div>
                                ).reduce((prev, curr) => [prev, ', ', curr])}
                                <div className="row">
                                    Weitere Informationen finden Sie unter der Rubrik <a className="hidden-xs hidden-sm"
                                    href="#tab2" aria-controls="tab2" role="tab"
                                    data-toggle="tab" aria-expanded="true"
                                    data-dismiss="modal">Warnhinweise und
                                    Vorsichtsmaßnahmen
                                </a>
                                   <a className="hidden-lg hidden-md" data-toggle="collapse"
                                    data-target="#mobile_tab2"
                                    data-parent="#accordion" data-dismiss="modal">Warnhinweise und
                                    Vorsichtsmaßnahmen
                                </a>
                                </div>

                            </div>
                            <span
                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
                <div className="modal fade" id="address" tabIndex="-1" role="dialog"
                     aria-labelledby="addressLabel"
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
                                {this.renderPackcompany(drug)}
                            </div>
                            <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                        </div>
                    </div>
                </div>
            </div>
        )
    }

    renderContent = () => {
        let that = this;
        const {t} = this.props;
        const drug = this.state.drug;
        const showAdditionalInfo = this.state.showAdditionalInfo;
        const {width} = this.state;
        const isMobile = width <= 992;
        if (isMobile) {
            return (<div className="row tab_headers  hidden-lg  ">
                    <div className="panel-group" id="accordion">
                        <div className="panel panel-default mob_panel_default">
                            <div className="panel-heading mob_heading" data-toggle="collapse"
                                 data-target="#mobile_tab1"
                                 data-parent="#accordion">
                                <h4 className="panel-title text-center-xs mob_title"
                                    >
                <span className="hidden-lg   ">
                </span> Allgemeine Informationen
                                </h4>
                            </div>
                            <div id="mobile_tab1" className="panel-collapse collapse ">
                                <div className="panel-body">
                                    <div className="row content_header">
                                        {this.renderPackGeneralInstructions(drug)}
                                    </div>
                                    <div className="row">
                <span
                    dangerouslySetInnerHTML={this.createMarkup(t("helptext_general"))}/>

                                        {this.renderPharmaceuticalForm(drug)}
                                        <div className="col-sm-4 col-xs-6 text-center infopart">
                                            {this.renderDisease(drug)}
                                        </div>
                                        <div className="col-sm-4 col-xs-6 text-center infopart"
                                             data-toggle="modal"
                                             data-target="#infosubstance">
                                            {this.renderActiveSubstance(drug)}
                                            <div style={{cursor: "pointer"}} data-toggle="modal"
                                                 data-target="#infosubstance"><i
                                                className="fas fa-info-circle circleinfo_icon"/></div>
                                        </div>
                                        {showAdditionalInfo &&
                                        <div className="">
                                            <div className="additional-information">
                                                <section>
                                                    {this.renderIndicationGroup(drug)}
                                                    {this.renderProductGroup(drug)}
                                                    {this.renderPZN(drug)}
                                                </section>
                                            </div>
                                        </div>}
                                    </div>
                                    <div className="row text-center">
                                        <p>
                                            <a onClick={this.toggleShowAdditionalInfo}>
                                                <button
                                                    className="btn btn-secondary black weiter_btn">
                                                    {!showAdditionalInfo &&
                                                    <span>{t('viewDetails')}</span>}
                                                    {showAdditionalInfo &&
                                                    <span>{t('hideDetails')}</span>}
                                                </button>
                                            </a>
                                        </p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div className="panel panel-default mob_panel_default">
                            <div className="panel-heading mob_heading" data-toggle="collapse"
                                 data-target="#mobile_tab2"
                                 data-parent="#accordion">
                                <h4 className="panel-title mob_title text-center-xs"
                                    >
                <span className="hidden-lg  ">
                </span> Vor der Anwendung
                                </h4>
                            </div>
                            <div id="mobile_tab2" className="panel-collapse collapse ">
                                <div className="panel-body">
                                    {this.renderPackLevel2Warning(drug)}

                                </div>
                            </div>
                        </div>
                        <div className="panel panel-default mob_panel_default">
                            <div className="panel-heading mob_heading" data-toggle="collapse"
                                 data-target="#mobile_tab3"
                                 data-parent="#accordion">
                                <h4 className="panel-title mob_title text-center-xs"
                                    >
                <span className="hidden-lg  ">
                </span> Anwendung
                                </h4>
                            </div>
                            <div id="mobile_tab3" className="panel-collapse collapse ">
                                <div className="panel-body">
                                    <div className="row content_header">
                                        <h1>Dosierung und Anwendung</h1>
                                        <hr/>
                                    </div>
                                    {this.renderPackLevel3Dosage(drug)}
                                </div>
                            </div>
                        </div>
                        <div className="panel panel-default mob_panel_default">
                            <div className="panel-heading mob_heading" data-toggle="collapse"
                                 data-target="#mobile_tab4"
                                 data-parent="#accordion">
                                <h4 className="panel-title mob_title text-center-xs"
                                    >
                <span className="hidden-lg ">
                </span> Nebenwirkungen
                                </h4>
                            </div>
                            <div id="mobile_tab4" className="panel-collapse collapse ">
                                <div className="panel-body">
                                    <div className="row content_header">
                                        <h1> Nebenwirkungen </h1>
                                        <hr/>
                                        <h4>Wie alle Arzneimittel kann auch dieses Arzneimittel
                                            Nebenwirkungen
                                            haben, die aber nicht
                                            bei jedem auftreten müssen.</h4>
                                        {this.renderPackLevel4Adverse(drug)}
                                        {/*Button REPORT*/}
                                        <div className="text-right">
                                            <button type="button"
                                                    className="btn btn-success neben_button"
                                                    data-toggle="modal"
                                                    data-target="#melden">Meldung von Nebenwirkungen
                                                <i className="fas fa-comment-medical"
                                                   style={{marginLeft: "15px"}}/>
                                            </button>
                                        </div>
                                        {/*Button REPORT ENDE*/}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            )
        }
        return (
            <div className="tab-content ">
                <div role="tabpanel" className="tab-pane active w3-animate-opacity tab1"
                     id="tab1" name="tab1">
                    <div className="row content_header">
                        {this.renderPackGeneralInstructions(drug)}
                    </div>
                    <div className="row">
                <span
                    dangerouslySetInnerHTML={this.createMarkup(t("helptext_general"))}/>

                        {this.renderPharmaceuticalForm(drug)}
                        <div className="col-sm-4 col-xs-6 text-center infopart">
                            {this.renderDisease(drug)}
                        </div>
                        <div className="col-sm-4 col-xs-6 text-center infopart"
                             data-toggle="modal"
                             data-target="#infosubstance">
                            {this.renderActiveSubstance(drug)}
                            <div style={{cursor: "pointer"}} data-toggle="modal"
                                 data-target="#infosubstance"><i
                                className="fas fa-info-circle circleinfo_icon"/></div>
                        </div>
                        {showAdditionalInfo &&
                        <div className="">
                            <div className="additional-information">
                                <section>
                                    {this.renderIndicationGroup(drug)}
                                    {this.renderProductGroup(drug)}
                                    {this.renderPZN(drug)}
                                </section>
                            </div>
                        </div>}
                    </div>
                    <div className="row text-center">
                        <p>
                            <a onClick={this.toggleShowAdditionalInfo}>
                                <button className="btn btn-secondary black weiter_btn">
                                    {!showAdditionalInfo && <span>{t('viewDetails')}</span>}
                                    {showAdditionalInfo && <span>{t('hideDetails')}</span>}
                                </button>
                            </a>
                        </p>
                    </div>
                </div>
                <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab2"
                     name="tab2">
                    {this.renderPackLevel2Warning(drug)}
                </div>
                <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab3"
                     name="tab3">
                    <div className="row content_header">
                        <h1>Dosierung und Anwendung</h1>
                        <hr/>
                    </div>
                    {this.renderPackLevel3Dosage(drug)}
                </div>
                <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab4"
                     name="tab4">
                    <div className="row content_header">
                        <h1> Nebenwirkungen </h1>
                        <hr/>
                        <h4>Wie alle Arzneimittel kann auch dieses Arzneimittel
                            Nebenwirkungen
                            haben, die aber nicht
                            bei jedem auftreten müssen.</h4>
                        {this.renderPackLevel4Adverse(drug)}

                    </div>
                    {/*Button REPORT*/}
                    <div className="text-right">
                        <button type="button" className="btn btn-success neben_button"
                                data-toggle="modal"
                                data-target="#melden">Meldung von Nebenwirkungen
                            <i className="fas fa-comment-medical"
                               style={{marginLeft: "15px"}}/>
                        </button>
                    </div>
                    {/*Button REPORT ENDE*/
                    }
                </div>
            </div>
        )
    }


    render() {
        let that = this;
        setTimeout(function () {
            that.setState({timePassed: true})
        }, 1000);
        const {t} = this.props;
        const drug = this.state.drug;
        const showAdditionalInfo = this.state.showAdditionalInfo;
        let itemClass = ["item  col-xs-4 col-sm-4 grid-group-item"];
        if (this.state.addClass) {
            itemClass.push('list-group-item');
        }
        if (!drug) {
            // Do not show anything while loading.
            return (
                <div className="container marketing no-banner">
                    <div className='page-header'>
                    </div>
                    <Loading/>
                </div>
            );
        }
        return (
            <div onLoad={this.windowscroll.bind(this)}>
                <div id="myCarousel" className="carousel carousel-fade hidden-xs hidden-sm" data-ride="carousel">
                    <div className="carousel-inner">
                        <div className="carousel-item active item_drug">
                            <div className="mask flex-center">
                                <div className="container">
                                    <div className="row align-items-center">
                                        <div className="col-md-8 col-12 order-md-1 order-2">
                                            <h4>{drug.name}</h4>
                                            <span className="hidden-xs hidden-sm"
                                                  dangerouslySetInnerHTML={this.createMarkup(t("textinfo_desktop").replace("%XXX%", drug.name))}/>
                                        </div>
                                        <div className="col-xs-8 col-md-4 col-12 order-md-2 order-1"><img
                                            src="/assets/images/epil_circle.png" className="img-responsive"
                                            alt="slide"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="no-banner">
                    <div>
                        {this.renderInfoButton()}
                        {this.renderReportButton()}
                        {this.renderStoreButton()}
                        {this.renderWordExplanationButton(drug)}
                    </div>
                    <div className='page-header bg_grey'>
                        <div className="container  no-banner">
                            {User.isAuthenticated() &&
                            <div>
                                {this.renderLikeButton()}
                                {this.renderAddButton()}
                            </div>
                            }
                            {/*<h3>{drug.name} {drug.productGroup && drug.productGroup.name && <span className="text-muted">{drug.productGroup.name}</span> }</h3>*/}
                            {User.isAuthenticated() && drug.personalizedInformation &&
                            <div>
                                {this.renderSpeechPersonalizedInformation()}
                            </div>
                            }
                            <div className="row featurette drug-detail-header">
                                <div className="col-xs-12 col-sm-12 col-md-3">
                                    {this.renderBasicInformation()}
                                    {this.renderListLevels()}
                                </div>
                                <div className="col-xs-12 col-sm-12 col-md-9 infobox nopadd-xs" >
                                    {this.renderContent()}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="row">
                        <div className="col-sm-8 col-xs-12 xs-center backtomed">
                            {this.renderBackToMedbutton()}
                        </div>
                        <div className='col-sm-4 col-xs-12 xs-center backtomed'>
                            {this.renderPackVersion()}
                            <br/>
                            {this.renderCompanyButton()}
                        </div>
                    </div>
                    {this.renderWordExplanation(drug)}
                    {this.renderGoTopIcon()}
                    {this.renderAllModals()}
                </div>
            </div>
        );
    }
}

export default translate()
(
    DrugDetail
);