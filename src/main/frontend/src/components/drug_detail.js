import axios from "axios";
import React from "react";
import scrollToComponent from 'react-scroll-to-component';
import {translate} from "react-i18next";
import {toast} from 'react-toastify';

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

    renderDrugFeatures(drug) {

        if (!drug.drugFeature) {
            return;
        }
        return (
            <p>
                {drug.drugFeature.map(feature => <img key={feature.id}
                                                      src={"./../../assets/icons/" + feature.id + ".svg"}
                                                      alt={feature.drugFeature} title={feature.drugFeature}
                                                      className="drug-feature-icon"></img>)}
            </p>
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
                                                                         title={feature.drugFeature}></img> {feature.drugFeature}
                                                                </h2>
                                                            </div>
                                                            <div className="modal-body text-left">
                                                                <div
                                                                    dangerouslySetInnerHTML={this.createMarkup(feature.descriptionDrug)}/>
                                                            </div>
                                                             <span
                                                                 dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}></span>
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
                <p>   {drug.disease.map(disease => <span key={disease.id}>{disease.name} <br/></span>)
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
            <section className="diseases row" style={{cursor: "pointer"}}>
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

    renderWordExplainationButton(drug) {
        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
                return (
                    <div className="round-button-outer1 report-round-button1 round_def">
                        <div id="defBtn" className="round-button-inner-main1" data-toggle="modal" data-target="#def">
                            <i className="fas fa-book"></i></div>
                    </div>
                );

    }

    renderWordExplaination(drug) {

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

    renderWordExplainations(drug) {

        if (!drug.wordExplaination) {
            return null;
        }
        const {t} = this.props;
        return drug.wordExplaination
            .map((section => {
                return (
                    <div>
                        <div className="row hidden-lg hidden-md hidden-sm explain_box" key={section.id}>
                        <h4 >{section.name}</h4>
                            <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.description)}/>
                            </p>
                        </div>

                    <table className="table table-bordered table-striped hidden-xs">
                        <thead>
                        <tr>
                            <th>Begriff</th>
                            <th>Erklärung</th>
                        </tr>
                        </thead>
                        <tbody>
                        <script src="assets/js/ownjs.js"></script>
                        <tr>
                            <td><p key={section.id}>{section.name}</p></td>
                            <td><p key={section.id}><span
                                dangerouslySetInnerHTML={this.createMarkup(section.description)}/>
                            </p></td>
                        </tr>
                        </tbody>
                    </table></div>
                );
            })).reduce((prev, curr) => [prev, curr]);

    }


    renderFormdesc(drug) {
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

    renderFormImg(drug) {
        if (!drug.pharmaceuticalForm) {
            return;
        }

        const {t} = this.props;
        return (
            <span>
            {drug.pharmaceuticalForm.map(pharmaceuticalForm => <img key={pharmaceuticalForm.id}
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

    renderActiveSubstance(drug) {
        if (!drug.activeSubstance)
            return null;

        const {t} = this.props;

        return (
            <section><img src={"./../../assets/images/lab.svg"} className="infopic" alt={"lab"}/>

                <p><b> {t('activeSubstance') + " "}</b></p>
                <p>    {drug.activeSubstance.map(substance => <span key={substance.id}>{substance.name}
                    <br/></span>
                )
                    .reduce((prev, curr) => [prev, ', ', curr])}</p>
            </section>
        );
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

                <p><b>  {t('pzn') + " "}</b>
                    {drug.packaging.map(packaging => <span key={packaging.id}> <br/>{packaging.name}
                        <br/>{packaging.pzn}
                        <br/></span>)
                        .reduce((prev, curr) => [prev, curr])}</p>
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

                <p><b>     {t('indicationGroup') + " "}  </b></p>
                <p>{drug.indicationGroup.name}</p>

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

                <p><b>      {t('productGroup') + " "}</b></p>

                <p>{drug.productGroup.name}</p>

            </section>
            </div>
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

    renderPackcompany(drug) {
        if (!drug.packagingSection){
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
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecdesc(drug) {
        if (!drug.packagingSection){
            return null;
        }

        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 8
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecvor(drug) {
        if (!drug.packagingSection){
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
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecdos(drug) {
        if (!drug.packagingSection){
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
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecneben(drug) {
        if (!drug.packagingSection){
            return null;
        }

        return drug.packagingSection
            .filter(section => {
                return section.topic.id === 6
            })
            .map((section => {
                return (
                    <p key={section.id}><span dangerouslySetInnerHTML={this.createMarkup(section.text)}/>
                    </p>
                );
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecpack(drug) {
        if (!drug.packagingSection){
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
            })).reduce((prev, curr) => [prev, curr]);
    }

    renderPackSecMoreSub(drug) {
        if (!drug.packagingSection){
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
        let that = this;
        setTimeout(function(){that.setState({timePassed: true})}, 1000);
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
            <div>
                <div id="myCarousel" className="carousel carousel-fade" data-ride="carousel">
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
                                            src="/assets/images/epil_circle.png" className="img-responsive" alt="slide"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="no-banner">
                    {/*Button INFO*/}
                    <div className="round-button-outer report-round-button round_info">
                        <div id="reportBtn" className="round-button-inner-main" data-toggle="modal" data-target="#info">
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
                    {/*Button INFO ENDE*/}

                    {/*Button Address*/}
                    <div className="round-button-outer report-round-button no_animation round_address">
                        <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                             data-target="#address">
                            <FontAwesomeIcon icon={faAddressCard}/></div>
                    </div>
                    <div className="modal fade" id="address" tabIndex="-1" role="dialog" aria-labelledby="addressLabel"
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
                    {/*Button  Address ENDE*/}

                    {/*Button REPORT*/}
                    <div className="round-button-outer report-round-button no_animation round_nebenwirkung">
                        <div id="reportBtn" className="round-button-inner-main no_animation" data-toggle="modal"
                             data-target="#melden">
                            <FontAwesomeIcon icon={faCommentMedical}/>
                        </div>
                    </div>
                    <div className="modal fade" id="melden" tabIndex="-1" role="dialog" aria-labelledby="addressLabel"
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
                    {/*Button REPORT ENDE*/}


                    {/*Button INFO*/}
                    {this.renderWordExplainationButton(drug)}
                    <div className="modal fade" id="def" tabIndex="-1" role="dialog" aria-labelledby="addressLabel"
                         aria-hidden="true">
                        <div className="modal-dialog modal-lg" role="document">
                            <div className="modal-content">
                                <div className="modal-header">
                                    <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h2>Fachausdrücke
                                    </h2>

                                </div>
                                <div className="modal-body" style={{color: "black"}}>

                                    {this.renderWordExplainations(drug)}
                                    <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                                </div>
                            </div>
                        </div>
                    </div>

                    {/*Button INFO ENDE*/}


                    <div className='page-header bg_grey'>
                        <div className="container  no-banner">
                            <div className=' pull-right'>
                                <span>v. {drug.version} | {t('publishingDate')}: {new Date(drug.year).toLocaleDateString()}</span>
                            </div>
                            <br/>
                            {User.isAuthenticated()
                            &&
                            <div className='btn-toolbar pull-right'>
                                <div className='btn-group'>
                                    <button type="button" className="btn btn-like"
                                            onClick={() => this.toggleTaking(drug)}>
                                        <span
                                            className={"glyphicon white" + ((!drug.isTaken) ? " glyphicon-heart" : " glyphicon-minus")}/>
                                    </button>
                                    <button type="button" className="btn btn-add"
                                            onClick={() => this.toggleRemember(drug)}>
                                        <span
                                            className={"glyphicon white" + ((!drug.isRemembered) ? " glyphicon-plus" : " glyphicon-minus")}/>
                                    </button>
                                </div>
                            </div>
                            }
                            {/*<h3>{drug.name} {drug.productGroup && drug.productGroup.name && <span className="text-muted">{drug.productGroup.name}</span> }</h3>*/}

                            {User.isAuthenticated() && drug.personalizedInformation &&
                            <div className="alert modal1 " data-dismiss="alert">
                                <div className="alert bubble_right  row w3-animate-right">
                                    <div className="speech-bubble_right">
                                        <a href="#" className="close" data-dismiss="alert"
                                           aria-label="close">&times;</a>
                                        <span
                                            dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                                    </div>
                                    <img className="speech-bubble_right-person"
                                         src="./../../assets/images/logo_chat.png" alt={"speechbubble"}/>
                                </div>
                            </div>
                            }

                            <div className="row featurette drug-detail-header">
                                <div className="col-xs-12 col-sm-12 col-md-3">
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

                                            <div className="modal fade" id="infoicons" tabIndex="-1" role="dialog"
                                                 aria-labelledby="addressLabel"
                                                 aria-hidden="true">
                                                <div className="modal-dialog" role="document">
                                                    <div className="modal-content">
                                                        <div className="modal-header">
                                                            <button type="button" className="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                            <h2> Was bedeuten die Symbole?
                                                            </h2>
                                                        </div>
                                                        <div className="modal-body" style={{color: "black"}}>
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
                                                                Weitere Informationen finden Sie unter der Rubrik <a
                                                                href="#tab2" aria-controls="tab2" role="tab"
                                                                data-toggle="tab" aria-expanded="true"
                                                                data-dismiss="modal">Warnhinweise und Vorsichtsmaßnahmen
                                                            </a></div>
                                                        </div>
                                                        <span
                                                            dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="row tab_headers nomargin">
                                        <ul className="nav nav-pills brand-pills nav-stacked" role="tablist">
                                            <li role="presentation" className="brand-nav active">
                                                <a href="#tab1"
                                                   aria-controls="tab1"
                                                   role="tab"
                                                   data-toggle="tab" onClick={this.handleScrollToStats} >Allgemeine
                                                    Informationen</a></li>
                                            <div id="arrow-down">
                                                <FontAwesomeIcon icon={faChevronDown}/>
                                            </div>
                                            <li role="presentation" className="brand-nav">
                                                <a href="#tab2"
                                                   aria-controls="tab2"
                                                   role="tab"
                                                   data-toggle="tab" >Vor der
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
                                </div>
                                <div className="col-xs-12 col-sm-12 col-md-9 infobox">
                                    <div className="tab-content">
                                        <div role="tabpanel" className="tab-pane active w3-animate-opacity tab1" id="tab1">
                                            <div className="row content_header">
                                                <h1>Allgemeine Informationen</h1>
                                                <hr/>
                                                {this.renderPackSecdesc(drug)}

                                            </div>
                                            <div className="row">
                                                <div className="col-sm-4 col-xs-6 text-center infopart">
                                                    <div data-toggle="modal"
                                                         data-target="#drugform">
                                                        {this.renderPharmaceuticalForm(drug)}
                                                    </div>
                                                    <div style={{cursor: "pointer"}} data-toggle="modal"
                                                         data-target="#drugform"><i
                                                        className="fas fa-info-circle"/></div>
                                                </div>

                                                <div className="modal fade" id="drugform" tabIndex="-1" role="dialog"
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
                                                                        className="col-sm-2 col-xs-12 xs-center">{this.renderFormImg(drug)}</div>
                                                                    <div className="col-sm-10 col-xs-12 xs-center">
                                                                        {this.renderFormdesc(drug)}
                                                                    </div>
                                                                </div>
                                                                <div className="row">
                                                                    <div
                                                                        className="col-sm-2 col-xs-12 xs-center"><i
                                                                        className="druf_pack_icon fas fa-prescription-bottle-alt"></i>
                                                                    </div>
                                                                    <div className="col-sm-10 col-xs-12 xs-center"
                                                                         style={{paddingTop: "10px"}}>
                                                                        {this.renderPackSecpack(drug)}
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <span
                                                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="col-sm-4 col-xs-6 text-center infopart">
                                                    {this.renderDisease(drug)}
                                                </div>
                                                <div className="col-sm-4 col-xs-6 text-center infopart">
                                                    {this.renderActiveSubstance(drug)}
                                                    <div style={{cursor: "pointer"}} data-toggle="modal"
                                                         data-target="#infosubstance"><i
                                                        className="fas fa-info-circle"/></div>
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
                                                               <span key={substance.id}>{substance.name} ist ein Arzneistoff aus der Gruppe der sogenannten {substance.substanceGroup.name}.</span>)
                                                               .reduce((prev, curr) => [prev, ', ', curr])} </span>
                                                                {this.renderPackSecMoreSub(drug)}
                                                            </div>
                                                            <span
                                                                dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                                                        </div>
                                                    </div>
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
                                                        <button className="btn btn-secondary">
                                                            {!showAdditionalInfo && <span>{t('viewDetails')}</span>}
                                                            {showAdditionalInfo && <span>{t('hideDetails')}</span>}
                                                        </button>
                                                    </a>
                                                </p>
                                            </div>
                                        </div>
                                        <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab2">
                                            {this.renderPackSecvor(drug)}
                                        </div>
                                        <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab3">
                                            <div className="row content_header">
                                                <h1>Dosierung und Anwendung</h1>
                                                <hr/>
                                            </div>
                                            {this.renderPackSecdos(drug)}
                                        </div>
                                        <div role="tabpanel" className="tab-pane w3-animate-opacity" id="tab4">
                                            {this.renderPackSecneben(drug)}
                                            {/*Button REPORT*/}
                                            <div className="text-right">
                                                <button type="button" className="btn btn-success neben_button"
                                                        data-toggle="modal"
                                                        data-target="#melden">Meldung von Nebenwirkungen
                                                    <i className="fas fa-comment-medical" style={{marginLeft: "15px"}}/>
                                                </button>
                                            </div>
                                            {/*Button REPORT ENDE*/
                                            }
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div className="row xs-center backtomed">
                        <a href="#/drug/list"> <i className="far fa-arrow-alt-circle-left"/> zurück zu den
                            Medkamenten</a>
                    </div>
                    {this.renderWordExplaination(drug)}
                    <div className="modal fade" id="neben_info" tabIndex="-1" role="dialog" aria-labelledby="neben_info"
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
                </div>
            </div>
        );

    }
}


export default translate()(DrugDetail);
