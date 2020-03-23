import axios from "axios";
import React from "react";

import {Link} from "react-router-dom";
import {translate} from "react-i18next";
import {toast} from 'react-toastify';

import EmptyList from "./empty_list";
import Loading from "./loading";
import User from "./../util/User";
import Carousel1 from "./carousel_drugs";
import AutoComplete from "./auto_complete";
import MostVisitedItems from "./most_visited_items";

class DrugList extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            drugs: [],
            interactions: '',
            cmd: '',
            loading: false,
            addClass: false
        }

        this.checkForInteractions = this.checkForInteractions.bind(this);
        this.addToRememberList = this.addToRememberList.bind(this);
        this.removeFromRememberList = this.removeFromRememberList.bind(this);
        this.addToTakingList = this.addToTakingList.bind(this);
        this.removeFromTakingList = this.removeFromTakingList.bind(this);
    }

    setCmd() {

        var path = this.props.location.pathname.split('/');
        var cmd = path[path.length - 1];

        this.state.cmd = cmd;
        this.state.interactions = '';
        this.state.loading = true;
        this.setState(this.state);

        switch (this.state.cmd) {
            case 'taking':
                axios.get('/drug/list/taking')
                    .then(({data}) => {
                        this.state.drugs = data.value;
                        this.state.loading = false;
                        this.setState(this.state);
                        this.checkForInteractions();
                    });
                break;
            case 'remember':
                axios.get('/drug/list/remember')
                    .then(({data}) => {
                        this.state.drugs = data.value;
                        this.state.loading = false;
                        this.setState(this.state);
                        this.checkForInteractions();
                    });
                break;
            case 'list':
                axios.get('/drug/list/all')
                    .then(({data, status}) => {
                        this.state.drugs = data.value;
                        this.state.loading = false;
                        this.setState(this.state);
                    });
                break;
            default:
                axios.get('/drug/search', {params: {exp: "ac"}})
                    .then(({data}) => {
                        this.state.drugs = data.value;
                        this.state.loading = false;
                        this.setState(this.state);
                    });
                break;
        }
    }


    // This function is called before render() to initialize its state.s
    componentWillMount() {
        this.setCmd();
    }

    componentWillReceiveProps(props) {
        this.props = props;
        this.setCmd();
    }


    createMarkup(text) {
        return {__html: text};
    };

    createMarkup(descriptionDrug) {
        return {__html: descriptionDrug};
    };

    //=============================


    toggleTaking(drug) {
        if (drug.isTaken) {
            this.removeFromTakingList(drug);
        } else {
            this.addToTakingList(drug);
        }
    }

    addToTakingList(drug) {
        axios.post('/drug/taking/add', {id: drug.id}, {
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
                        var idx = this.state.drugs.indexOf(drug);
                        drug.isTaken = !drug.isTaken;
                        this.state.drugs[idx] = drug;
                        this.setState(this.state);
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

    removeFromTakingList(drug) {
        axios.post('/drug/taking/remove', {id: drug.id}, {
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

                        var idx = this.state.drugs.indexOf(drug);
                        if (this.state.cmd != 'taking') {
                            drug.isTaken = !drug.isTaken;
                            this.state.drugs[idx] = drug;
                            this.setState(this.state);
                        } else {
                            this.state.drugs.splice(idx, 1);
                        }
                        this.setState(this.state);
                        this.checkForInteractions();
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

    toggleRemember(drug) {
        if (drug.isRemembered) {
            this.removeFromRememberList(drug);
        } else {
            this.addToRememberList(drug);
        }
    }

    addToRememberList(drug) {
        axios.post('/drug/remember/add', {id: drug.id}, {
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
                        var idx = this.state.drugs.indexOf(drug);
                        drug.isRemembered = !drug.isRemembered;
                        this.state.drugs[idx] = drug;
                        this.setState(this.state);
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

    removeFromRememberList(drug) {
        axios.post('/drug/remember/remove', {id: drug.id}, {
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
                        var idx = this.state.drugs.indexOf(drug);

                        if (this.state.cmd != 'remember') {
                            drug.isRemembered = !drug.isRemembered;
                            this.state.drugs[idx] = drug;
                            this.setState(this.state);
                        } else {
                            this.state.drugs.splice(idx, 1);
                            this.checkForInteractions();
                        }
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

    deleteDrug(id) {
        // ES6 string interpolation (https://developer.mozilla.org/de/docs/Web/JavaScript/Reference/template_strings)
        // No error handling for now, e.g. if the user is not authenticated.
        axios.delete(`/drugs/delete/${id}`)
            .then((data) => {
                // Remove post from list of posts.
                const posts = this.state.posts.filter(e => e.id != id);
                this.setState({
                    drugs: drugs
                })
            });
    }

    //============================

    checkForInteractions() {
        axios.get(`/drug/interactions/${this.state.cmd}`).then(({data}) => {
            this.state.interactions = data.value;
            this.setState(this.state);
        });
    }

    renderDrugFeatures(drug) {
        const {t} = this.props;
        if (!drug.drugFeature) {
            return null;
        }
        return (
            <div className="drug-features ">
                {drug.drugFeature.map(feature => {
                    return (
                        <div key={feature.id}>
                            <img style={{float: "left"}} key={feature.id} data-toggle="modal"
                                 data-target={"#" + feature.id}
                                 src={"./../../assets/icons/" + feature.id + ".svg"}
                                 className="drug-feature-icon" alt={feature.drugFeature}
                                 title={feature.drugFeature}/>
                            <div id={feature.id} className="modal fade" role="dialog">
                                <div className="modal-dialog">
                                    <div className="modal-content">
                                        <div className="modal-header">
                                            <button type="button" className="close"
                                                    data-dismiss="modal">&times;</button>
                                            <h2 className="modal-title">
                                                <img style={{width: "55px"}} key={feature.id}
                                                     data-toggle="modal"
                                                     data-target={"#" + feature.id}
                                                     src={"./../../assets/icons/" + feature.id + ".svg"}
                                                     className="drug-feature-icon"
                                                     alt={feature.drugFeature}
                                                     title={feature.drugFeature}></img> {feature.drugFeature}
                                            </h2>
                                        </div>
                                        <div className="modal-body text-left">
                                            <div dangerouslySetInnerHTML={this.createMarkup(feature.descriptionDrug)}/>
                                        </div>
                                        <span dangerouslySetInnerHTML={this.createMarkup(t("modal_close"))}/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    )
                })
                }
            </div>
        );
    }

    renderDisease(drug) {
        if (!drug.disease) {
            return;
        }

        const {t} = this.props;

        return (
            <section className="diseases">
                <div className="col-sm-12">
                    <p><b> {t('usedWhen') + ": "}</b></p>
                    <ul> {drug.disease.map(disease => <li key={disease.id}>{disease.name}</li>)
                        .reduce((prev, curr) => [prev, curr])}</ul>
                </div>
            </section>
        );
    }

    renderPharmaceuticalForm(drug) {
        if (!drug.pharmaceuticalForm) {
            return;
        }
        const {t} = this.props;
        return (
            <section className="diseases ">
                <div className="col-xs-9">
                    <p><b>  {t('pharmaceuticalForm') + ": "} </b></p>
                    <ul>  {drug.pharmaceuticalForm.map(pharmaceuticalForm =>
                        <li key={pharmaceuticalForm.id}>
                            {pharmaceuticalForm.name}
                        </li>)
                        .reduce((prev, curr) => [prev, curr])}</ul>
                </div>
                <div className="col-xs-2">
                    {drug.pharmaceuticalForm.map(pharmaceuticalForm => <span key={pharmaceuticalForm.id}>
                        <img style={{width: "40px"}}
                             key={pharmaceuticalForm.id}
                             src={"./../../assets/p_form/" + pharmaceuticalForm.id + ".svg"}
                             className="drug-feature-icon"
                             alt={pharmaceuticalForm.name}
                             title={pharmaceuticalForm.name}></img> </span>)
                        .reduce((prev, curr) => [prev, curr])}
                </div>
            </section>
        );
    }

    renderActiveSubstance(drug) {
        if (!drug.activeSubstance) {
            return;
        }

        const {t} = this.props;

        return (
            <div className="col-sm-12">
                <p> {t('activeSubstance') + ": "}
                    {drug.activeSubstance.map(substance => <span key={substance.id}>{substance.name}</span>)
                        .reduce((prev, curr) => [prev, ', ', curr])}
                </p>
            </div>
        );
    }

    toggle() {
        this.setState({addClass: !this.state.addClass});
    }

    renderDrugs(drugs) {
        return drugs.map((drug => {
            const {t} = this.props;
            let itemClass = ["item  col-md-4 col-lg-4 grid-group-item  padd_md"];
            let drugname = ["group inner list-group-item-heading med_header hidden"];
            let drugname1 = ["group inner med_header"];
            let medfeat = ["row med_drugfeature hidden"];
            let medfeat1 = ["row med_drugfeature"];
            let col2Class = [""];
            let col4Class = [""];
            let col5Class = [""];
            let col8Class = [" "];
            let col7Class = ["full_content"];
            let coltorowClass = ["col-xs-4 nopadd"];
            if (this.state.addClass) {
                itemClass.push('list-group-item nopadd');
                drugname.push('');
                drugname1.push('');
                medfeat.push('');
                col2Class.push('col-md-2 ');
                col4Class.push('col-md-4 ');
                col5Class.push('col-md-5 ');
                col7Class.push('col-md-7 ');
                col8Class.push('col-md-8 ');
                coltorowClass.push('fullrow');
            }
            return (
                <div id="products" key={drug.id}>
                    <div className={itemClass.join(' ')}>
                            <div className="thumbnail medicine">
                                <Link to={`/drug/${drug.id}`} >
                                <div className={col4Class.join('list_pic ')}>
                                <h4 className={drugname.join('not')}>
                                    {drug.name}</h4>
                                <Link to={`/drug/${drug.id}`}>
                                    <img className="group list-group-image" alt={drug.name}
                                         title={drug.name} src={`/image/drug/${drug.id}`}/>
                                </Link>
                                <div className={medfeat.join('not')}>
                                    {this.renderDrugFeatures(drug)}
                                </div>
                                <h4 className={drugname1.join(' hidden ')}>
                                    {drug.name}</h4>
                                </div></Link>
                            <div className={col8Class.join(' ')}>
                                <div className={col7Class.join('di ')}>
                                    {this.renderPharmaceuticalForm(drug)}
                                    {this.renderDisease(drug)}
                                    {User.isAuthenticated() &&
                                    <section className="diseases">
                                        <div className="col-sm-12">
                                            <p><b> {t('application') + ": "}</b></p>
                                            {drug.personalizedInformation &&
                                            <div className="minimum-summary"
                                                 dangerouslySetInnerHTML={this.createMarkup(drug.personalizedInformation)}/>
                                            }
                                        </div>
                                    </section>}
                                </div>
                                <div className={col5Class.join(' hidden ')}>
                                    <div className={medfeat1.join('')}>
                                        {this.renderDrugFeatures(drug)}
                                    </div>
                                </div>
                                <div className={col2Class.join('col-md-offset-3 ')}>
                                    {User.isAuthenticated() &&
                                    <div className="row">
                                        <div className="action-pattern">
                                            <div>
                                                <div className={coltorowClass.join(' ')}>
                                                    <button type="button" className="btn btn-like big_btn"
                                                            onClick={() => this.toggleTaking(drug)}>
                                                <span
                                                    className={"glyphicon white " + (drug.isTaken ? 'glyphicon-minus' : 'glyphicon-heart')}/>
                                                    </button>
                                                </div>
                                                <div className={coltorowClass.join(' ')}>
                                                    <button type="button" className="btn btn-add big_btn"
                                                            onClick={() => this.toggleRemember(drug)}>
                                                <span
                                                    className={"glyphicon white " + (drug.isRemembered ? 'glyphicon-minus' : 'glyphicon-plus')}/>
                                                    </button>
                                                </div>
                                                <div className={coltorowClass.join(' ')}>
                                                    <button type="button" className="btn btn-open big_btn">
                                                        <Link to={`/drug/${drug.id}`}>
                                                                <span
                                                                    className="glyphicon glyphicon-eye-open white"/>
                                                        </Link>
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            );
        }));
    }

    render() {
        const {t} = this.props;
        const firstname = User.firstname;
        const lastname = User.lastname;
        const drugs = this.state.drugs;
        const interactions = this.state.interactions;

        var title = null;
        var description = null;

        switch (this.state.cmd) {
            case 'taking':
                title = t('userDrugs');
                description = t('drugTakingListDescriptionText');
                break;
            case 'remember':
                title = t('rememberedDrugs');
                description = t('drugRememberListDescriptionText');
                break;
            default:
                title = t('drugs');
                description = t('drugListAllDescriptionText');
                break;
        }

        return (
            <div><Carousel1/>
                <div className="container">

                    {User.isAuthenticated() &&
                    <MostVisitedItems />
                    }


                    <div className="well well-sm hidden-xs">
                        <div className="btn-group">
                            <div id="list" className="btn btn-default btn-sm"
                                 onClick={this.toggle.bind(this)}> {this.state.addClass ?
                                <div><span className="glyphicon glyphicon-th"/>Grid</div> :
                                <div><span className="glyphicon glyphicon-th-list"/>List</div>
                            }</div>
                        </div>
                    </div>
                    <div>
                        {User.isAuthenticated() && User.levelOfDetail > 1 &&
                        <div className="alert modal1 " data-dismiss="alert">
                            <div className="alert bubble_left  row ">
                                <div className="speech-bubble_left">
                                    <a href="#" className="close" data-dismiss="alert"
                                       aria-label="close1">&times;</a>
                                    Hi {firstname} , <br/>
                                    {description.replace("%User.firstname%", firstname).replace("%User.lastname%", lastname)}
                                </div>
                                <img className="speech-bubble_left-person" src="./../../assets/images/logo_chat.png"
                                     alt={"speechbuuble"}/>
                            </div>
                        </div>
                        }
                        {drugs.length > 1 && User.isAuthenticated() && interactions.length > 0 &&
                        <div
                            className={"alert alert-dismissable" + (User.redGreenColorblind ? " danger-red-green-colorblind" : " alert-danger")}>
                            <button type="button" className="close" data-dismiss="alert" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                            <span className="glyphicon glyphicon-exclamation-sign" aria-hidden="true"/>
                            <span className="sr-only">Error:</span>
                            <h5>{User.redGreenColorblind} {t("interaction")}</h5>
                            <span dangerouslySetInnerHTML={this.createMarkup(interactions)}/>
                        </div>
                        }
                        <div>
                            {this.state.loading && <Loading/>}
                            {!this.state.loading && drugs && drugs.length === 0 && <EmptyList/>}
                            {!this.state.loading && drugs && drugs.length > 0 &&
                            this.renderDrugs(drugs)
                            }
                        </div>
                    </div>

                </div>

            </div>
        );
    }
}

export default translate()(DrugList);