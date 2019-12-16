import axios from "axios";
import React from "react";

import {translate} from "react-i18next";

import User from "../util/User";
import AutoComplete from "./auto_complete";

class SideEffect extends React.Component {
    constructor(props) {
        super();
        this.state = {
            drug: undefined
        }

    }


    render() {
        return (
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


        );
    }
}

export default translate()(SideEffect);