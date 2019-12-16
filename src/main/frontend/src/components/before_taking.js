import axios from "axios";
import React from "react";

import {translate} from "react-i18next";

import User from "../util/User";
import AutoComplete from "./auto_complete";

class BeforeTaking extends React.Component {
    constructor(props) {
        super();
        this.state = {
            drug: undefined
        }

    }


    render() {
        return (
			<div id="about" className="container">
				<div className="row">
					<div className="col-sm-12 text-center">
						<h2>Vor der Einnahme von Prospan® Hustensaft</h2>

						<p >Besondere Vorsicht bei der Einnahme von Prospan® Hustensaft ist
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
							<li><a href="#vtab4" data-toggle="tab"> Verkehrstüchtigkeit und das Bedienen von Maschinen

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
								<p><b>Kinder unter einem Jahr</b> <br />
									Anwendung nur nach
									Rücksprache mit einem Arzt. Die Einnahme bei dieser Altersgruppe sollte nur unter
									sorgfältiger Beobachtung
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
        );
    }
}

export default translate()(BeforeTaking);