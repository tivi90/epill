import axios from "axios";
import React from "react";

import {translate} from "react-i18next";

import User from "../util/User";
import AutoComplete from "./auto_complete";

class Usage extends React.Component {
    constructor(props) {
        super();
        this.state = {
            drug: undefined
        }

    }


    render() {
        return (
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
        );
    }
}

export default translate()(Usage);