-- Initialize database on startup. See
-- https://docs.spring.io/spring-boot/docs/current/reference/html/howto-database-initialization.html#howto-initialize-a-database-using-spring-jdbc
-- for explanation. This is a cool spring feature :-).


-- DELETE FROM all.

DELETE FROM drug_feature_gender;
DELETE FROM drug_disease;
DELETE FROM gender_disease;
DELETE FROM tailored_text;
DELETE FROM drug_active_substance;
DELETE FROM drug_pharmaceutical_form;
DELETE FROM drug_word_explaination;
DELETE FROM drug_drug_feature;
DELETE FROM drug_disease;
DELETE FROM drug_adverse_effect;
DELETE FROM user_preferred_topic;
DELETE FROM user_disease;
DELETE FROM user_drug_feature;
DELETE FROM user_query;
DELETE FROM interaction_drug;
DELETE FROM drug_interaction;

DELETE FROM tag;
DELETE FROM adverse_effect;
DELETE FROM packaging;
DELETE FROM packaging_section;
DELETE FROM packaging_topic;
DELETE FROM drug_feature;
DELETE FROM pharmaceutical_form;
DELETE FROM word_Explaination;
DELETE FROM disease;
DELETE FROM item_invocation;
DELETE FROM user_drug_taking;
DELETE FROM user_drug_remember;
DELETE FROM interaction;
DELETE FROM disease;
DELETE FROM drug;
DELETE FROM drug_simple;
DELETE FROM user_;
DELETE FROM user_simple;
DELETE FROM indication_group;
DELETE FROM active_substance;
DELETE FROM image;
DELETE FROM gender;
DELETE FROM language;
DELETE FROM country;
DELETE FROM product_group;



--
-- Dumping data for table `gender`
--
INSERT INTO gender (id, gender) VALUES (1,'männlich'), (2,'weiblich');


--
-- Dumping data for table `language`
--

INSERT INTO language (id, language) VALUES (1,'Deutsch');
INSERT INTO language (id, language) VALUES (2,'Französisch');



--
-- Dumping data for table `country`
--

INSERT INTO country (id, name) VALUES (1,'Deutschland');
INSERT INTO country (id, name) VALUES (2,'Frankreich');


--
-- Dumping data for table `user_simple`
--

INSERT INTO user_simple (id, date_of_birth, date_of_registration, email, firstname, lastname, level_of_detail, password, preferred_font_size, salt, username, red_green_colorblind)
	VALUES
	(1,'1990-09-21','2015-06-27 13:16:01','n.kannengiesser@web.de','Niclas','Kannengiesser',3,'89794011ed99bae7b5062920bffbef2a334dca75628975cd9cce51ba9691b12843beaed302416bdee221796816346fdeb618903cfa887945174237c92dc2dd2a','defaultFontSize','[B@63ba2cf8','nic', true);

--
-- Dumping data for table `user_`
--

INSERT INTO user_ (id, idcountry, idgender, idlanguage) VALUES (1,1,1,1);



--
-- Dumping data for table `indication_group`
--

INSERT INTO indication_group (id, name) VALUES (1,'Indikations Gruppe 1');
INSERT INTO indication_group (id, name) VALUES (2,'Indikations Gruppe 2');
INSERT INTO indication_group (id, name) VALUES (3,'Indikations Gruppe 3');
INSERT INTO indication_group (id, name) VALUES (4,'Indikations Gruppe 4');
INSERT INTO indication_group (id, name) VALUES (5,'Indikations Gruppe 5');
INSERT INTO indication_group (id, name) VALUES (6,'Indikations Gruppe 6');


--
-- Dumping data for table `product_group`
--

INSERT INTO product_group (id, name) VALUES (1,'Produkt Gruppe 1');
INSERT INTO product_group (id, name) VALUES (2,'Produkt Gruppe 2');
INSERT INTO product_group (id, name) VALUES (3,'Produkt Gruppe 3');



--
-- Dumping data for table `image`
--

INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (1,'default','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/drug-placeholder.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (2,'Accupro','image/png', NOW(), FILE_READ('src/main/frontend/assets/images/accupro.png'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (3,'Baymycard','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/baymycard.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (4,'Beloc-Zok','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/beloc-zok.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (5,'Cardular','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/cardura.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (6,'Ciprobay','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/ciprobay.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (7,'Clexane','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/clexane.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (8,'Novalgin','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/novalgin.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (9,'Reminyl','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/reminyl.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (10,'Toujeo','image/jpg', NOW(), FILE_READ('src/main/frontend/assets/images/toujeo.jpg'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (11,'Metformin','image/png', NOW(), FILE_READ('src/main/frontend/assets/images/metformin.png'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (12,'Amlodipin','image/png', NOW(), FILE_READ('src/main/frontend/assets/images/amlodipin.png'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (13,'Enalapril','image/png', NOW(), FILE_READ('src/main/frontend/assets/images/enalapril.png'));
INSERT INTO image (id, filename, filetype, uploaded_at, image) VALUES (14,'Salbutamol','image/png', NOW(), FILE_READ('src/main/frontend/assets/images/salbutamol.png'));


--
-- Dumping data for table `drug_simple`
--

INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (1,'Accupro® 10 Filmtabletten',0,'3915-06-01','1.59', '2011-1-1', 2);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (2,'Baymycard',0,'3915-06-01','1.59','2011-1-1', 3);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (3,'Beloc-Zok® comp',6030,'3915-06-01','1.37','2011-1-1', 4);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (4,'Cardura',0,'3915-06-01','1.59','2011-1-1', 5);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (5,'Ciprobay',0,'3915-06-01','1.59','2011-1-1', 6);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (6,'Clexane',0,'3915-06-01','1.59','2011-1-1', 7);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (7,'Novalgin',0,'3915-06-01','1.59','2011-1-1', 8);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (8,'Reminyl',0,'3915-06-01','1.36','2011-1-1', 9);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (9,'Topiramat-Janssen',0,'3915-06-01','1.0','2011-1-1', 1);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (10,'Toujeo',0,'3915-06-01','1.59','2011-1-1', 10);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (11,'Metformin',0,'3915-06-01','1.59','2017-4-1', 11);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (12,'Amlodipin (besilat)',0,'3915-06-01','1.59','2018-1-1', 12);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (13,'Enalapril',0,'3915-06-01','1.59','2017-8-1', 13);
INSERT INTO drug_simple (id, name, number, status, version, year, idimage) VALUES (14,'Salbutamol',0,'3915-06-01','1.59','2017-11-1', 14);


--
-- Dumping data for table `drug`
--

INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (1,4,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (2,3,2);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (3,4,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (4,4,3);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (5,5,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (6,1,2);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (7,6,2);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (8,2,2);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (9,3,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (10,5,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (11,5,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (12,5,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (13,5,1);
INSERT INTO drug (id, idindication_group, idproduct_group) VALUES (14,4,1);


-- Dumping data for table `substance_group`
--
INSERT INTO substance_group (id, name) VALUES (1,'Angiotensin-Converting-Enzyme (ACE)-Hemmer');
INSERT INTO substance_group (id, name) VALUES (2,'Biguanide');
INSERT INTO substance_group (id, name) VALUES (3,'Calciumantagonisten');


--
-- Dumping data for table `active_substance`
--

INSERT INTO active_substance (id, name, idsubstance_group) VALUES (1,'Quinaprilhydrochlorid',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (2,'Nisoldipin',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (3,'Hydrochlorothiazid',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (4,'Metoprololsuccinat',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (5,'Doxazosinmesilat',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (6,'Ciprofloxacin',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (7,'Enoxaparin-Natrium',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (8,'Metamizol-Natrium 1 H2O',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (9,'Galantamin',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (10,'Quinaprilhydrochlorid',NULL);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (11,'Metforminhydrochlorid',2);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (12,'Amlodipin',3);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (13,'Enalaprilmaleat',1);
INSERT INTO active_substance (id, name, idsubstance_group) VALUES (14,'Salbutamolsulfat',1);

--
-- Dumping data for table `drug_active_substance`
--

INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (1,1);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (2,2);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (3,3);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (3,4);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (4,5);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (5,6);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (5,1);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (6,7);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (7,8);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (8,9);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (10,10);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (11,11);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (12,12);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (13,13);
INSERT INTO drug_active_substance (iddrug, idactive_substance) VALUES (14,14);


--
-- Dumping data for table `product_group`
--

--


--
-- Dumping data for table `tag`
--



--
-- Dumping data for table `adverse_effect`
--

--
-- Dumping data for table `pharmaceutical_form`
--

INSERT INTO pharmaceutical_form (id, name) VALUES (1,'Filmtabletten');
INSERT INTO pharmaceutical_form (id, name) VALUES (2,'Retardtablette');
INSERT INTO pharmaceutical_form (id, name) VALUES (3,'Tablette');
INSERT INTO pharmaceutical_form (id, name) VALUES (4,'Flüssigkeit');
INSERT INTO pharmaceutical_form (id, name) VALUES (5,'Kapsel');
INSERT INTO pharmaceutical_form (id, name) VALUES (6,'Inhalativa');


--
-- Dumping data for table `drug_pharmaceutical_form`
--

INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (1,1);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (2,1);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (3,2);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (7,1);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (10,1);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (11,1);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (12,3);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (13,3);
INSERT INTO drug_pharmaceutical_form (iddrug, idpharmaceutical_form) VALUES (14,6);



--
-- Dumping data for table `packaging`
--

INSERT INTO packaging (id, name, pzn, iddrug) VALUES (1,'N3','03738798',1);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (2,'N1','03738775',1);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (3,'100','07358319',2);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (4,'50','07358302',2);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (5,'N3','04634747',3);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (6,'N1','04634724',3);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (7,'N2','04634730',3);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (8,'N3','00698199',4);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (9,'N1','08729309',4);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (10,'5','03229861',5);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (11,'12 Fertigspritzen','10813336',6);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (12,'24 Fertigspritzen','10813313',6);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (13,'50 St.','02948401',7);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (14,'10 St.','04129512',7);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (15,'30 St.','02948393',7);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (16,'100 ml Lösung','01416174',8);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (17,'N3','03738798',10);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (18,'N1','03738775',10);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (19,'N1','08839133',11);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (20,'N1','08454491',12);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (21,'N1','01097668',13);
INSERT INTO packaging (id, name, pzn, iddrug) VALUES (22,'N1','1448760',14);



--
-- Dumping data for table `disease`
--

INSERT INTO disease (id, name) VALUES (1, 'Schnupfen');
INSERT INTO disease (id, name) VALUES(2, 'Grippe');
INSERT INTO disease (id, name) VALUES(3, 'Gelenkschmerzen');
INSERT INTO disease (id, name) VALUES(4, 'Lungenentzündung');
INSERT INTO disease (id, name) VALUES(5, 'Blasenentzündung');
INSERT INTO disease (id, name) VALUES(6, 'Zuckerkrankheit (Typ-2 Diabetis)');
INSERT INTO disease (id, name) VALUES(7, 'Hoher Blutdruck');
INSERT INTO disease (id, name) VALUES(8, 'Herzleistungsschwäche (Herzinsuffizienz)');
INSERT INTO disease (id, name) VALUES(9, 'Bronchialasthma');

--
-- Dumping data for table `gender_disease`
--

INSERT INTO gender_disease (idgender, iddisease) VALUES (1, 1);
INSERT INTO gender_disease (idgender, iddisease) VALUES (1, 3);
INSERT INTO gender_disease (idgender, iddisease) VALUES (1, 4);
INSERT INTO gender_disease (idgender, iddisease) VALUES (2, 1);
INSERT INTO gender_disease (idgender, iddisease) VALUES (2, 2);
INSERT INTO gender_disease (idgender, iddisease) VALUES (2, 3);
INSERT INTO gender_disease (idgender, iddisease) VALUES (2, 4);
INSERT INTO gender_disease (idgender, iddisease) VALUES (2, 5);


--
-- Dumping data for table `drug_disease`
--

INSERT INTO drug_disease (iddrug, iddisease) VALUES (1, 1);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (1, 5);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (2, 3);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (4, 1);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (5, 3);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (6, 2);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (7, 3);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (8, 1);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (8, 5);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (8, 4);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (9, 5);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (10, 1);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (10, 3);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (11, 6);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (12, 7);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (13, 7);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (13, 8);
INSERT INTO drug_disease (iddrug, iddisease) VALUES (14, 9);

--
-- Dumping data for table `drug_feature`
--
INSERT INTO drug_feature (id, drug_feature, min_age, max_age, description_drug ) VALUES (1,'Ohne Tierversuche', 0, 0, '
<p>Tierversuche sind in §7 (2) Tierschutzgesetz definiert als „Eingriffe oder Behandlungen zu Versuchszwecken an Tieren
    oder am Erbgut von Tieren, wenn sie mit Schmerzen, Leiden oder Schäden für die Tiere verbunden sein können oder dazu
    führen können, dass Tiere geboren werden (…), die Schmerzen, Leiden oder Schäden erleiden.“ Tierversuche sind auch
    Eingriffe oder Behandlungen, die nicht Versuchszwecken dienen, zur<ul>
        <li> Herstellung, Gewinnung, Aufbewahrung oder Vermehrung von Stoffen, Produkten oder Organismen</li>
        <li> Organ- oder Gewebeentnahme, um diese zu wissenschaftlichen Zwecken zu kultivieren, transplantieren,
            untersuchen</li>
        <li>Verwendung zu Aus-, Fort- oder Weiterbildungszwecken </li>
    </ul><b>Bei diesem Medikament wurden keine Tierversuche durchgeführt.</b></p>
');
INSERT INTO drug_feature (id, drug_feature, description_drug ) VALUES (2,'Halal','<p>Halal" bedeutet so viel wie
    "rein",
    "erlaubt", und die entsprechenden Gebote umfassen Dinge und Handlungen, die aus islamischer Sicht zulässig und
    islam-konform sind. Dazu gehören auch bestimmte Speisevorschriften und Lebensmittel, wie etwa
    <ul>
        <li>das Fleisch von Pflanzenfressern (Huhn, Rind, Schaf), welches nach bestimmten Vorschriften geschlachtet
            wurde (so
            genannte Schächtung)</li>
        <li>Frischmilch</li>
        <li>frisches Obst</li>
        <li>Gemüse</li>
        <li>Eier</li>
        <li>pflanzliche Öle</li>
    </ul>
    Im Gegensatz dazu werden verbotene oder unzulässige Lebensmittel als "Haram"-Lebensmittel bezeichnet. Diese sind
    typischerweise
    <ul>
        <li>Schweinefleisch oder mit dessen Bestandteilen hergestellte Produkte, etwa Zwiebelkuchen mit Speck,
            Mettbrötchen
        </li>
        <li>Gelatine, die aus Schweinerohstoffen gewonnen wurde und damit hergestellte Lebensmittel wie Joghurts, Torten
            und
            Gummibärchen etc.</li>
        <li>Alkohol und Lebensmittel, die diesen enthalten, zum Beispiel Eis und Pralinen (auch in Spuren oder versteckt
            als
            Trägerstoff etwa bei Aromen, Farbstoffen)</li>
        <li>bluthaltige Lebensmittel wie etwa Blutwurst</li>
    </ul>
    <b>Bei diesem Medikament handelt es sich um ein Haram Medikament.</b>

</p>');
INSERT INTO drug_feature (id, drug_feature, min_age, max_age, description_drug)VALUES (3,'Beeinträchtigt die
Fahrtüchtigkeit', 16, 0,'<h4> Verkehrsuntauglich durch bestimmte Medikamente</h4>

<p>Eine Verkehrsuntauglichkeit wird typischerweise durch die dämpfenden Wirkungen von Medikamenten auf das zentrale
    Nervensystem verursacht. Diese Wirkungen führen zu einer geringeren Aufmerksamkeit oder einem vermindertem
    Reaktionsvermögen. Manche Medikamente beeinflussen das Urteilsvermögen und die Selbsteinschätzung. Das kann sich in
    riskantem Fahrverhalten äußern. Gefährlich wird es auch bei Augentropfen – sie können das Sehvermögen
    beeinträchtigen. Werden mehrere Arzneimittel gleichzeitig eingenommen, können sich die Wirkungen auf die
    Verkehrstüchtigkeit sogar verstärken. Dies gilt auch für rezeptfreie Präparate, pflanzliche Heilmittel und
    Nahrungsergänzungsmittel. Besonders gefährlich ist die Mischung von Alkohol und Medikamenten. Vorsicht: Auch
    Hustenmittel und Magentropfen können Alkohol enthalten!</p>

<h4> Warnhinweise beachten</h4>

<p>Um sich über mögliche Beeinträchtigungen der Verkehrstüchtigkeit zu informieren, ist ein Blick auf die
    Medikamentenpackung und in die Gebrauchsinformation angezeigt. Wenn ein Arzneimittel die Reaktionsfähigkeit und
    Verkehrstüchtigkeit beeinträchtigen kann, muss laut der Gebrauchsinformationsverordnung § 14 (1) und der
    Kennzeichnungsverordnung § 13 (1) ein entsprechender Warnhinweise im Beipacktext bzw. auf der Verpackung angeführt
    sein. Laut Auskunft der AGES PharmMed müssen Hersteller im Zuge der Zulassung verbindliche Daten bzw. Stellungnahmen
    vorlegen, die Aussagen zum Thema Verkehrstüchtigkeit möglich machen. Aber auch wenn kein Warnhinweis bei einem
    Medikament zu finden ist, können Nebenwirkungen wie Schwindel, Kopfweh oder allergische Reaktionen die
    Verkehrstüchtigkeit stark einschränken.</p>

<h4> Eigenverantwortung wichtig</h4>

<p>Ob man fit genug ist, ein Auto zu lenken, oder die Verkehrstüchtigkeit stark beeinträchtigt ist, kann man selbst
gut
beurteilen. Bei der Verschreibung der Medikamente gibt die behandelnde Ärztin/der behandelnde Arzt über die
Wirkungen auf die Verkehrstüchtigkeit Auskunft. Wenn trotz einer Fahruntauglichkeit ein Fahrzeug gelenkt wird, kann
die Polizei die Weiterfahrt verhindern und sogar die Fahrzeugschlüssel abnehmen. Bei einer Beeinträchtigung der
Fahrtauglichkeit im Sinne von § 58 StVO droht eine Verwaltungsstrafe.
</p>');
INSERT INTO drug_feature (id, drug_feature, description_drug ) VALUES (4,'Verschreibungspflichtig','<p>
    Verschreibungspflichtige Medikamente sind hingegen nur auf Verordnung/Verschreibung durch einen Arzt oder eine
    Ärztin erhältlich und bedürfen einer ärztlichen Betreuung. Sie unterliegen erhöhten Sicherheitsanforderungen, da sie
    auch bei bestimmungsgemäßem Gebrauch eine Gesundheitsgefährdung für Mensch und Tier darstellen können. </br>
    Ob ein Medikamente der Verschreibungspflicht unterliegt oder nicht, ist abhängig von
    <ul>
        <li>dem Wirkstoff und der Wirkstoffmenge. So ist das Schmerz- und Fiebermittel Ibuprofen beispielsweise mit
            einer
            Wirkstoffmenge bis 400 mg apothekenpflichtig, ab 600 mg jedoch verschreibungspflichtig.</li>
        <li>der Art der Verabreichung. Beispielsweise ist das Schmerz- und Fiebermittel Acetylsalicylsäure (ASS) in Form
            von
            Tabletten oder Brausetabletten apothekenpflichtig, als Injektionslösung zur intravenösen Anwendung durch
            einen Arzt
            oder eine Ärztin hingegen verschreibungspflichtig.</li>
        <li>der „Neuheit“ des Wirkstoffes. Zwar haben die apothekenpflichtigen Medikamente durch Zulassungsstudien ihre
            Wirksamkeit, Unbedenklichkeit und Qualität nachweisen müssen. Eine Erfahrung in der breiten Bevölkerung und
            über
            Jahre liegt allerdings noch nicht vor.</li>
        <li>dem Anwendungsgebiet und dem Erkrankungsbild (chronisch oder akut). So ist beispielsweise der Schleimlöser
            Acetylcystein (ACC) trotz gleichem Wirkstoff und gleicher Wirkstoffmenge sowohl verschreibungspflichtig als
            auch
            rezeptfrei.</li>
    </ul>
</p>');
INSERT INTO drug_feature (id, drug_feature) VALUES (5,'Ohne Alkohol');
INSERT INTO drug_feature (id, drug_feature ) VALUES (6,'Homöopathisch');
INSERT INTO drug_feature (id, drug_feature, description_drug ) VALUES (7,'Glutenfrei','<p>Patienten mit Zöliakie
    reagieren
    auf Gluten, ein in verschiedenen Getreidesorten enthaltenes Eiweiß. Nahrungsmittel, die Gluten enthalten, können bei
    ihnen beispielsweise Symptome wie Durchfall, Bauchschmerzen oder Blähungen hervorrufen. Insgesamt sind die Symptome
    einer Zöliakie sehr unterschiedlich. Manchmal verläuft sie über Jahre unbemerkt. Mithilfe von Bluttests und einer
    Dünndarmbiopsie diagnostiziert der Arzt eine Zöliakie. Die Behandlung besteht dann in einer lebenslangen
    glutenfreien Diät.</p>');
INSERT INTO drug_feature (id, drug_feature, description_drug) VALUES (8,'Für Schwangere ungeeignet.','<p>Wenn eine Frau
    Medikamente in der Schwangerschaft einnimmt, ist das Ungeborene immer unfreiwilliger Empfänger der Wirkstoffe. Daher
    ist es sinnvoll, wenn es nötig ist nur geeignete Medikamente in der Schwangerschaft einzunehmen, wie auch Fälle aus
    der Vergangenheit zeigen.
    Nimmt eine schwangere Frau Medikamente ein, wird das Baby also mitbehandelt.

    Da das Ungeborene jedoch noch in der Reifung ist, wirken Medikamente ganz anders, als bei Erwachsenen – in manchen
    Fällen sogar schädlich.

    Besonders kritisch ist die Einnahme von Medikamenten im ersten Schwangerschaftsdrittel. Die Schwangerschaft ist hier
    noch sehr instabil, die Ausbildung von Nerven und Organen noch ganz am Anfang. Die Entwicklung des Kindes ist in
    dieser Zeit anfälliger. In der Spätschwangerschaft sind die meisten Medikamente weniger gefährlich.</p>
<h4>Viele Wirkstoffe sind für Schwangere zu wenig erforscht</h4>
<p>Die Entscheidung für oder gegen ein Medikament in der Schwangerschaft ist jedoch schwierig, denn es werden in
    Deutschland kaum klinische Studien mit Schwangeren durchgeführt. Die Wirkung vieler Medikamente auf den schwangeren
    Organismus ist nicht ausreichend erforscht. Außerdem sind die Auswirkungen auf das Baby individuell unterschiedlich.
</p>');
INSERT INTO drug_feature (id, drug_feature) VALUES (9,'vegan');
INSERT INTO drug_feature (id, drug_feature) VALUES (10,'othermed');
INSERT INTO drug_feature (id, drug_feature) VALUES (11,'nograpefruit');
INSERT INTO drug_feature (id, drug_feature) VALUES (12,'lactosefrei');
INSERT INTO drug_feature (id, drug_feature, min_age, max_age)VALUES (13,'Könnte die
Fahrtüchtigkeit beeinträchtigen', 16, 0);
INSERT INTO drug_feature (id, drug_feature, min_age, max_age)VALUES (14,'Beinträchtigt die
Fahrtüchtigkeit nicht', 16, 0);
INSERT INTO drug_feature (id, drug_feature)VALUES (15,'Enthält Lactose');
INSERT INTO drug_feature (id, drug_feature)VALUES (16,'Keine Beinträchtigung durch Nahrung');


--
-- Dumping data for table `drug_drug_feature`
--

INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (1,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (1,3);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (1,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (1,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,7);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,3);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (2,5);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (3,5);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (3,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (3,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (3,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (4,2);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (4,3);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (4,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (4,5);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (4,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (5,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (5,2);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (5,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (5,7);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (5,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (6,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (6,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (6,7);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (6,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (7,1);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (8,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (9,7);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (10,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (11,13);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (11,5);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (11,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (11,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (12,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (12,3);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (12,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (13,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (13,4);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (14,8);
INSERT INTO drug_drug_feature (iddrug, iddrug_feature) VALUES (14,12);




-- Dumping data for table `drug_feature`
--

INSERT INTO drug_feature_gender (drug_feature_id, gender_id) VALUES (8,2);

--
-- Dumping data for table `drug_adverse_effect`
--


--
-- Dumping data for table `drug_disease`
--


--
-- Dumping data for table `wordExplanation`
--

INSERT INTO word_Explaination (id, name, description) VALUES (1,'Insulin', '<p>Insulin ist ein von der Bauchspeicheldrüse gebildetes Hormon, das für die Aufnahme
                    von Glukose
                    (Zucker) aus dem Blut in die Körperzellen sorgt.
                    Dort wird die Glukose in Energie umgewandelt oder als Vorrat zur späteren Verwendung
                    gespeichert.
                </p>' );
INSERT INTO word_Explaination (id, name, description) VALUES (2,'Ketoazidose', '  <p>
                        Die Ketoazidose ist ein Zustand, bei dem sich als „Ketonkörper“ bezeichnete
                        Substanzen im Blut anhäufen, die zu einem diabetischen Präkoma führen können. Zu den Symptomen
                        gehören Magenschmerzen, schnelle und tiefe Atmung, Schläfrigkeit oder die Entwicklung
                        eines ungewöhnlichen fruchtigen Geruchs des Atems.
                    </p>');
INSERT INTO word_Explaination (id, name, description) VALUES (3,'Laktatazidose', 'Metformin Lich kann vor allem dann, wenn Ihre Nieren nicht richtig funktionieren,
                    eine sehr seltene,
                    aber sehr schwerwiegende Nebenwirkung verursachen, die als Laktatazidose bezeichnet
                    wird. Das
                    Risiko, eine Laktatazidose zu entwickeln, wird auch durch schlecht eingestellten
                    Diabetes, schwere
                    Infektionen, längeres Fasten oder Alkoholkonsum, Dehydrierung (weitere Informationen
                    siehe unten),
                    Leberprobleme und Erkrankungen erhöht, bei denen ein Teil des Körpers nicht mit
                    genügend
                    Sauerstoff versorgt wird (zum Beispiel bei akuten schweren Herzerkrankungen).
                    <hr>
                    <div class="row">
                        <div class="col-md-10">
                            Falls einer der genannten Punkte auf Sie zutrifft, sprechen Sie mit Ihrem
                            Arzt hinsichtlich
                            weiterer
                            Anweisungen.
                        </div>
                        <div class="col-md-2">
                            <i style="font-size:40px;color: #575858;" class="fas fa-user-md"></i>
                        </div>
                    </div>
                    <hr>
                    Unterbrechen Sie die Einnahme von Metformin Lich für eine kurze Zeit, wenn Sie einen
                    Zustand haben, der mit einer Dehydrierung (erheblicher Verlust an Körperflüssigkeit)
                    verbunden
                    sein kann, wie beispielsweise schweres Erbrechen, Durchfall, Fieber, Hitzebelastung
                    oder geringere
                    Flüssigkeitsaufnahme als normalerweise. Sprechen Sie hinsichtlich weiterer
                    Anweisungen mit Ihrem
                    Arzt.<br>
                    Beenden Sie die Einnahme von Metformin Lich und wenden Sie sich unverzüglich an
                    einen Arzt
                    oder an das nächstgelegene Krankenhaus, wenn Sie Symptome einer Laktatazidose
                    bemerken,
                    da dieser Zustand zum Koma führen kann.
                    Symptome einer Laktatazidose sind:
                    <ul>
                        <li>Erbrechen</li>
                        <li>Bauchschmerzen</li>
                        <li>Muskelkrämpfe</li>
                        <li>allgemeines Unwohlsein mit starker Müdigkeit</li>
                        <li>Schwierigkeiten beim Atmen</li>
                        <li>verringerte Körpertemperatur und Herzklopfen</li>
                    </ul>
                    <hr>
                    <div class="row">
                        <div class="col-md-10">
                            Eine Laktatazidose ist ein medizinischer Notfall und muss in einem
                            Krankenhaus behandelt
                            werden.
                            Es ist wichtig, dass Sie regelmäßig Ihre Medikation einnehmen, die
                            Diätanweisungen beachten
                            und
                            Ihr
                            Sportprogramm absolvieren, da dies das Risiko einer Laktatazidose vermindern
                            kann.
                        </div>
                        <div class="col-md-2">
                            <i style="font-size:40px;color: #f94343;" class="fas fa-hospital"></i>
                        </div>
                    </div>');
INSERT INTO word_Explaination (id, name, description) VALUES (4,'Hepatitis', '<p> Hepatitis ist eine Leberentzündung. Diese kann
                    Müdigkeit,
                    Appetitverlust und Gewichtsabnahme mit oder ohne Gelbfärbung der Haut und des
                    Augenweißes verursachen.
                </p>');
INSERT INTO word_Explaination (id, name, description) VALUES (5,'Diabetes Typ 2', '<p>Diabetes Typ 2, auch nicht insulinabhängiger Diabetes“ genannt, tritt meist nach dem 40.
                    Lebensjahr
                    auf. Hierbei besteht ein „relativer
                    Insulinmangel“. Die Bauchspeicheldrüse produziert zwar Insulin, aber die Körperzellen verlieren
                    ihre
                    Empfindlichkeit für das Hormon und/oder die Ausschüttung des Insulins aus den Zellen der
                    Bauchspeicheldrüse ist gestört. Die Bauchspeicheldrüse versucht dies auszugleichen, indem sie
                    immer
                    mehr Insulin ausschüttet. Doch trotz erhöhtem Insulinspiegel gelangt immer weniger Zucker in die
                    Körperzellen. Sehr häufig können Menschen mit Diabetes Typ 2 zunächst mit einer
                    Ernährungsumstellung
                    allein oder aber in einer Kombination mit Tabletten behandelt werden. Im Krankheitsverlauf
                    vermindert sich aber die Insulinproduktion der Bauchspeicheldrüse, wodurch auch bei Menschen mit
                    Typ-2-Diabetes der Insulinmangel weiter fortschreitet. Der dadurch veränderte Stoffwechsel muss
                    dann
                    ebenfalls mit Insulin-Injektionen behandelt werden.
                    <br>
                    Ursachen eines Typ-2-Diabetes sind:
                    <ul>
                        <li>eine entsprechende genetische Disposition,
                        <li> häufig verbunden mit starkem Übergewicht (Adipositas)
                        <li>und zu wenig körperliche Bewegung.
                        <li>Auch erhöhte Blutfettwerte sowie Bluthochdruck gehen oft mit einem Prädiabetes oder
                            Diabetes
                            einher
                            (Metabolisches Syndrom).
                    </ul>
                    <br>
                    Sehr häufig können Menschen mit Diabetes Typ 2 mit einer Ernährungsumstellung allein oder
                    aber in einer Kombination mit Tabletten behandelt werden. Bei zunehmender Krankheitsdauer müssen
                    allerdings auch Typ-2-Diabetiker mit einem Fortschreiten des Insulinmangels rechnen. Der dadurch
                    veränderte Stoffwechsel muss dann ebenfalls mit Insulin-Injektionen behandelt werden.
                    <a
                        href="https://www.diabetesde.org/ueber_diabetes/was_ist_diabetes_/was_ist_diabetes_typ_2">Quelle</a>
                </p>');
INSERT INTO word_Explaination (id, name, description) VALUES (6,'Bei einer größeren Operation', '<p>
                    Falls bei Ihnen eine größere Operation geplant ist, müssen Sie die Einnahme von Metformin Lich
                    während des Eingriffs und für einige Zeit danach unterbrechen.
                    Ihr Arzt wird entscheiden, wann Sie Ihre Behandlung mit Metformin Lich beenden müssen und wann
                    die
                    Behandlung wieder begonnen werden kann. <br>
                    Ihr Arzt entscheidet, ob Sie während dieser Zeit eine andere Behandlung benötigen.<br>
                    Während der Behandlung mit Metformin Lich wird Ihr Arzt mindestens einmal jährlich oder – falls
                    Sie älter sind und/oder sich Ihre Nierenfunktion verschlechtert – auch häufiger Ihre
                    Nierenfunktion
                    kontrollieren.
                </p>');
INSERT INTO word_Explaination (id, name, description) VALUES (7,'Angina pectoris', '  <p>Angina pectoris (mediz. Stenokardie) bedeutet Brustenge. Sie äußert sich in einem plötzlich
                    auftretenden Schmerz in der Herzgegend sowie einem Druckgefühl in der Brust. Ausgelöst wird die
                    Angina pectoris durch einen Sauerstoffmangel des Herzens. Es besteht Lebensgefahr, deshalb sollte
                    man sofort den Notarzt rufen! Angina pectoris lässt sich normalerweise mit Medikamenten gut
                    behandeln. Akute Angina-pectoris Schmerzen im Brustbereich werden durch dieses Arzneimittel nicht
                    sofort gelindert.
                    <br>
                    Quelle: <a
                        href="https://www.netdoktor.de/krankheiten/angina-pectoris/">https://www.netdoktor.de/krankheiten/angina-pectoris/</a>
                </p>');


-- Dumping data for table `drug_wordExplaination`
--

INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,1);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,2);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,3);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,4);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,5);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (11,6);
INSERT INTO drug_word_explaination (iddrug, idword_Explaination) VALUES (12,7);



--
-- Dumping data for table `interaction`
--

INSERT INTO interaction (id, interaction) VALUES (1, 'Kann zu Durchfall führen');
INSERT INTO interaction (id, interaction) VALUES (2, 'Kann sehr ermüdend wirken');


--
-- Dumping data for table `interaction_drug`
--

INSERT INTO interaction_drug (idinteraction, iddrug) VALUES (1, 2), (1, 3), (1, 5), (2, 3);

--
-- Dumping data for table `drug_interaction`
--

INSERT INTO drug_interaction (idinteraction, iddrug) VALUES (1, 1), (1, 4), (1, 3), (2, 1);


--
-- Dumping data for table `item_invocation`
--

-- INSERT INTO item_invocation (id, iduser, iddrug, timestamp) VALUES (1, 1, 1, NOW());
-- INSERT INTO item_invocation (id, iduser, iddrug, timestamp) VALUES (2, 1, 1, NOW());
-- INSERT INTO item_invocation (id, iduser, iddrug, timestamp) VALUES (3, 1, 2, NOW());
-- INSERT INTO item_invocation (id, iduser, iddrug, timestamp) VALUES (4, 1, 1, NOW());
-- INSERT INTO item_invocation (id, iduser, iddrug, timestamp) VALUES (5, 1, 6, NOW());

--
-- Dumping data for table `language`
--


--
-- Dumping data for table `login_attempt`
--


--
-- Dumping data for table `user_disease`
--


--
-- Dumping data for table `user_drug`
--


--
-- Dumping data for table `user_drug_feature`
--


--
-- Dumping data for table `user_preferred_topic`
--


--
-- Dumping data for table `user_query`
--


--
-- Dumping data for table `packaging_topic`
--

INSERT INTO packaging_topic (id, order_number, title, text) VALUES (1,1,'Anwenderhinweise','<p style="font-weight: bold;"> Lesen Sie die gesamte e-Packungsbeilage sorgfältig durch, denn sie enthält wichtige Informationen für Sie. Um einen bestmöglichen Behandlungserfosm zu erzielen, muss Prospan® Hustensaft jedoch vorschriftsmäßig angewendet werden.</p><ul> <li>Fragen Sie Ihren Apotheker, wenn Sie weitere Informationen oder einen Rat benötigen. </li><li>Wenn sich Ihre Symptome verschlimmern oder nach 7 Tagen keine Besserung eintritt, müssen Sie auf jeden Fall einen Arzt aufsuchen. </li></ul><div class="row alert alert-danger" role="alert"> <div class="col-md-1 alert_style"> <i class="fas fa-exclamation"></i></div><div class="col-md-11"> <p> Wenn eine der aufgeführten Nebenwirkungen Sie erheblich beeinträchtigt oder Sie Nebenwirkungen bemerken, die nicht in dieser Gebrauchsinformation angegeben sind, informieren Sie bitte Ihren <b>Arzt oder Apotheker</b>.</p></div></div>');
INSERT INTO packaging_topic (id, order_number, title) VALUES (2,2,'Allgemeine Hinweise');
INSERT INTO packaging_topic (id, order_number, title) VALUES (3,3,'Vorsichtsmaßnahmen und Warnhinweise');
INSERT INTO packaging_topic (id, order_number, title) VALUES (4,4,'Indikationen');
INSERT INTO packaging_topic (id, order_number, title) VALUES (5,5,'Anwendung und Dosierung');
INSERT INTO packaging_topic (id, order_number, title) VALUES (6,6,'Nebenwirkungen');
INSERT INTO packaging_topic (id, order_number, title) VALUES (7,7,'Aufbewahrung');
INSERT INTO packaging_topic (id, order_number, title) VALUES (8,8,'Zusatzinformationen');
INSERT INTO packaging_topic (id, order_number, title) VALUES (9,9,'Inhalt der Packung');
INSERT INTO packaging_topic (id, order_number, title) VALUES (10,10,'Darstellung des Medikaments');
INSERT INTO packaging_topic (id, order_number, title) VALUES (11,11,'Wirkstoff');


--
-- Dumping data for table `packaging_section`
--


INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (1,0,1,1, '<h4>Lesen Sie die gesamte Packungsbeilage sorgfältig durch, bevor Sie mit der Einnahme dieses Arzneimittels beginnen, denn sie enthält wichtige Informationen.</h4> <p>Ihr Arzt hat Ihnen ein wirksames Arzneimittel zur Behandlung von nicht organbedingtem Bluthochdruck und Herzleistungsschwäche verschrieben. Den Nutzen von Accupro 10 schätzt Ihr Arzt für Sie höher ein als die möglichen Risiken, die mit seiner Anwendung einhergehen können.</p> <ul> <li> <p>Heben Sie die Packungsbeilage auf. Vielleicht möchten Sie diese später nochmals lesen.</p> </li> <li> <p>Wenn Sie weitere Fragen haben, wenden Sie sich an Ihren Arzt oder Apotheker.</p> </li> <li> <p>Dieses Arzneimittel wurde Ihnen persönlich verschrieben. Geben Sie es nicht an Dritte weiter. Es kann anderen Menschen schaden, auch wenn diese die gleichen Beschwerden haben wie Sie.</p> </li> <li> <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren Arzt oder Apotheker. Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage angegeben sind. Siehe Abschnitt 4.</p> </li> </ul> <p> <italic>Die kursiv geschriebenen Informationen sind ZusatzInformationen für Ihren Arzt.</italic> </p>');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (2,0,1,4,'<h4>Was ist Accupro 10 und wofür wird es angewendet?</h4> <p>Accupro 10 ist ein Arzneimittel aus der Gruppe der sogenannten ACE(Angiotensin-Converting-Enzym)-Hemmer und wird zur Senkung des Bluthochdrucks und zur Behandlung der Herzleistungsschwäche angewendet.</p> <p> <b>Accupro 10 wird angewendet bei:</b> </p> <ul> <li> <p>nicht organbedingtem Bluthochdruck <i>(essenzieller Hypertonie)</i> </p> </li> <li> <p>Herzleistungsschwäche <i>(Herzinsuffizienz)</i> – zusätzlich zu harntreibenden Medikamenten <i>(Diuretika)</i> und insbesondere bei schwerer Herzinsuffizienz auch zu Digitalis</p></li></ul>');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (3,0,1,5,'<h4>Wie ist Accupro 10 richtig einzunehmen?(<i>Dosierung</i>)</h4> <p>Nehmen Sie dieses Arzneimittel immer genau nach Absprache mit Ihrem Arzt oder Apotheker ein. Fragen Sie bei Ihrem Arzt oder Apotheker nach, wenn Sie sich nicht sicher sind.</p> <p> <b>Wie Sie Accupro 10 richtig einnehmen</b> </p> <p>Die Einnahme von Accupro 10 kann unabhängig von den Mahlzeiten erfolgen, die Tagesdosis kann auf einmal eingenommen oder auf 2 Einzelgaben verteilt werden. Nehmen Sie die Tabletten bitte mit ausreichend Flüssigkeit, z. B. einem großen Glas Wasser, ein.</p> <p>Falls vom Arzt nicht anders verordnet, ist die übliche Dosis:</p> <table> <tbody> <tr> <td/> <td> <p> <b>Anfangsdosis</b> </p> </td> <td> <p> <b>Erhaltungsdosis</b> </p> </td> <td> <p> <b>Maximaldosis</b> </p> </td> </tr> <tr> <td> <p> <b>Nicht organbedingter Bluthochdruck <i>(essenzielle Hypertonie)</i> </b> </p> </td> <td> <p>10 mg Quinapril pro Tag (entsprechend 1 Filmtablette Accupro 10). Wird mit dieser Dosis keine Blutdrucknormalisierung erreicht, kann die Dosis auf 20 mg pro Tag (entsprechend 2 Filmtabletten Accupro 10) erhöht </p> </td> <td> <p>Die Erhaltungsdosis beträgt in der Regel 10 mg pro Tag (entsprechend 1 Filmtablette Accupro 10).</p> </td> <td> <p>Die Maximaldosis von zweimal 20 mg (entsprechend jeweils 2 Filmtabletten Accupro 10 morgens und abends) sollte nicht überschritten werden.</p> </td> </tr> <tr> <td/> <td> <p>werden. Eine Dosiserhöhung sollte erst nach 3 Wochen erfolgen. Die Tagesdosis kann auf einmal eingenommen werden oder auf 2 Einzelgaben verteilt werden (morgens und abends).</p> </td> <td/> <td/> </tr> <tr> <td> <p> <b>Herzleistungs-schwäche <i>(Herzinsuffizienz)</i> </b> </p> </td> <td> <p>Accupro 10 kann als Zusatzmedikation zu einer bestehenden Therapie mit harntreibenden Arzneimitteln (Diuretika) und Digitalis gegeben werden. Die Anfangsdosis beträgt 2,5 mg Quinapril morgens und abends (entsprechend je ½ Filmtablette Accupro 5; dafür steht Ihnen Accupro 5 zur Verfügung).</p> </td> <td> <p>Eine Erhöhung der Dosis darf nur schrittweise in Abhängigkeit vom individuellen Ansprechen des Patienten auf die Therapie erfolgen.</p> <p>Die Erhaltungsdosis ist in der Regel 10 bis 20 mg pro Tag (entsprechend 1 bis 2 Filmtabletten Accupro 10).</p> </td> <td> <p>Die Maximaldosis von zweimal 20 mg pro Tag (entsprechend zweimal 2 Filmtabletten Accupro 10) sollte nicht überschritten werden.</p> </td> </tr> <tr> <td> <p> <b>Dosierung bei mäßig eingeschränkter Nierenfunktion <i>(Kreatinin-Clearance 30 bis 60 ml/min)</i> und bei Patienten &gt; 65 Jahre</b> </p> </td> <td> <p>Die Anfangsdosis beträgt 5 mg Quinapril (entsprechend ½ Filmtablette Accupro 10).</p> </td> <td> <p>Die Erhaltungsdosis beträgt in der Regel 5 bis 10 mg Quinapril pro Tag (entsprechend ½ bis 1 Filmtablette Accupro 10).</p> </td> <td> <p>Die Maximaldosis von 20 mg Quinapril pro Tag (entsprechend 2 Filmtabletten Accupro 10) sollte nicht überschritten werden.</p> </td> </tr> <tr> <td> <p> <b>Dosierung bei stark eingeschränkter Nierenfunktion <i>(Kreatinin-Clearance 10 bis 30 ml/min)</i> </b> </p> </td> <td> <p>Die Anfangsdosis beträgt 2,5 mg Quinapril (entsprechend ½ Filmtablette Accupro 5).</p> </td> <td> <p>Die Erhaltungsdosis beträgt in der Regel ebenfalls 2,5 mg Quinapril pro Tag (entsprechend ½ Filmtablette Accupro 5).</p> </td> <td> <p>Die maximale tägliche Dosis beträgt 5 mg Quinapril (entsprechend ½ Filmtablette Accupro 10). Der Abstand zwischen 2 Einnahmen sollte mindestens 24 Stunden betragen.</p> </td> </tr> </tbody> </table> <p>Die Tablette kann in gleiche Dosen geteilt werden.</p> <p> <i>Hinweis:</i> </p> <p> <i>Insbesondere bei Patienten mit Salz- und/oder Flüssigkeitsmangel (z. B. bei Erbrechen, Durchfall, Diuretikatherapie), Herzleistungsschwäche, akutem Herzinfarkt, instabiler Angina pectoris, ischämischer Herzerkrankung (eine besondere Art der Herzerkrankung), Erkrankungen der Gefäße des zentralen Nervensystems (zerebrovaskuläre Erkrankungen) oder schwerem Bluthochdruck kann es zu Beginn der Accupro-10-Therapie zu einem übermäßigen Blutdruckabfall kommen. Falls möglich, sollten Salz- und/ oder Flüssigkeitsmangel vor Beginn der Accupro-10-Therapie ausgeglichen bzw. eine bestehende Therapie mit harntreibenden Arzneimitteln (Diuretika) reduziert oder ggf. abgesetzt werden. Bei diesen Patienten ist die Therapie mit der geringsten Einzeldosis von 2,5 mg Quinaprilhydrochlorid morgens (entsprechend ½ Filmtablette Accupro 5) zu beginnen. Für diese Fälle steht Ihnen Accupro 5 zur Verfügung. Nach Gabe der 1. Dosis, aber auch bei Erhöhung der Dosis von Quinapril und/ oder Schleifendiuretika sind diese Patienten mindestens 6 Stunden ärztlich zu überwachen, um eine unkontrolliert auftretende übermäßige Blutdrucksenkung zu vermeiden. Bei Patienten mit schwerwiegender Verlaufsform des Bluthochdrucks (maligne Hypertonie) oder bei gleichzeitigem Vorliegen einer schweren Herzleistungsschwäche soll die Einstellung der Accupro-10-Therapie im Krankenhaus erfolgen.</i> </p> <p> <b>Wie lange Sie Accupro 10 einnehmen sollen</b> </p> <p>Eine bestimmte zeitliche Begrenzung ist nicht vorgesehen. Die Dauer der Anwendung hängt vom Verlauf Ihrer Erkrankung ab. Bitte sprechen Sie darüber mit Ihrem Arzt.</p> <p>Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, wenn Sie den Eindruck haben, dass die Wirkung von Accupro 10 zu stark oder zu schwach ist.</p> <p> <b>Wenn Sie eine größere Menge Accupro 10 eingenommen haben, als Sie sollten</b> </p> <p>Je nach Ausmaß der Überdosierung sind folgende Beschwerden möglich: zu starke Blutdrucksenkung, zu langsamer Herzschlag, Kreislaufschock, Störungen des Mineralhaushalts und Nierenversagen.</p> <p>Bei dringendem Verdacht auf eine Überdosierung verständigen Sie sofort einen Arzt, der gegebenenfalls Notfallmaßnahmen ergreifen kann.</p> <p> <i>Bei zu niedrigem Blutdruck sollten Kochsalzlösung und Flüssigkeit gegeben werden. Bei Nichtansprechen sollten zusätzlich blutdruckerhöhende Arzneimittel (Katecholamine oder Angiotensin II) intravenös gegeben werden. Bei zu langsamem Herzschlag sollte ein Schrittmacher gelegt werden. Die Nierenfunktion und der Mineralhaushalt sind engmaschig zu überwachen.</i> </p> <p> <b>Wenn Sie die Einnahme von Accupro 10 vergessen haben</b> </p> <p>Nehmen Sie die versäumte Dosis nicht nachträglich ein, sondern setzen Sie die Einnahme von Accupro 10 zum nächsten Einnahmetermin wie verordnet fort.</p> <p>Wenn Sie weitere Fragen zur Einnahme dieses Arzneimittels haben, wenden Sie sich an Ihren Arzt oder Apotheker.</p> ');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (4,0,1,8,'<h4>Inhalt der Packung und weitere Informationen</h4> <p> <b>Was Accupro 10 enthält</b> </p> <p>Der Wirkstoff ist: Quinaprilhydrochlorid. 1 Filmtablette enthält 10,832 mg Quinaprilhydrochlorid (entsprechend 10 mg Quinapril).</p> <p>Die sonstigen Bestandteile sind: Candelillawachs, Crospovidon, Gelatine, Hyprolose, Lactose-Monohydrat, Macrogol 400, schweres basisches Magnesiumcarbonat, Magnesiumstearat (Ph.Eur.), Hypromellose, Titandioxid (E 171).</p> <p> <b>Wie Accupro 10 aussieht und Inhalt der Packung</b> </p> <p>Die Filmtabletten sind weiß, dreieckig, beiderseits nach außen gewölbt, haben auf einer Seite eine „10“ eingeprägt und besitzen eine Bruchrille.</p> <p>Packung mit 30 Filmtabletten</p> <p>Packung mit 100 Filmtabletten</p>');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (5,0,1,6,'<h4>Welche Nebenwirkungen sind möglich?</h4> <p>Wie alle Arzneimittel kann auch dieses Arzneimittel Nebenwirkungen haben, die aber nicht bei jedem auftreten müssen.</p> <p> <b>Bedeutsame Nebenwirkungen oder Zeichen, auf die Sie achten sollten, und Maßnahmen, wenn Sie betroffen sind</b> </p> <p>Wenn Sie von einer der nachfolgend genannten Nebenwirkungen betroffen sind, nehmen Sie Accupro 10 nicht weiter ein und suchen Sie Ihren Arzt möglichst umgehend auf.</p> <p>Bei Verdacht auf eine schwerwiegende Hautreaktion muss sofort der behandelnde Arzt aufgesucht und ggf. die Therapie mit Accupro 10 abgebrochen werden. Hinweis: Es besteht eine erhöhte Gefahr der Ausbildung einer Schwellung im Gesichtsbereich bei schwarzhäutigen Patienten. Hautveränderungen können mit Fieber, Muskel- und Gelenkschmerzen <i>(Myalgien, Arthralgien, Arthritis)</i>, Gefäßentzündungen <i>(Vaskulitiden)</i>, Entzündungen seröser Häute und bestimmten Laborwertveränderungen <i>(Eosinophilie, Leukozytose und/ oder erhöhte ANA-Titer, erhöhte BSG)</i> einhergehen.</p> <p> <i>In Einzelfällen verliefen durch ACE-Hemmer ausgelöste Schwellungen im Gesichtsbereich (angioneurotische Ödeme) mit Beteiligung von Zunge, Rachen und/ oder Kehlkopf. Liegt eine derartige Verlaufsform vor, müssen sofort 0,3 bis 0,5 mg Epinephrin subkutan bzw. 0,1 mg Epinephrin (Verdünnungsanweisung beachten) <u>langsam</u> intravenös unter EKG- und Blutdruckkontrolle gegeben werden, im Anschluss daran Glukokortikoidgabe. Ferner wird die intravenöse Gabe von Antihistaminika und H<sub>2</sub>-Rezeptor-Antagonisten empfohlen. Zusätzlich zur Epinephrin-Anwendung kann bei bekanntem C<sub>1</sub>-Inaktivator-Mangel die Gabe von C<sub>1</sub>-Inaktivator erwogen werden.</i> </p> <p> <i>Bei Auftreten von Gelbsucht (Ikterus) oder bei einem deutlichen Anstieg der Leberenzyme ist die Therapie mit dem ACE-Hemmer abzubrechen.</i> </p> <p> <b>Andere mögliche Nebenwirkungen</b> </p> <p>Bei den Häufigkeitsangaben zu Nebenwirkungen werden folgende Kategorien zugrunde gelegt:</p> <table> <tbody> <tr> <td> <p>Sehr häufig: kann mehr als 1 von 10 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Häufig: kann bis zu 1 von 10 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Gelegentlich: kann bis zu 1 von 100 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Selten: kann bis zu 1 von 1.000 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Sehr selten: kann bis zu 1 von 10.000 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Nicht bekannt: Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</p> </td> </tr> </tbody> </table> <p> <u>Allgemeine Erkrankungen und Beschwerden am Verabreichungsort</u> </p> <p>Häufig: Schmerzen im Brustkorb, Erschöpfung, Schwächegefühl</p> <p>Gelegentlich: Fieber, Wasseransammlungen im Gewebe</p> <p> <u>Erkrankungen des Immunsystems</u> </p> <p>Nicht bekannt: Überempfindlichkeitsreaktionen</p> <p> <u>Herzerkrankungen</u> </p> <p>Gelegentlich:<i> </i>Angina pectoris, Herzklopfen, erhöhte Herzschlagfolge, Wasseransammlungen im Gewebe, Herzinfarkt</p> <p>Sehr selten: Herzrhythmusstörungen, Schlaganfall</p> <p> <u>Gefäßerkrankungen</u> </p> <p>Häufig: Insbesondere zu Beginn der Accupro-10-Therapie sowie bei Patienten mit Salz- und/ oder Flüssigkeitsmangel (z. B. bei Erbrechen, Durchfall, Vorbehandlung mit harntreibenden Arzneimitteln), Herzleistungsschwäche oder schwerem Bluthochdruck, aber auch bei Erhöhung der Dosierung von Accupro 10 und/ oder Diuretika kann eine übermäßige Blutdrucksenkung mit Beschwerden wie Schwindel, Schwächegefühl, Sehstörungen, gelegentlich auch mit Bewusstseinsverlust auftreten.</p> <p>Gelegentlich: Erweiterung von Blutgefäßen, kurzfristige Mangeldurchblutung des Gehirns</p> <p>Nicht bekannt: Schwindel beim Aufstehen vom Sitzen oder Liegen</p> <p> <u>Erkrankungen des Gastrointestinaltrakts (Verdauungssystems)</u> </p> <p>Häufig: Übelkeit, Erbrechen, Durchfall, (Ober-)Bauchschmerzen, Sodbrennen, Entzündung des Rachenraums, Verdauungsstörungen</p> <p>Gelegentlich: Mundtrockenheit, trockener Hals, Blähungen, Bauchspeicheldrüsenentzündung (in einigen Fällen mit tödlichem Ausgang), Verstopfung, Appetitlosigkeit</p> <p>Selten: Geschmacksveränderungen, entzündliche Veränderung der Zungenschleimhaut</p> <p>Sehr selten:<i> </i>Darmverschluss, Schwellungen im Darmkanal</p> <p> <u>Erkrankungen des Blutes und des Lymphsystems</u> </p> <p>Gelegentlich: Veränderung der Blutplättchenzahl</p> <p>Nicht bekannt: krankhafte Verringerung oder Veränderung der Blutzellenzahl <i>(Neutropenie, hämolytische Anämie, Thrombozytopenie)</i>, vollständiger Verlust bestimmter Blutzellen (<i>Agranulozytose</i>)</p> <p> <u>Psychiatrische Erkrankungen/ Erkrankungen des Nervensystems</u> </p> <p>Häufig: Kopfschmerzen, Benommenheit, Erschöpfung, Schlaflosigkeit, Taubheits- und Kältegefühl an den Gliedmaßen, Müdigkeit, Schwindel</p> <p>Gelegentlich: Depressionen, Nervosität, Schläfrigkeit, Schlafstörungen, Kribbeln, Gleichgewichtsstörungen, Verwirrtheit, vorübergehender Geschmacksverlust</p> <p>Selten: Bewusstseinsverlust</p> <p> <u>Erkrankungen der Haut und des Unterhautzellgewebes</u> </p> <p>Häufig: allergische Hautreaktionen wie Hautausschlag</p> <p>Gelegentlich: Haarausfall, vermehrte Schweißbildung, Blasensucht, Juckreiz, Hautausschlag, Wasseransammlungen in den Lippen, Gesicht und/ oder den Extremitäten (sehr selten mit Beteiligung von Kehlkopf, Rachen und/ oder Zunge), Nesselsucht, Lichtempfindlichkeit</p> <p>Selten: schwerwiegende Hautreaktionen <i>(Erythema multiforme)</i> </p> <p>Sehr selten: schwerwiegende Hautreaktionen (wie psoriasiforme Hautveränderungen), Gesichtsrötung, Schwitzen, Nagelablösung, Zunahme der Gefäßkrämpfe bei Raynaud-Krankheit</p> <p>Nicht bekannt: schwerwiegende Hautreaktionen <i>(Stevens-Johnson-Syndrom, exfoliative Dermatitis, epidermale Nekrolyse)</i> </p> <p> <u>Erkrankungen der Nieren und Harnwege</u> </p> <p>Häufig: Nierenfunktionsstörungen</p> <p>Gelegentlich: Harnwegsinfektionen, vermehrte Eiweißausscheidung im Urin (teilweise mit gleichzeitiger Verschlechterung der Nierenfunktion)</p> <p>Sehr selten: akutes Nierenversagen</p> <p> <u>Erkrankungen der Geschlechtsorgane und der Brustdrüse</u> </p> <p>Gelegentlich: Impotenz</p> <p>Selten: erektile Dysfunktion</p> <p> <u>Augenerkrankungen</u> </p> <p>Gelegentlich: Schwachsichtigkeit</p> <p>Sehr selten: verschwommenes Sehen</p> <p> <u>Erkrankungen des Ohrs und des Labyrinths</u> </p> <p>Gelegentlich: Ohrgeräusche (<i>Tinnitus</i>), Schwindel</p> <p> <u>Skelettmuskulatur-, Bindegewebs- und Knochenerkrankungen</u> </p> <p>Häufig: Rückenschmerzen, Muskelschmerzen</p> <p> <u>Erkrankungen der Atemwege, des Brustraums und Mediastinums</u> </p> <p>Häufig: Husten, trockener Reizhusten, Atemnot, Schnupfen</p> <p>Gelegentlich: Nasennebenhöhlenentzündung, obere Atemwegsinfektionen, Entzündung der Bronchien, Lungenentzündung</p> <p>Selten: Durst</p> <p>Nicht bekannt: krampfartige Verengung der Bronchien mit daraus folgender Atemnot</p> <p>In Einzelfällen kam es bei Wasseransammlung im Gesichtsbereich zur Verlegung der Atemwege mit tödlichem Ausgang.</p> <p> <u>Leber- und Gallenerkrankungen</u> </p> <p>Gelegentlich: Leberentzündung</p> <p>Sehr selten: Gelbsucht durch Gallestau oder Leberfunktionsstörungen</p> <p> <u>Untersuchungen</u> </p> <p>Häufig<i>:</i> bestimmte Blutbildveränderungen (<i>Abfall von Hämoglobinkonzentration, Hämatokrit, Leukozytenzahl, Thrombozytenzahl sowie, insbesondere bei Patienten mit Nierenfunktionsstörungen, Anstieg der Serumkonzentrationen von Harnstoff oder Kreatinin [bei Begleittherapie mit Diuretika häufiger als unter Monotherapie mit Quinapril; häufig reversibel bei fortgesetzter Therapie], Kalium, Abfall der Natriumkonzentration im Serum</i>)</p> <p>Gelegentlich: bestimmte Blutbildveränderungen <i>(Insbesondere bei Patienten mit eingeschränkter Nierenfunktion, Kollagenkrankheiten [Kollagenosen] oder gleichzeitiger Therapie mit Allopurinol, Procainamid oder bestimmten Arzneimitteln, die die Abwehrreaktionen unterdrücken, kann es zu Anämie, Eosinophilie, selten sogar zu Panzytopenie kommen.)</i> </p> <p>Sehr selten: bestimmte Blutbildveränderungen <i>(Hämolyse, Erhöhung der Bilirubin- und Leberenzymkonzentrationen)</i> </p> <p>Nicht bekannt: bestimmte Blutbildveränderungen <i>(hämolytische Anämie im Zusammenhang mit G-6-PDH-Mangel)</i> </p> <p> <i>Bei Patienten mit Diabetes mellitus wurde ein Anstieg des Serumkaliums beobachtet. Im Urin kann eine vermehrte Eiweißausscheidung auftreten.</i> </p> <p> <u>Stoffwechsel- und Ernährungsstörungen</u> </p> <p>Häufig: erhöhte Kaliumkonzentrationen im Blut</p> <p> <i> <u>Hinweise:</u> </i> </p> <p> <i>Die o. g. Laborwerte sollen vor und regelmäßig während der Behandlung mit Accupro 10 kontrolliert werden.</i> </p> <p> <i>Sollten im Verlauf einer Accupro-10-Therapie Symptome wie Fieber, Lymphknotenschwellungen und/ oder Halsentzündungen auftreten, muss vom behandelnden Arzt umgehend das weiße Blutbild untersucht werden.</i> </p> <p> <b>Meldung von Nebenwirkungen</b> </p> <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren Arzt, Apotheker oder das medizinische Fachpersonal. Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage angegeben sind. Sie können Nebenwirkungen auch direkt dem Bundesinstitut für Arzneimittel und Medizinprodukte, Abt. Pharmakovigilanz, Kurt-Georg-Kiesinger-Allee 3, D-53175 Bonn, Website: www.bfarm.de anzeigen. Indem Sie Nebenwirkungen melden, können Sie dazu beitragen, dass mehr Informationen über die Sicherheit dieses Arzneimittels zur Verfügung gestellt werden.</p> ');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (6,0,1,7,'<h4>Wie ist Accupro 10 aufzubewahren?</h4> <p>Bewahren Sie dieses Arzneimittel für Kinder unzugänglich auf.</p> <p>Sie dürfen dieses Arzneimittel nach dem auf dem Umkarton bzw. dem Behältnis nach „Verwendbar bis“ angegebenen Verfalldatum nicht mehr verwenden. Das Verfalldatum bezieht sich auf den letzten Tag des angegebenen Monats.</p> <p>Entsorgen Sie Arzneimittel nicht im Abwasser oder Haushaltsabfall. Fragen Sie Ihren Apotheker, wie das Arzneimittel zu entsorgen ist, wenn Sie es nicht mehr verwenden. Sie tragen damit zum Schutz der Umwelt bei.</p> <p> <b>Aufbewahrungsbedingungen</b> </p> <p>Nicht über 25 ºC aufbewahren.</p>');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (7,0,1,3,'<h4>Was sollten Sie vor der Einnahme von Accupro 10 beachten?</h4> <p> <b>2.1 Accupro 10 darf <u>nicht eingenommen</u> werden:</b> <i>(Gegenanzeigen)</i> </p> <ul> <li> <p>wenn Sie allergisch (überempfindlich) gegen Quinaprilhydrochlorid oder einen der in Abschnitt 6 genannten sonstigen Bestandteile dieses Arzneimittels sind</p> </li> <li> <p>wenn Sie zu Gewebeschwellung neigen <i>(angioneurotisches Ödem oder sonstiges Angioödem, auch infolge einer früheren ACE-Hemmer-Therapie)</i> </p> </li> <li> <p>wenn Sie eine Nierenarterienverengung haben <i>(beidseitig bzw. einseitig bei Einzelniere)</i> </p> </li> <li> <p>wenn bei Ihnen eine Nierentransplantation durchgeführt wurde</p> </li> <li> <p>wenn Sie Veränderungen an der linken Herzkammer <i>(Aorten- oder Mitralklappenstenose)</i> bzw. andere Ausflussbehinderungen der linken Herzkammer haben <i>(z. B. hypertrophe Kardiomyopathie)</i> </p> </li> <li> <p>wenn bei Ihnen durch eine Überfunktion der Nebenniere das Hormon Aldosteron im Blut erhöht ist <i>(primärer Hyperaldosteronismus)</i> </p> </li> <li> <p>wenn Sie Diabetes mellitus oder eine eingeschränkte Nierenfunktion haben und mit einem blutdrucksenkenden Arzneimittel, das Aliskiren enthält, behandelt werden</p> </li> <li> <p>wenn Sie schwanger sind <i>(vorheriger Ausschluss sowie Verhütung des Eintritts einer Schwangerschaft)</i> </p> </li> <li> <p>wenn Sie stillen (abstillen!)</p> </li> </ul> <p>Sprechen Sie mit Ihrem Arzt, wenn einer der oben aufgeführten Punkte auf Sie zutrifft, da Sie dann Accupro 10 nicht einnehmen dürfen.</p> <p> <u>Hinweis für Dialysepatienten</u> </p> <p>Während der Behandlung mit Accupro 10 darf keine Blutwäsche <i>(Dialyse oder Hämofiltration)</i> mit speziellen Membranen <i>(Poly[acrylonitril,natrium-2-methylallylsulfonat]-high-flux-Membranen, z. B. „AN 69“)</i> erfolgen, da im Rahmen einer Dialysebehandlung oder Hämofiltration die Gefahr besteht, dass Überempfindlichkeitsreaktionen <i>(anaphylaktoide Reaktionen)</i> bis hin zum lebensbedrohlichen Schock auftreten können.</p> <p>Im Falle einer notfallmäßigen Dialyse oder Hämofiltration muss deshalb vorher auf ein anderes Arzneimittel gegen Bluthochdruck <i>(Hypertonie)</i> bzw. Herzleistungsschwäche <i>(Herzinsuffizienz)</i>, das kein ACE-Hemmer sein darf, umgestellt oder eine andere Dialysemembran verwendet werden.</p> <p>Teilen Sie Ihren behandelnden Ärzten mit, dass Sie mit Accupro 10 behandelt werden bzw. Dialyse benötigen, damit die Ärzte dies bei der Behandlung berücksichtigen können.</p> <p> <i> <u>Patienten mit einer LDL-Apherese-Behandlung</u> </i> </p> <p> <i>Während einer LDL(low-density lipoprotein)-Apherese (bei schwerer Hypercholesterinämie) mit Dextransulfat können unter der Anwendung eines ACE-Hemmers lebensbedrohliche Überempfindlichkeitsreaktionen auftreten.</i> </p> <p> <u>Hinweis für Patienten mit einer Hyposensibilisierungstherapie (gegen Insektengift)</u> </p> <p>Während einer Behandlung zur Schwächung bzw. Aufhebung der allergischen Reaktionsbereitschaft <i>(Hyposensibilisierungstherapie)</i> gegen Insektengifte (z. B. Bienen-, Wespenstich) und gleichzeitiger Anwendung eines ACE-Hemmers können z. T. lebensbedrohliche Überempfindlichkeitsreaktionen (z. B. Blutdruckabfall, Atemnot, Erbrechen, allergische Hautreaktionen) auftreten.</p> <p> <i>Falls eine LDL-Apherese bzw. Hyposensibilisierungstherapie gegen Insektengifte notwendig ist, ist das Präparat vorübergehend durch andere Arzneimittel zur Senkung des Bluthochdrucks und zur Behandlung der Herzleistungsschwäche zu ersetzen (siehe folgender Abschnitt).</i> </p> <p> <b>2.2 Warnhinweise und Vorsichtsmaßnahmen</b> </p> <p>Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, bevor Sie Accupro 10 einnehmen.</p> <ul> <li> <p>wenn Sie eines der folgenden Arzneimittel zur Behandlung von hohem Blutdruck einnehmen:</p> <ul> <li> <p>einen Angiotensin-II-Rezeptor-Antagonisten (diese werden auch als Sartane bezeichnet – z. B. Valsartan, Telmisartan, Irbesartan), insbesondere wenn Sie Nierenprobleme aufgrund von Diabetes mellitus haben.</p> </li> <li> <p>Aliskiren.</p> </li> </ul> </li> </ul> <p>Ihr Arzt wird gegebenenfalls Ihre Nierenfunktion, Ihren Blutdruck und die Elektrolytwerte (z. B. Kalium) in Ihrem Blut in regelmäßigen Abständen überprüfen.</p> <p>Siehe auch Abschnitt„Accupro 10 darf nicht eingenommen werden“.</p> <p>Da keine ausreichenden Therapieerfahrungen vorliegen, darf Accupro 10 nicht angewendet werden bei:</p> <ul> <li> <p>sehr schweren Nierenfunktionsstörungen <i>(Kreatinin-Clearance &lt; 10 ml/min)</i> </p> </li> <li> <p>Dialysepatienten</p> </li> <li> <p>primärer Lebererkrankung oder Leberfunktionsstörungen</p> </li> </ul> <p>Teilen Sie Ihrem Arzt mit, wenn Sie vermuten schwanger zu sein (<u>oder schwanger werden könnten</u>).</p> <p> <u>Kinder und Jugendliche</u> </p> <p>Aus klinischen Studien liegen derzeit nur begrenzte Erfahrungen vor, sodass keine Dosierungsempfehlungen gemacht werden können.</p> <p> <i> <u>Hinweis</u> </i> </p> <p> <i>Vor Anwendung von Accupro 10 muss die Nierenfunktion überprüft worden sein.</i> </p> <p> <i>Insbesondere zu Therapiebeginn und bei Risikopatienten sollte Accupro 10 nur unter intensiver Überwachung von Blutdruck und/ oder bestimmten Laborwerten angewendet werden.</i> </p> <p> <i>Serumelektrolyte, Serumkreatinin und Blutzucker sowie Blutbild sind engmaschig zu kontrollieren.</i> </p> <p> <i>Accupro 10 darf nur nach sehr kritischer Nutzen-Risiko-Abwägung unter regelmäßiger Kontrolle von bestimmten klinischen Befunden und Laborwerten angewendet werden bei:</i> </p> <ul> <li> <p> <i>schweren Nierenfunktionsstörungen (Kreatinin-Clearance zwischen 10 und 30 ml/min)</i> </p> </li> <li> <p> <i>vermehrter Eiweißausscheidung im Urin (&gt; 1 g/Tag)</i> </p> </li> <li> <p> <i>schweren Elektrolytstörungen</i> </p> </li> <li> <p> <i>gestörter Immunreaktion oder Kollagenosen (z. B. Lupus erythematodes, Sklerodermie)</i> </p> </li> <li> <p> <i>gleichzeitiger Therapie mit Arzneimitteln, die die Abwehrreaktionen unterdrücken (z. B. Kortikoide, Zytostatika, Antimetaboliten), Allopurinol, Procainamid, Lithium, Digitalisglykosiden oder Laxanzien</i> </p> </li> <li> <p> <i>Patienten mit Salz- und/ oder Flüssigkeitsmangel</i> </p> </li> <li> <p> <i>Patienten mit eingeschränkter Nierenfunktion</i> </p> </li> <li> <p> <i>Patienten mit Bluthochdruck</i> </p> </li> <li> <p> <i>Patienten &gt; 65 Jahre (bei Patienten &gt; 65 Jahre sollte die Nierenfunktion überprüft und gegebenenfalls die Dosis reduziert werden)</i> </p> </li> <li> <p> <i>Patienten mit Herzleistungsschwäche (kardiogener Schock)</i> </p> </li> </ul> <p> <i>Bei Patienten mit oder ohne Allergie oder Bronchialasthma in der Krankengeschichte können Überempfindlichkeitsreaktionen auftreten, wie z. B. Hautblutungen (Purpura), Lichtempfindlichkeit, Nesselfieber (Urtikaria), Blutgefäßentzündung (nekrotisierende Angiitis), Atemnot einschließlich Lungenentzündung (Pneumonitis) und Lungenödem, anaphylaktische Reaktionen.</i> </p> <p> <i>Accupro 10 nicht zusammen mit Poly(acrylonitril,natrium-2-methylallylsulfonat)-high-flux-Membranen (z. B. „AN 69“), während einer LDL-Apherese mit Dextransulfat oder während einer Hyposensibilisierungsbehandlung gegen Insektengifte anwenden (siehe auch „Accupro 10 darf nicht eingenommen werden“).</i> </p> <p> <i>Patienten, die zu therapeutischen Zwecken gleichzeitig einen mTOR(mammalian Target of Rapamycin)-Hemmer (z. B. Temsirolimus) oder DPP-4(Dipeptidyl-Peptidase-4)-Hemmer (z. B. Vildagliptin) erhalten, haben möglicherweise ein erhöhtes Risiko für angioneurotische Ödeme. Besondere Vorsicht ist geboten, wenn bei Patienten, die schon einen ACE-Hemmer erhalten, eine Therapie mit einem mTOR-Hemmer oder DPP-4-Hemmer begonnen wird.</i> </p> <p> <i>Bei Patienten mit Herzschwäche kann während der Behandlung der Blutdruck massiv abfallen. Bei diesen Patienten kann die Therapie mit Quinapril zudem eine verminderte Urinausscheidung, einen erhöhten Gehalt an harnpflichtigen Substanzen im Blut, Nierenversagen und/oder den Tod zur Folge haben. Darum müssen diese Patienten sehr engmaschig vom behandelnden Arzt überwacht werden.</i> </p> <p> <b>2.3 Einnahme von Accupro 10 zusammen mit anderen Arzneimitteln</b> <br/>(<i>Wechselwirkungen</i>)</p> <p> <b>Informieren Sie Ihren Arzt oder Apotheker, wenn Sie andere Arzneimittel anwenden, kürzlich andere Arzneimittel angewendet haben oder beabsichtigen, andere Arzneimittel anzuwenden.</b> </p> <p>Bei der Verwendung von Accupro 10 sind Wechselwirkungen mit folgenden Wirkstoffen anderer Arzneimittel möglich (die Wirkstoffbezeichnungen finden Sie auf der Packung und der Packungsbeilage Ihrer Medikamente).</p> <p>Die Wirkung von Accupro 10 wird verstärkt durch:</p> <ul> <li> <p>andere blutdrucksenkende Arzneimittel, insbesondere durch harntreibende Arzneimittel <i>(Diuretika)</i> </p> </li> <li> <p>Schlafmittel, Betäubungsmittel (Information des Narkosearztes bezüglich der Accupro-10-Therapie!). Weiterhin kann es vermehrt zu Schwindelgefühlen beim Aufstehen vom Sitzen oder Liegen kommen</p> </li> <li> <p>Neuroleptika (bei Psychosen), Imipramin (bei Depression)</p> </li> </ul> <p>Die Wirkung von Accupro 10 wird abgeschwächt durch:</p> <ul> <li> <p>Arzneimittel gegen Schmerzen und Entzündungen (z. B. Acetylsalicylsäure, Indometacin, nichtsteroidale Antirheumatika [NSAR] einschließlich COX-2-Hemmer); NSAR können zusammen mit Accupro 10 verstärkt die Nierenfunktion beeinträchtigen und eine additive Zunahme der Serumkaliumkonzentration bewirken.</p> </li> </ul> <p>Arzneimittel, die das Serumkalium erhöhen: Die gleichzeitige Behandlung mit kaliumsparenden harntreibenden Arzneimitteln (z. B. Spironolacton, Amilorid, Triamteren), Kaliumsalzen oder anderen Arzneimitteln, die den Serumkaliumspiegel erhöhen, sollte mit Vorsicht erfolgen und die Serumkaliumkonzentration engmaschig überwacht werden.</p> <p> <i>Die gleichzeitige Verabreichung von Accupro 10 mit Arzneimitteln, die das Antibiotikum Trimethoprim enthalten, sollte bei älteren Patienten und bei Patienten mit eingeschränkter Nierenfunktion mit Vorsicht erfolgen, da es zu einer Erhöhung des Kaliumwertes im Blut kommen kann. Der Serumkaliumspiegel sollte daher regelmäßig kontrolliert werden!</i> </p> <p>Lithium (bei Depression): Erhöhung der Serumlithiumkonzentration (regelmäßige Kontrolle), somit Verstärkung der herz- und nervenschädigenden Wirkung von Lithium</p> <p>Allopurinol (bei erhöhtem Harnsäurespiegel im Blut): Abnahme der weißen Blutzellen <i>(Leukopenie)</i> </p> <p>Arzneimittel, die die Abwehrreaktion unterdrücken (Zytostatika, Immunsuppressiva, systemische Kortikoide): Abnahme der weißen Blutzellen <i>(Leukopenie)</i> </p> <p>Procainamid (bei Herzrhythmusstörungen): Abnahme der weißen Blutzellen <i>(Leukopenie)</i> </p> <p>Blutzuckersenkende Arzneimittel zum Einnehmen (z. B. Sulfonylharnstoffe/Biguanide), Insulin: Verstärkung des blutzuckersenkenden Effekts durch Accupro 10. Während des 1. Behandlungsmonats mit Accupro 10 sollten Sie daher Ihren Blutzuckerspiegel genau kontrollieren.</p> <p>Tetracycline (Antibiotika) und andere Wirkstoffe, die mit Magnesium reagieren: verminderte Aufnahme in den Körper</p> <p>Goldhaltige Arzneimittel (z. B. bei Rheuma): Hier sind z. B. Erweiterungen der Blutgefäße <i>(nitroide Reaktionen) </i>möglich.</p> <p>Bestimmte Schlaf- oder Beruhigungsmittel (Barbiturate): Es kann vermehrt zu Schwindelgefühlen beim Aufstehen vom Sitzen oder Liegen kommen.</p> <p>Arzneimittel gegen Übersäuerung des Magens (Antazida): verminderte Aufnahme von Quinapril in den Körper.</p> <p>mTOR-Hemmer (z. B. Temsirolimus) oder DPP-4-Hemmer (z. B. Vildagliptin): eventuell erhöhtes Risiko für angioneurotische Ödeme. Besondere Vorsicht ist geboten, wenn Sie schon einen ACE-Hemmer (z. B. Accupro 10) erhalten und eine Therapie mit einem mTOR-Hemmer oder DPP-4-Hemmer begonnen wird.</p> <p>Ihr Arzt muss unter Umständen Ihre Dosierung anpassen und/oder sonstige Vorsichtsmaßnahmen treffen:</p> <p>wenn Sie einen Angiotensin-II-Rezeptor-Antagonisten oder Aliskiren einnehmen (siehe auch Abschnitte „Accupro 10 darf nicht eingenommen werden“<i> </i>und<i> </i>„Warnhinweise und Vorsichtsmaßnahmen“).</p> <p> <b>Einnahme von Accupro 10 zusammen mit Nahrungsmitteln, Getränken und Alkohol</b> </p> <ul> <li> <p>Kochsalz kann die blutdrucksenkende Wirkung von Accupro 10 verringern. Sprechen Sie mit Ihrem Arzt, ob eine kochsalzarme Kost für Sie notwendig ist.</p> </li> <li> <p>Meiden Sie Alkohol, da Accupro 10 die Wirkung von Alkohol verstärkt und es vermehrt zu Schwindelgefühlen beim Aufstehen vom Sitzen oder Liegen kommen kann.</p> </li> </ul> <p> <b>2.4 Schwangerschaft, Stillzeit und Zeugungsfähigkeit</b> </p> <p>Wenn Sie schwanger sind oder stillen oder wenn Sie vermuten, schwanger zu sein, oder beabsichtigen, schwanger zu werden, fragen Sie vor der Einnahme dieses Arzneimittels Ihren Arzt oder Apotheker um Rat.</p> <p> <u>Schwangerschaft</u> </p> <p>Teilen Sie Ihrem Arzt mit, wenn Sie vermuten, schwanger zu sein (<u>oder schwanger werden könnten</u>). Ihr Arzt wird Ihnen empfehlen, Accupro 10 vor einer Schwangerschaft bzw. sobald Sie wissen, dass Sie schwanger sind, abzusetzen, und er wird Ihnen ein anderes Arzneimittel empfehlen, denn die Einnahme von Accupro 10 kann zu schweren Schädigungen Ihres ungeborenen Kindes führen<i>.</i> </p> <p> <u>Stillzeit</u> </p> <p>Teilen Sie Ihrem Arzt mit, wenn Sie stillen oder mit dem Stillen beginnen wollen. Das Stillen von Neugeborenen (in den ersten Wochen nach der Geburt) und besonders von Frühgeburten wird nicht empfohlen, wenn Sie Accupro 10 einnehmen. </p> <p> <b>2.5 Verkehrstüchtigkeit und Fähigkeit zum Bedienen von Maschinen</b> </p> <p>Die Fähigkeit zur aktiven Teilnahme am Straßenverkehr oder zum Bedienen von Maschinen kann beeinträchtigt werden. Dies gilt in verstärktem Maße bei Behandlungsbeginn, Dosiserhöhung und beim Wechsel des Arzneimittels sowie im Zusammenwirken mit Alkohol.</p> <p> <b>Dieses Arzneimittel enthält Milchzucker (Lactose)</b> </p> <p>Bitte nehmen Sie Accupro 10 daher erst nach Rücksprache mit Ihrem Arzt ein, wenn Ihnen bekannt ist, dass Sie an einer Unverträglichkeit gegenüber bestimmten Zuckern leiden.</p>');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (8,0,1,9,'Beispieltext');

INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (9,0,2,2,'Beispieltext für Allgemeine Hinweise');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (10,0,2,8,'Beispieltext für Zusatzinformationen');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (11,0,2,6,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (12,0,2,3,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (13,0,2,7,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (14,0,2,4,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (15,0,2,5,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (16,0,2,1,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (17,0,2,9,'Beispieltext');

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (18,0,'<h4>Was ist Beloc-Zok comp und wofür wird es angewendet?</h4> <p>Beloc-Zok comp ist eine Kombination aus einem Betablocker und einem Diuretikum, die beide auf unterschiedlichem Wege Ihren Blutdruck senken.</p> <p>Beloc-Zok comp wird angewendet bei nicht organbedingtem Bluthochdruck (essenzielle Hypertonie). Das Kombinationspräparat Beloc-Zok comp darf nur angewendet werden, wenn eine vorangegangene Therapie mit einem der Einzelwirkstoffe (retardiertes Metoprololsuccinat oder Hydrochlorothiazid) keine ausreichende Blutdrucknormalisierung bewirken konnte.</p> ',3,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (19,0,'<h4>Inhalt der Packung und weitere Informationen</h4> <p> <b>Was Beloc-Zok comp enthält</b> </p> <ul> <li> <p>Die Wirkstoffe sind Metoprololsuccinat (Ph.Eur.) und Hydrochlorothiazid. </p> </li> </ul> <p>1 Retardtablette enthält 95,0 mg Metoprololsuccinat und 12,5 mg Hydrochlorothiazid.</p> <ul> <li> <p>Die sonstigen Bestandteile sind hochdisperses Siliciumdioxid; Ethylcellulose; Hyprolose; mikrokristalline Cellulose; Maisstärke; Povidon K 25; Octadecylhydrogenfumarat, Natriumsalz; Hypromellose; Macrogol 6000; Hartparaffin. Farbstoffe: Titandioxid (E 171), Eisenoxide und -hydroxide (E 172).</p> </li> </ul> <p> <b>Wie Beloc-Zok comp aussieht und Inhalt der Packung</b> </p> <p>Die Retardtabletten sind gelblich, rund und bikonvex, haben einen Durchmesser von 10 mm mit einer Bruchkerbe auf der einen und der Prägung „A“ und „IL“ auf der anderen Seite. Die Bruchkerbe dient nur zum Teilen der Tablette, wenn Sie Schwierigkeiten haben, diese im Ganzen zu schlucken.</p> <p>Beloc-Zok comp ist in Packungen zu 30, 50 und 100 Retardtabletten erhältlich.</p> <p> <b>Pharmazeutischer Unternehmer und Hersteller</b> </p> <p> <b>Pharmazeutischer Unternehmer</b> </p> <p>PHARMACIA GmbH<br/>Linkstr. 10</p> <p>10785 Berlin</p> <p>Tel.: 030 550055-51000</p> <p>Fax: 030 550054-10000 </p> <p> <italic> </italic> <br/> <b>Hersteller </b> </p> <p>EXCELLA GmbH</p> <p>Nürnberger Str. 12</p> <p>90537 Feucht</p> <p> <b>Mitvertreiber</b> </p> <p>PFIZER PHARMA GmbH</p> <p>Linkstr. 10</p> <p>10785 Berlin</p> <p>Tel.: 030 550055-51000</p> <p>Fax: 030 550054-10000 </p> <p> <b>Diese Packungsbeilage wurde zuletzt überarbeitet im Januar 2015.</b> </p> <p>palde-5v14bz-rt-0</p>',3,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (20,0,'<h4>Lesen Sie die gesamte Packungsbeilage sorgfältig durch, bevor Sie mit der Einnahme dieses Arzneimittels beginnen, denn sie enthält wichtige Informationen.</h4> <ul> <li> <p>Heben Sie die Packungsbeilage auf. Vielleicht möchten Sie diese später nochmals lesen.</p> </li> <li> <p>Wenn Sie weitere Fragen haben, wenden Sie sich an Ihren Arzt oder Apotheker.</p> </li> <li> <p>Dieses Arzneimittel wurde Ihnen persönlich verschrieben. Geben Sie es nicht an Dritte weiter. Es kann anderen Menschen schaden, auch wenn diese die gleichen Beschwerden haben wie Sie.</p> </li> <li> <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren Arzt oder Apotheker oder das medizinische Fachpersonal. Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage angegeben sind. Siehe Abschnitt 4.</p> </li> </ul>',3,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (21,0,'<h4>Wie ist Beloc-Zok comp aufzubewahren?</h4> <p>Bewahren Sie dieses Arzneimittel für Kinder unzugänglich auf.</p> <p>Sie dürfen dieses Arzneimittel nach dem auf der Faltschachtel und Durchdrückpackung nach &quot;Verwendbar bis&quot; angegebenen Verfalldatum nicht mehr verwenden. Das Verfalldatum bezieht sich auf den letzten Tag des angegebenen Monats.</p> <p> <b>Aufbewahrungsbedingungen</b> </p> <p>Für dieses Arzneimittel sind keine besonderen Lagerungsbedingungen erforderlich.</p>',3,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (22,0,'<h4>Welche Nebenwirkungen sind möglich?</h4>´ <p>Wie alle Arzneimittel kann auch dieses Arzneimittel Nebenwirkungen haben, die aber nicht bei jedem auftreten müssen.</p> <p>Bei den Häufigkeitsangaben zu Nebenwirkungen werden folgende Kategorien zugrunde gelegt:</p> <table> <tbody> <tr> <td> <p>Sehr häufig: kann mehr als 1 von 10 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Häufig: kann bis zu 1 von 10 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Gelegentlich: kann bis zu 1 von 100 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Selten: kann bis zu 1 von 1.000 Behandelten betreffen</p> </td> </tr> <tr> <td> <p>Sehr selten: kann bis zu 1 von 10.000 Behandelten betreffen</p> <p>Nicht bekannt: Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</p> </td> </tr> </tbody> </table> <p> <i>Erkrankungen des Blutes und des Lymphsystems</i> </p> <p>Selten: Blutbildveränderungen in Form einer Verminderung der roten Blutkörperchen (aplastische Anämie), Verminderung der Blutplättchen (Thrombozytopenie) und Leukozyten im Blut (Leukopenie), hochgradige Verminderung bestimmter weißer Blutkörperchen mit Infektneigung und schweren Allgemeinsymptomen (Agranulozytose)</p> <p> <i>Erkrankungen des Immunsystems</i> </p> <p>Selten: allergische Hauterscheinungen, Überempfindlichkeit (Idiosynkrasie)</p> <p>Sehr selten: allergischer Schnupfen</p> <p> <i>Stoffwechsel- und Ernährungsstörungen</i> </p> <p>Häufig: Eine unerkannte Zuckerkrankheit (latenter Diabetes mellitus) kann erkennbar werden oder eine bereits bestehende Zuckerkrankheit sich verschlechtern (Symptome: erhöhter Zuckergehalt des Blutes [Hyperglykämie] oder im Urin [Glykosurie]). Unter der Therapie kann es zu Störungen im Fettstoffwechsel kommen: Bei meist normalem Gesamtcholesterin wurde eine Verminderung des HDL-Cholesterins und eine Erhöhung der Triglyzeride im Plasma beobachtet.</p> <p>Die Harnsäurewerte im Blut können sich erhöhen (Hyperurikämie); bei disponierten Patienten können Gichtanfälle ausgelöst werden. Die Anwendung von Beloc-Zok comp kann bei langfristiger, kontinuierlicher Einnahme zu Veränderungen im Mineralstoffwechsel (Elektrolytveränderungen) führen, insbesondere zu einer Erniedrigung der Blutspiegel von Kalium (Hypokaliämie), Magnesium (Hypomagnesiämie), Natrium (Hyponatriämie) und Chlorid (Hypochlorämie) sowie zu einem erhöhten Calciumspiegel (Hyperkalzämie). Als Folge der Elektrolyt- und Flüssigkeitsverluste kann sich ein Überschuss an Alkali im Blut (metabolische Alkalose) entwickeln bzw. eine bereits bestehende metabolische Alkalose verschlechtern.</p> <p>Selten: Nach längerem strengen Fasten oder schwerer körperlicher Belastung kann es bei gleichzeitiger Therapie mit Beloc-Zok comp zu Zuständen mit erniedrigtem Blutzucker (hypoglykämische Zustände) kommen. Warnzeichen eines erniedrigten Blutzuckers – insbesondere erhöhte Herzfrequenz (Tachykardie) und Zittern der Finger (Tremor) – können verschleiert werden.</p> <p> <i>Psychiatrische Erkrankungen</i> </p> <p>Gelegentlich: depressive Verstimmungszustände, Verwirrtheit, Halluzinationen</p> <p>Selten: Nervosität, Ängstlichkeit</p> <p>Sehr selten: Persönlichkeitsveränderungen (z. B. Gefühlsschwankungen)</p> <p> <i>Erkrankungen des Nervensystems</i> </p> <p>Sehr häufig: Erschöpfung</p> <p>Häufig: Benommenheit, Kopfschmerzen</p> <p>Gelegentlich: Insbesondere zu Beginn der Behandlung zentralnervöse Störungen wie Müdigkeit, Schwindelgefühl, Schlafstörungen, Schlaflosigkeit, verstärkte Traumaktivität, Albträume, Konzentrationsstörungen. Diese Erscheinungen sind gewöhnlich leichterer Art und vorübergehend. Kribbeln in den Gliedmaßen, Muskelkrämpfe.</p> <p>Selten: Muskelschwäche, Impotenz, Libido- und Potenzstörungen</p> <p>Sehr selten: Erinnerungslücken (Amnesie), Gedächtnisstörungen</p> <p> <i>Augenerkrankungen</i> </p> <p>Selten: Entzündung der Bindehaut des Auges (Konjunktivitis) und verminderter Tränenfluss (dies ist beim Tragen von Kontaktlinsen zu beachten); Augenreizung, geringgradige Sehstörungen (z. B. verschwommenes Sehen, Farbsehstörungen [Gelbsehen]) oder eine Verschlimmerung einer bestehenden Kurzsichtigkeit</p> <p>Sehr selten: Flimmern vor den Augen</p> <p>Häufigkeit nicht bekannt: plötzlich auftretende Kurzsichtigkeit (akute Myopie), akutes Engwinkelglaukom</p> <p> <i>Erkrankungen des Ohrs und des Labyrinths (Gleichgewichtssystem)</i> </p> <p>Sehr selten: Hörstörungen, Ohrensausen</p> <p> <i>Herzerkrankungen</i> </p> <p>Häufig: Herzklopfen (Palpitationen), verlangsamter Herzschlag (Bradykardie), Blutdruckabfall beim Aufsetzen (orthostatische Hypotonie, sehr selten mit Bewusstlosigkeit)</p> <p>Gelegentlich: Verstärkung einer Herzmuskelschwäche mit peripheren Ödemen (Flüssigkeitsansammlungen), bei einem akuten Herzinfarkt kann der Blutdruck stark erniedrigt sein (kardiogener Schock), Herzschmerzen</p> <p>Selten: Störungen der Erregungsleitung am Herzen (atrioventrikuläre Überleitungsstörungen), unregelmäßige Herzschlagfolge (Arrhythmien)</p> <p>Sehr selten: Verstärkung der Anfälle bei Angina pectoris</p> <p> <i>Gefäßerkrankungen</i> </p> <p>Häufig: Kältegefühl in den Gliedmaßen</p> <p>Selten: Gefäßentzündung (Vaskulitis)</p> <p>Sehr selten: Verstärkung (bis zum Absterben des Gewebes) bereits bestehender peripherer Durchblutungsstörungen</p> <p> <i>Erkrankungen der Atemwege und des Brustraums</i> </p> <p>Häufig: Atemnot bei Belastung (Belastungsdyspnoe)</p> <p>Gelegentlich: Infolge einer möglichen Erhöhung des Atemwiderstands kann es bei Patienten mit Neigung zu Verkrampfungen der Atemwege (bronchospastischen Reaktionen, z. B. bei asthmoider Bronchitis) insbesondere bei obstruktiven Atemwegserkrankungen zu einer Verengung der Atemwege und zu Atemnot kommen.</p> <p>Selten: Lungenentzündung (akute interstitielle Pneumonie)</p> <p>Sehr selten: Flüssigkeitsansammlung in der Lunge (allergisches Lungenödem) mit Schocksymptomatik</p> <p> <i>Erkrankungen des Gastrointestinaltrakts (Magen-Darm-System)</i> </p> <p>Häufig: Vorübergehend Magen-Darm-Beschwerden wie Übelkeit, Leibschmerzen, Durchfall, Verstopfung</p> <p>Gelegentlich: Erbrechen, Appetitlosigkeit, Krämpfe</p> <p>Selten: Mundtrockenheit; Entzündung der Bauchspeicheldrüse</p> <p> <i>Leber- und Gallenerkrankungen</i> </p> <p>Selten: Erhöhung der Leberwerte (Transaminasen GOT, GPT); Gelbsucht, Gallestau (intrahepatische Cholestase); akute Gallenblasenentzündung (bei bestehendem Gallensteinleiden)</p> <p>Sehr selten: Leberentzündung (Hepatitis)</p> <p> <i>Erkrankungen der Haut und des Unterhautzellgewebes</i> </p> <p>Gelegentlich: Hautreaktionen wie Rötung und Juckreiz sowie Hautausschläge (meist psoriasiforme und dystrophische Hautläsionen), Schwitzen, stark juckende Quaddeln (Urtikaria), Lichtempfindlichkeit mit Auftreten von Hautausschlägen nach Lichteinwirkung.</p> <p>Selten: kleinflächige Einblutungen in der Haut und Schleimhaut (Purpura), Haarausfall, Blutgefäßentzündung (nekrotisierende Angiitis)</p> <p>Sehr selten: Arzneimittel, die Betarezeptorenblocker enthalten, können in Einzelfällen eine Schuppenflechte (Psoriasis vulgaris) auslösen, die Symptome dieser Erkrankung verschlechtern oder zu Schuppenflechte-ähnlichen (psoriasiformen) Hautausschlägen führen; Schmetterlingsflechte (kutaner Lupus erythematodes)</p> <p>Nicht bekannt: chronisch-entzündliche Bindegewebserkrankung (systemischer Lupus erythematodes)</p> <p> <i>Skelettmuskulatur-, Bindegewebs- und Knochenerkrankungen</i> </p> <p>Sehr selten: Bei Langzeittherapie wurde in Einzelfällen eine Erkrankung der Gelenke (Arthropathie) und/ oder Arthralgie (Gelenkschmerzen) beobachtet, wobei ein oder mehrere Gelenke betroffen sein können (Mono- und Polyarthritis).</p> <p> <i>Erkrankungen der Nieren und Harnwege</i> </p> <p>Selten: akute Nierenentzündung (interstitielle Nephritis)</p> <p> <i>Erkrankungen der Geschlechtsorgane und der Brustdrüse</i> </p> <p>Sehr selten: Verhärtung der Schwellkörper des männlichen Gliedes (Induratio penis plastica, Peyronie-Krankheit)</p> <p> <i>Allgemeine Erkrankungen und Beschwerden am Verabreichungsort</i> </p> <p>Gelegentlich: Gewichtszunahme</p> <p>Selten: Arzneimittelfieber. Bei hoher Dosierung kann es, insbesondere bei Vorliegen von Venenerkrankungen, zum Verschluss von Blutgefäßen durch Blutgerinnsel (Thrombosen und Embolien) kommen.</p> <p>Sehr selten: Geschmacksstörungen</p> <p> <i>Untersuchungen</i> </p> <p>Gelegentlich: reversibler Anstieg stickstoffhaltiger, harnpflichtiger Stoffe (Harnstoff, Kreatinin) im Blut, vor allem zu Behandlungsbeginn.</p> <p>Selten: Erhöhung der Blutfettwerte</p> <p>Eine Verstärkung der Beschwerden bei Patienten mit intermittierendem Hinken (Claudicatio intermittens) oder mit Gefäßkrämpfen im Bereich der Zehen und Finger (Raynaud-Syndrom) ist beobachtet worden.</p> <p>Die Symptome einer schweren Schilddrüsenüberfunktion (Thyreotoxikose) können verdeckt werden.</p> <p>Sollten bei Ihnen Nebenwirkungen aufgetreten sein, wird Ihr Arzt Ihnen eventuelle Gegenmaßnahmen empfehlen oder gegebenenfalls die Behandlung abbrechen.</p> <p> <b>Meldung von Nebenwirkungen</b> </p> <p>Wenn Sie Nebenwirkungen bemerken, wenden Sie sich an Ihren Arzt, Apotheker oder das medizinische Fachpersonal. Dies gilt auch für Nebenwirkungen, die nicht in dieser Packungsbeilage angegeben sind. Sie können Nebenwirkungen auch direkt dem Bundesinstitut für Arzneimittel und Medizinprodukte, Abt. Pharmakovigilanz, Kurt-Georg-Kiesinger-Allee 3, D-53175 Bonn, Website: www.bfarm.de anzeigen. Indem Sie Nebenwirkungen melden, können Sie dazu beitragen, dass mehr Informationen über die Sicherheit dieses Arzneimittels zur Verfügung gestellt werden.</p> ',3,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (23,0,'<h4>Wie ist Beloc-Zok comp aufzubewahren?</h4> <p>Bewahren Sie dieses Arzneimittel für Kinder unzugänglich auf.</p> <p>Sie dürfen dieses Arzneimittel nach dem auf der Faltschachtel und Durchdrückpackung nach „Verwendbar bis“ angegebenen Verfalldatum nicht mehr verwenden. Das Verfalldatum bezieht sich auf den letzten Tag des angegebenen Monats.</p> <p> <b>Aufbewahrungsbedingungen</b> </p> <p>Für dieses Arzneimittel sind keine besonderen Lagerungsbedingungen erforderlich.</p>',3,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (24,0,'<h4>Was sollten Sie vor der Einnahme von Beloc-Zok comp beachten?</h4> <p> <bold>Beloc-Zok comp darf nicht eingenommen werden,</bold> </p> <ul> <li> <p>wenn Sie allergisch gegen Metoprololsuccinat und Hydrochlorothiazid, den Wirkstoffen von Beloc-Zok comp, verwandten Derivaten oder einen der in Abschnitt 6 genannten sonstigen Bestandteile dieses Arzneimittels sind,</p> </li> <li> <p>bei Erregungsleitungsstörungen von den Vorhöfen auf die Kammern (AV-Block 2. oder 3. Grades),</p> </li> <li> <p>bei Sinusknoten-Syndrom (sick sinus syndrome), es sei denn, Sie haben einen Herzschrittmacher,</p> </li> <li> <p>bei gestörter Erregungsleitung zwischen Sinusknoten und Vorhof (sinuatrialem Block),</p> </li> <li> <p>bei kardiogenem Schock,</p> </li> <li> <p>bei instabiler, dekompensierter Herzmuskelschwäche (Lungenödem, Minderdurchblutung, zu niedrigem Blutdruck),</p> </li> <li> <p>bei dauerhafter oder intermittierender inotroper Therapie mit Betarezeptor-Agonisten,</p> </li> <li> <p>bei einem Ruhepuls vor der Behandlung unter 50 Schlägen pro Minute (Bradykardie),</p> </li> <li> <p>bei krankhaft niedrigem Blutdruck (Hypotonie, systolisch unter 90 mmHg),</p> </li> <li> <p>bei Übersäuerung des Blutes (Azidose),</p> </li> <li> <p>bei Spätstadium peripherer arterieller Durchblutungsstörungen,</p> </li> <li> <p>bei Neigung zu Bronchialverkrampfung (bronchiale Hyperreagibilität),</p> </li> <li> <p>bei gleichzeitiger Gabe von MAO-Hemmstoffen (Ausnahme MAO-B-Hemmstoffe),</p> </li> <li> <p>bei Überempfindlichkeit gegenüber Sulfonamiden (mögliche Kreuzreaktionen beachten).</p> </li> <li> <p>Falls Ihnen bekannt ist, dass Sie auf Sulfonamide (Medikamente zur Behandlung von Infektionen durch Bakterien) überempfindlich reagieren, informieren Sie bitte Ihren Arzt.</p> </li> <li> <p>bei fortgeschrittener Leistungsminderung der Nieren (Niereninsuffizienz mit stark eingeschränkter Harnproduktion; Kreatinin-Clearance kleiner als 30 ml/min und/ oder Serum-Kreatinin über 1,8 mg/100 ml) und akuter Nierenentzündung (Glomerulonephritis),</p> </li> <li> <p>bei schweren Leberfunktionsstörungen (Leberversagen mit Bewusstseinsstörungen),</p> </li> <li> <p>bei erniedrigtem Kaliumspiegel, der auf eine Behandlung nicht anspricht (unter 3,5 mmol/l),</p> </li> <li> <p>bei erhöhtem Blut-Calciumspiegel (Hyperkalzämie),</p> </li> <li> <p>bei Gicht, bei bekannter Erhöhung von Harnsäure im Blut,</p> </li> <li> <p>bei schwerem Natriummangel im Blut (Hyponatriämie),</p> </li> <li> <p>bei verminderter zirkulierender Blutmenge (Hypovolämie),</p> </li> <li> <p>in der Schwangerschaft,</p> </li> <li> <p>in der Stillzeit.</p> </li> </ul>',3,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (25,0,'Beispieltext',3,9);

INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (26,0,4,6,'Beispieltext für Nebenwirkungen');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (27,0,4,3,'Beispieltext für Vorsichtsmaßnahmen und Warnhinweise');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (28,0,4,5,'Beispieltext für Anwendung und Dosierung');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (29,0,4,7,'Beispieltext für die Aufbewahrung');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (30,0,4,1,'Beispieltext für Anwenderhinweise');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (31,0,4,4,'Beispieltext für Indikationen');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (32,0,4,8,'Beispieltext für Zusatzinformationen');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (33,0,4,2,'Beispieltext für Allgemeine Hinweise');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic,text) VALUES (34,0,4,9,'Beispieltext');

INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (35,0,5,7,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (36,0,5,1,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (37,0,5,4,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (38,0,5,6,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (39,0,5,8,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (40,0,5,2,'Beispieltext für Allgemeine Hinweise');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (41,0,5,3,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (42,0,5,5,'Beispieltext');
INSERT INTO packaging_section (id, state, iddrug, idpackaging_topic, text) VALUES (43,0,5,9,'Beispieltext');

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (44,0,'Beispieltext',6,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (45,0,'Beispieltext',6,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (46,0,'Beispieltext',6,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (47,0,'Beispieltext',6,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (48,0,'Beispieltext',6,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (49,0,'Beispieltext',6,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (50,0,'Beispieltext für Allgemeine Hinweise',6,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (51,0,'Beispieltext',6,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (52,0,'Beispieltext',6,9);

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (53,0,'Beispieltext',7,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (54,0,'Beispieltext',7,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (55,0,'Beispieltext',7,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (56,0,'Beispieltext',7,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (57,0,'Beispieltext',7,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (58,0,'Beispieltext',7,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (59,0,'Beispieltext',7,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (60,0,'Beispieltext',7,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (61,0,'Beispieltext',7,9);

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (62,0,'Beispieltext',8,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (63,0,'Beispieltext',8,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (64,0,'Beispieltext',8,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (65,0,'Beispieltext',8,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (66,0,'Beispieltext',8,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (67,0,'Beispieltext',8,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (68,0,'Beispieltext',8,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (69,0,'Beispieltext',8,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (70,0,'Beispieltext',8,9);

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (71,0,'Beispieltext',9,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (72,0,'Beispieltext',9,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (73,0,'Beispieltext',9,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (74,0,'Beispieltext',9,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (75,0,'Beispieltext',9,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (76,0,'Beispieltext',9,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (77,0,'Beispieltext',9,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (78,0,'Beispieltext',9,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (79,0,'Beispieltext',9,9);

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (80,0,'Beispieltext',10,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (81,0,'Beispieltext',10,4);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (82,0,'Beispieltext',10,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (83,0,'Beispieltext',10,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (84,0,'Beispieltext',10,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (85,0,'Beispieltext',10,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (86,0,'Beispieltext',10,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (87,0,'Beispieltext',10,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (88,0,'Beispieltext',10,9);
--
--Metformin--
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (89,0,'Beispieltext1',11,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (90,0,'Beispieltext2',11,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (91,0,'
<!--Vor der Einnahme-->
<div class="row content_header xs-center">
    <h1>Warnhinweise und Vorsichtsmaßnahmen
    </h1>
    <hr>
</div>
<div>
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>


    Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, bevor Sie Amlodipin (besilat) Dexcel 5
    mg einnehmen.<br>
    Informieren Sie Ihren Arzt, wenn eine der folgenden Voraussetzungen auf Sie zutrifft oder
    einmal zutraf:
    <br><br>

    <div class="row">
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Probleme mit Ihrer Schilddrüse (Hypothyreose)</b><br> Ihr Arzt wird möglicherweise
                    Ihren Blutspiegel des Schilddrüse-stimulierenden Hormons (TSH) regelmäßig überwachen.
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Röntgen- oder anderen bildgebenden Untersuchung</b> <br>
                    Bei
                    der Ihnen ein jodhaltiges Kontrastmittel gespritzt wird
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Unterziehung einer <a class="info_words" type="button" data-toggle="modal"
                            data-target="#bei_einer_größeren_operation">größeren
                            operativen Eingriff</a></b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Vitamin-B12-Blutspiegel</b> <br>
                    Eine Langzeitbehandlung mit Metformin kann zu einer Abnahme des Vitamin-B12-Blutspiegels und
                    infolgedessen zu einer Erkrankung der Nerven führen (siehe <a href="#tab4" aria-controls="tab4"
                        role="tab" data-toggle="tab">Nebenwirkungen
                    </a>). Ihr Arzt wird möglicherweise Ihren Vitamin-B12-Spiegel regelmäßig überwachen.
                </div>
            </div>
        </div>
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Unterzuckerung</b> <br>
                    Metformin Lich allein verursacht keine Unterzuckerung (Hypoglykämie). <br>Wenn Sie jedoch
                    Metformin Lich zusammen mit anderen Arzneimitteln gegen Ihre Zuckerkrankheit einnehmen, die
                    Unterzuckerung hervorrufen können (wie Sulfonylharnstoffe, Insulin, Glinide), besteht ein Risiko
                    eines zu niedrigen Blutzuckerspiegels. <br>Wenn Anzeichen einer Unterzuckerung auftreten, wie
                    Schwächegefühl, Benommenheit, vermehrtes Schwitzen, beschleunigter Herzschlag, Sehstörungen
                    und Konzentrationsschwierigkeiten, hilft es normalerweise, wenn Sie etwas essen oder trinken, das
                    Zucker enthält.
                </div>
            </div>


        </div>
    </div>
</div>


<div class="panel-group" id="accordion" style="margin: 30 0 30 0;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseOne">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Metformin Lich zusammen mit
                anderen Medikamente
            </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in">
            <div class="panel-body">
                Falls Ihnen ein jodhaltiges Kontrastmittel in Ihr Blut gespritzt werden muss, zum Beispiel in
                Zusammenhang mit einer Röntgenaufnahme oder einer Computertomografie, müssen Sie die
                Einnahme von Metformin Lich vor bzw. zum Zeitpunkt der Injektion unterbrechen. Ihr Arzt wird
                entscheiden, wann Sie Ihre Behandlung mit Metformin Lich beenden müssen und wann die
                Behandlung wieder begonnen werden kann.

                Informieren Sie Ihren Arzt, wenn Sie andere Arzneimittel einnehmen/anwenden, kürzlich andere
                Arzneimittel eingenommen/angewendet haben oder beabsichtigen, andere Arzneimittel
                einzunehmen/anzuwenden. Möglicherweise müssen Ihr Blutzucker und Ihre Nierenfunktion
                häufiger kontrolliert werden oder Ihr Arzt muss eventuell die Dosierung von Metformin Lich
                anpassen.
                <br>
                Es ist besonders wichtig, folgende Arzneimittel zu erwähnen:
                <ul>
                    <li> Arzneimittel, die die Harnbildung steigern (Diuretika)</li>
                    <li>Arzneimittel zur Behandlung von Schmerzen und Entzündungen (NSARs und COX-2-Hemmer
                        wie beispielsweise Ibuprofen und Celecoxib)</li>
                    <li>bestimmte Arzneimittel zur Behandlung von Bluthochdruck (ACE-Hemmer und
                        AngiotensinII-Rezeptorantagonisten)</li>
                    <li>Beta-2-Agonisten wie Salbutamol oder Terbutalin (zur Behandlung von Asthma)</li>
                    <li>Kortikosteroide (zur Behandlung einer Vielzahl von Erkrankungen wie schweren
                        Entzündungen der Haut oder bei Asthma)</li>
                    <li>Arzneimittel, die möglicherweise die Menge an Metformin Lich in Ihrem Blut verändern,
                        insbesondere, wenn bei Ihnen eine eingeschränkte Nierenfunktion vorliegt (wie Verapamil,
                        Rifampicin, Cimetidin, Dolutegravir, Ranolazin, Trimethoprim, Vandetanib, Isavuconazol,
                        Crizotinib, Olaparib)</li>
                    <li>andere Medikamente zur Behandlung Ihrer Zuckerkrankheit</li>
                    <li>Levothyroxin (zur Schilddrüsenhormon-Ersatztherapie)</li>
                </ul>
                Die gleichzeitige Einnahme von Metformin Lich mit Phenprocoumon (zur Vorbeugung von
                Blutgerinnseln) kann einen Einfluss auf die Blutgerinnung haben. Deshalb wird Ihr Arzt
                möglicherweise Ihre Blutgerinnung häufiger überwachen.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseTwo">

                <img width="40" src="./../../assets/icons/5.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Metformin Lich zusammen mit
                Alkohol

            </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse">
            <div class="panel-body">Meiden Sie während der Einnahme von Metformin Lich übermäßigen Alkoholkonsum, da
                dieser
                das Risiko einer <a class="info_words" type="button" data-toggle="modal"
                    data-target="#laktatazidose">Laktatazidose</a> erhöhen kann. Im Allgemeinen sollten Sie den Konsum
                von
                Alkohol und
                die
                Anwendung alkoholhaltiger Arzneimittel meiden.</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseThree">
                <img width="40" src="./../../assets/icons/8.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Schwangerschaft und Stillzeit
            </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse">
            <div class="panel-body">Wenn Sie schwanger sind oder stillen oder wenn Sie vermuten, schwanger zu sein,
                oder
                beabsichtigen,
                schwanger zu werden, fragen Sie vor der Einnahme dieses Arzneimittels Ihren Arzt oder Apotheker
                um Rat.<br>
                Während einer Schwangerschaft muss Ihre Zuckerkrankheit mit Insulin behandelt werden.<br>
                Informieren Sie Ihren Arzt, wenn Sie schwanger sind, wenn Sie denken, dass Sie schwanger sein
                könnten, oder eine Schwangerschaft planen, damit Ihre Behandlung umgestellt werden kann.<br>
                Dieses Arzneimittel ist nicht zu empfehlen, wenn Sie stillen oder vorhaben, dies zu tun.</div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseFour">

                <img width="40" src="./../../assets/icons/3.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Verkehrstüchtigkeit und Fähigkeit zum Bedienen von Maschinen
            </h4>
        </div>
        <div id="collapseFour" class="panel-collapse collapse">
            <div class="panel-body">Metformin Lich selbst führt nicht zu einer Unterzuckerung (Hypoglykämie). Das
                heißt,
                dass Ihre
                Verkehrstüchtigkeit oder Fähigkeit zum Bedienen von Maschinen durch die Einnahme von Metformin
                Lich nicht beeinträchtigt wird. <br>
                <div class="alert">
                    Besondere Vorsicht ist hingegen geboten, wenn Sie Metformin Lich zusammen mit anderen
                    blutzuckersenkenden Arzneimitteln einnehmen, die Unterzuckerung hervorrufen können (wie zum
                    Beispiel Sulfonylharnstoffe, Insulin, Glinide).<br> Zu den Anzeichen einer Unterzuckerung
                    gehören
                    <ul>
                        <li>Schwächegefühl</li>
                        <li>Benommenheit</li>
                        <li>vermehrtes Schwitzen</li>
                        <li>beschleunigter Herzschlag</li>
                        <li>Sehstörungen</li>
                        <li>Konzentrationsschwierigkeiten
                    </ul>. Setzen Sie sich nicht ans Steuer eines Fahrzeugs und bedienen Sie
                    keine Maschinen, wenn Sie erste Anzeichen derartiger Beschwerden bemerken. </div>
            </div>
        </div>
    </div>
</div>
<h3 class="not_take"><i class="fas fa-bolt bolt_red" aria-hidden="true"></i> <br>Metformin Lich nicht einnehmen bei
</h3>
<div class="row">
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Allergisch </b> gegen
                <ul>
                    <li>Metforminhydrochlorid</li>
                    <li>Hypromellose</li>
                    <li>Povidon K25</li>
                    <li>Magnesiumstearat (Ph. Eur.)</li>
                    <li>Macrogol 6000</li>
                    <li>Titandioxid (E 171)</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"> <b>Leberprobleme </b> </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Schwere Einschränkung der Nierenfunktion </b> (glomeruläre
                Filtrationsrate
                unter 30 ml/min).</div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Unkontrollierten Diabetes</b>
                Beispiel mit
                <ul>
                    <li>schwerer Hyperglykämie (sehr hohem Blutzucker), </li>
                    <li>Übelkeit, </li>
                    <li>Erbrechen, </li>
                    <li>Durchfall, </li>
                    <li>schneller Gewichtsabnahme,</li>
                    <li><a class="info_words" type="button" data-toggle="modal"
                            data-target="#laktatazidose">Laktatazidose</a>
                    </li>
                    <li><a class="info_words" type="button" data-toggle="modal"
                            data-target="#ketoazidose">Ketoazidose</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse">Trinken von viel Alkohol oder Leiden unter einer Alkoholvergiftung
                leiden.</div>
        </div>
    </div>
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Verlust von zu viel Körperwasser (Dehydratation) </b>
                Beispiel durch
                <ul>
                    <li>lang andauernden oder starken Durchfall</li>
                    <li>wenn Sie sich mehrmals hintereinander erbrochen
                        haben.</li>
                </ul>
                Dieser Flüssigkeitsverlust könnte zu Nierenproblemen führen, wodurch Sie gefährdet
                sind, eine Übersäuerung mit Milchsäure (<a class="info_words" type="button" data-toggle="modal"
                    data-target="#laktatazidose">Laktatazidose</a>) zu entwickeln .
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Leiden an schweren Infektion </b>
                Beispiel einer Infektion der Lunge, der Bronchien oder der Niere. </br>
                Schwere Infektionen könnten zu Nierenproblemen führen, wodurch Sie gefährdet sind, eine
                Übersäuerung mit
                Milchsäure (<a class="info_words" type="button" data-toggle="modal"
                    data-target="#laktatazidose">Laktatazidose</a>) zu
                entwickeln.
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"> Behandlung wegen dekompensierter Herzschwäche oder Erleiden eines
                Herzinfarkt vor
                Kurzem, schwere Kreislaufprobleme (wie zum Beispiel einen Schock) oder
                Schwierigkeiten mit der Atmung haben. <br> Dies könnte zu einem Sauerstoffmangel im Gewebe
                führen, wodurch Sie gefährdet sind, eine Übersäuerung mit Milchsäure (<a class="info_words"
                    type="button" data-toggle="modal" data-target="#laktatazidose">Laktatazidose</a>) zu
                entwickeln.</div>
        </div>
    </div>
</div>
',11,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic, ADDRESS) VALUES (92,0,'Beispieltext4',11,4,'
<div class="row">
    <div class="col-md-9">
        <h3>Pharmazeutischer Unternehmer </h3>

        <p> Winthrop Arzneimittel GmbH <br />
            65927 Frankfurt am Main<br />
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/winthrop.png" />
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <h3>Mitvertrieb </h3>

        <p> Zentiva Pharma GmbH <br />
            65927 Frankfurt am Main<br />
            <b>Tel.:</b> (01 80) 2 02 00 10* <br />
            <b>Fax:</b> (01 80) 2 02 00 11* <br />
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/zentiva.png" />
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <h3>Hersteller</h3>
        <p> Chinoin Pharmaceutical and Chemical Works Private Co. Ltd. <br />
            Tó Utca 1-5 <br />
            H-1045 Budapest IV<br />
            Ungarn
        </p>
        <p> Chinoin Pharmaceutical and Chemical Works Private Co. Ltd. <br />
            5 Lévai utca<br />
            H-2112 Veresegyhàz<br />
            Ungarn
        </p>
        <p> S.C. Zentiva S.A.<br />
            B-dul Theodor Pallady nr. 50, sector 3, <br />
            032266 Bukarest<br />
            Rumänien
        </p>
    </div>
    <div class="col-md-3">
    </div>
</div>
');
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic)VALUES (93,0,'
<div class="row">
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
            " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    <ol>
        <li>Nehmen Sie dieses Arzneimittel immer genau nach Absprache mit Ihrem Arzt oder Apotheker ein.</li>
        <li>Fragen Sie bei Ihrem Arzt oder Apotheker nach, wenn Sie sich nicht sicher sind.</li>
        <li>Metformin Lich kann die Vorzüge einer gesunden Lebensweise nicht ersetzen. Folgen Sie
            weiterhin allen Ernährungsratschlägen Ihres Arztes und sorgen Sie für regelmäßige körperliche
            Bewegung.</li>

    </ol>

    <br><br>
    <b> Überwachung</b>
    <ul>
        <li>Ihr Arzt führt regelmäßige Blutzuckerkontrollen bei Ihnen durch und passt Ihre
            MetforminLich-Dosis Ihrem
            Blutzuckerspiegel an. <br>Sprechen Sie unbedingt regelmäßig mit Ihrem Arzt.
            Dies ist besonders wichtig für Kinder und Jugendliche oder wenn Sie schon älter sind.</li>
        <li>Ihr Arzt überprüft außerdem mindestens einmal jährlich Ihre Nierenfunktion. <br>Wenn Sie älter
            sind oder eine eingeschränkte Nierenfunktion haben, können auch häufigere Untersuchungen
            notwendig sein.</li>
    </ul>

</div>

</div>


<div class="row content_header">
    <h3 class="modal-title xs-center">Dosierung</h3>
    <hr />

    <div class=" with-nav-tabs panel-default">
        <div style="height: inherit;">
            <ul class="nav nav-tabs nav1-tabs">
                <li class="active"><a href="#tab1default" data-toggle="tab">Kinder ab 10 Jahre</a></li>
                <li><a href="#tab2default" data-toggle="tab">Kinder zwischen 10 und 12 Jahre</a></li>
                <li><a href="#tab3default" data-toggle="tab">Erwachsene</a></li>

            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table  ">


                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>
                                        500 oder 850 mg
                                    </td>

                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        2000mg pro tag <br> (Aufteilung: 2-3 Einnahmen) </td>

                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="tab-pane fade" id="tab2default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table hidden-xs">

                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>
                                        500 oder 850 mg
                                    </td>

                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        2000mg pro tag <br> (Aufteilung: 2-3 Einnahmen) </td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>

                                    <td>Wird nur empfohlen auf ausdrücklichen Rat
                                        des Arztes hin, da die Erfahrung in dieser Altersgruppe
                                        begrenzt ist.</td>

                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab3default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table ">

                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>

                                    <td>500 - 850 mg</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>

                                    <td>
                                        2-3x täglich
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>

                                    <td>3000mg pro tag <br> (Aufteilung: 3 Einnahmen)</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>

                                    <td>Falls Sie eine eingeschränkte Nierenfunktion haben, wird Ihr Arzt Ihnen
                                        möglicherweise eine
                                        niedrigere Dosis verordnen.<br>

                                        Wenn Sie außerdem Insulin anwenden, erfahren Sie von Ihrem Arzt, wie Sie mit der
                                        Einnahme von
                                        Metformin Lich beginnen sollen</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row content_header">
    <h3 class="modal-title xs-center">Art und Dauer der Anwendung</h3>
    <hr />
    <div class="row text-center">
        <div class="col-sm-4">
            <i style="font-size:40px;    color: #575858;" class="fas fa-utensils"></i><br> <br>
            Nehmen Sie Metformin Lich mit oder nach einer Mahlzeit ein. So vermeiden Sie Nebenwirkungen,
            die Ihre Verdauung beeinträchtigen.</div>
        <div class="col-sm-4">
            <i style="font-size:40px;    color: #575858;" class="fas fa-glass-whiskey"></i><br> <br>
            Die Tabletten dürfen nicht zerstoßen oder zerkaut werden. Schlucken Sie jede Tablette mit
            einem
            Glas Wasser.</div>
        <div class="col-sm-4">
            <i style="font-size:40px;    color: #575858;" class="fas fa-user-md"></i> <br>
            <br> Wenn Sie nach einiger Zeit den Eindruck haben, dass
            die Wirkung von
            Metformin
            Lich zu stark oder
            zu schwach ist, sprechen Sie mit Ihrem Arzt oder Apotheker.</div>
    </div>
    <div class="row hidden-xs" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4>Gleiche Aufteilung der Dosen</h4>
            <table class="sideffect_table">
                <thead class="text-center">
                    <tr>
                        <th>Anzahl der Einnahmen pro Tag </th>
                        <th>Morgens <br> zum Frühstück</th>
                        <th>Mittags <br> zum Mittagessen</th>
                        <th>Abends <br> zum Abendessen</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <tr>
                        <td>
                            1x
                        </td>
                        <td>
                            X
                        </td>
                        <td>

                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            2x
                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            3x
                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
    </div>
    <div class="row hidden-sm hidden-lg hidden-md" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4>Gleiche Aufteilung der Dosen</h4>
            <table class="sideffect_table">
                <thead class="text-center">
                    <tr>
                        <th>Anzahl der Einnahmen pro Tag </th>
                        <th>1x</th>
                        <th>2x</th>
                        <th>3x</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <tr>
                        <td>
                            Morgens <br> zum Frühstück
                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mittags <br> zum Mittagessen </td>
                        <td>

                        </td>
                        <td>
                            X
                        </td>
                        <td>
                            X
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Mittags <br> zum Mittagessen </td>
                        <td>

                        </td>
                        <td>

                        </td>
                        <td>
                            X
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4 class="modal-title xs-center">Teilung der Tablette</h4>
            <hr />

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-caption">
                            <h4> Schritt 1</h4>
                            <img src="./../../assets/p_form/usage/notcrack_long.svg" class="usage_tab" alt="Tablette"
                            title="Tablette">
                        <br><br>
                        <p>Legen Sie bitte die Tablette mit der Bruchkerbe nach oben auf eine feste Unterlage.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 2</h4>
                            <img src="./../../assets/p_form/usage/crack_long.svg" class="usage_tab1" alt="Tablette"
                            title="Tablette">
                        <br><br>
                        <p>Drücken Sie mit den Zeigefingern auf die linke und rechte Hälfte der Tablette.</p>
                        </div>
                    </div>

                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right">
                        </span></a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row content_header" style="margin-top: 30px;">
    <h1 xs-center>Weitere Informationen</h1>
    <hr />
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingOne">
                    <h4 class="panel-title" data-toggle="collapse" data-target="#collapseOnee">

                        Wenn Sie eine größere Menge von Metformin Lich eingenommen haben, als Sie
                        sollten

                    </h4>
                </div>
                <div id="collapseOnee" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <p>Wenn Sie eine größere Menge von Metformin Lich eingenommen haben, als Sie
                            sollten, kann
                            es zu
                            einer Übersäuerung des Blutes mit Milchsäure kommen (<a class=" info_words" type="button"
                                data-toggle="modal" data-target="#laktatazidose">Laktatazidose</a>).
                            <br>Wenn Sie eine größere Menge von Metformin Lich eingenommen haben, als
                            Sie sollten,
                            kann
                            eine
                            Entzündung der Bauchspeicheldrüse auftreten, die starke Bauch- und
                            Rückenschmerzen
                            verursacht.
                            <br>
                            Beenden Sie sofort die Einnahme von Metformin Lich und setzen Sie sich
                            unverzüglich mit einem Arzt oder mit dem nächstgelegenen Krankenhaus in
                            Verbindung.

                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingTwo">
                    <h4 class="panel-title" data-toggle="collapse" data-target="#collapseTwoe">

                        Wenn Sie die Einnahme von Metformin Lich vergessen haben
                    </h4>
                </div>
                <div id="collapseTwoe" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <p>Nehmen Sie nicht die doppelte Menge ein, wenn Sie die vorherige Einnahme
                            vergessen haben.
                            Nehmen Sie die nächste Dosis zur vorgesehenen Zeit ein.
                            Wenn Sie weitere Fragen zur Anwendung des Arzneimittels haben, fragen Sie
                            Ihren Arzt
                            oder
                            Apotheker.</p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
',11,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (94,0,'
<div className="row content_header">
    <h3> Nebenwirkungen für Erwachsene <i class="fas fa-male"></i> <i class="fas fa-blind"></i> </h3>
    <hr>
</div>
<table class="sideffect_table hidden-xs">
    <thead>
        <tr>
            <th>Häufigkeit</th>
            <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span>  </th>
            <th>Nebenwirkung</th>
        </tr>
    </thead>
    <tbody class="">
        <tr id="sehrhaeufig">
            <td>Sehr häufig</td>
            <td>Mehr als 1 von 10 Behandelten</td>
            <td><b>Verdauungsprobleme wie</b>
                <ul>
                    <li>Übelkeit</li>
                    <li>Erbrechen</li>
                    <li>Durchfall</li>
                    <li>Bauchschmerzen</li>
                    <li>Appetitverlust</li>
                </ul>
                Diese Nebenwirkungen treten meistens zu Beginn der Behandlung mit
                Metformin Lich auf. </br> </br>
                <b>Vorbeugung:</b> </br>Eine Aufteilung der Tagesdosis auf mehrere über den Tag
                verteilte
                Einnahmen und die Einnahme von Metformin Lich mit oder direkt nach einer Mahlzeit.
                </br>
                <span style=" color: red;">Wenn die Beschwerden andauern, nehmen Sie Metformin Lich
                    nicht weiter ein
                    und sprechen Sie mit Ihrem
                    Arzt.</span>
            </td>
        </tr>
        <tr id="haeufig">
            <td>Häufig</td>
            <td>Mehr als 1 von 10 Behandelten </td>
            <td><b>Geschmacksveränderungen</b></td>
        </tr>
        <tr id="sehrselten">
            <td>Sehr selten</td>
            <td>Bis zu 1 von 10.000 Behandelten</td>
            <td>
                <b>Übersäuerung des Blutes mit Milchsäure (<a class=" info_words" type="button" data-toggle="modal"
                        data-target="#laktatazidose">Laktatazidose</a>)</b> </br>Dies
                ist eine
                sehr seltene, aber schwerwiegende Komplikation, insbesondere bei Patienten mit
                eingeschränkter
                Nierenfunktion. Die Symptome einer <a class="info_words" type="button" data-toggle="modal"
                    data-target="#laktatazidose">Laktatazidose</a> sind unspezifisch.
                </br> </br>
                <b>Auffällige Leberfunktionswerte oder <a class="info_words" type="button" data-toggle="modal"
                        data-target="#hepatitis">Hepatitis</a></b> </br> Wenn Sie
                derartige Beschwerden bekommen, nehmen
                Sie
                Metformin Lich nicht weiter ein und sprechen Sie sofort mit Ihrem Arzt.</br></br>
                <b>Hautreaktionen wie</b>
                <ul>
                    <li> Rötung (Erythem)</li>
                    <li>Juckreiz oder juckender Ausschlag (Quaddeln)
                </ul>
                </br>
                <b>Niedrige Konzentration von Vitamin B12 im Blut.</b>

            </td>
        </tr>
        <tr id="nichtbekannt">
            <td>Nicht Bekannt</td>
            <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
            <td>
                <ul>
                    <li>Verringerte Anzahl der roten Blutkörperchen, die eine blassgelbe Haut,
                        Schwächegefühl
                        oder Atemlosigkeit verursachen kann (hämolytische Anämie).</li>
                    <li>Abnahme des Schilddrüse-stimulierenden Hormon-(TSH-)Blutspiegels bei Patienten
                        mit
                        einer Schilddrüsenunterfunktion (Hypothyreose).</li>
                    Niedriger Magnesiumspiegel im Blut (Hypomagnesiämie) im Rahmen einer
                    Durchfallerkrankung.</li>
                    <li>Eine Erkrankung, bei der die Funktionalität des Gehirns betroffen ist
                        (Enzephalopathie).
                    <li>Überempfindlichkeit der Haut gegenüber Licht (Photosensitivität).</li>

                    <li>Erkrankung der Nerven bei Patienten mit Vitamin-B12-Mangel, die Schwächegefühl,
                        Kribbeln oder Taubheitsgefühl verursachen kann (periphere Neuropathie).
                    </li>
                </ul>
            </td>
        </tr>
    </tbody>
</table>

<div class="hidden-sm hidden-md hidden-lg">
    <div class="row content_header">
        <h3> Häufigkeit der Nebenwirkungen </h3>
        <hr>
    </div>
    <div>
        <div class="row p15" id="sehrhaeufig-xs">
            <h4> Sehr häufig</h4>
            <div class="row">
                <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span>  :</b> <br> Mehr als 1 von 10 Behandelten
            </div>
            <div class="row">
                <b>Nebenwirkung:</b> <br><b>Verdauungsprobleme wie</b>
                <ul>
                    <li>Übelkeit</li>
                    <li>Erbrechen</li>
                    <li>Durchfall</li>
                    <li>Bauchschmerzen</li>
                    <li>Appetitverlust</li>
                </ul>
                Diese Nebenwirkungen treten meistens zu Beginn der Behandlung mit
                Metformin Lich auf. </br> </br>
                <b>Vorbeugung:</b> </br>Eine Aufteilung der Tagesdosis auf mehrere über den Tag
                verteilte
                Einnahmen und die Einnahme von Metformin Lich mit oder direkt nach einer Mahlzeit.
                </br>
                <span style=" color: red;">Wenn die Beschwerden andauern, nehmen Sie Metformin Lich
                    nicht weiter ein
                    und sprechen Sie mit Ihrem
                    Arzt.</span>
            </div>
            <hr>
        </div>
        <div class="row p15" id="haeufig-xs">
            <h4> Häufig</h4>
            <div class="row">
                <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10 Behandelten
            </div>
            <div class="row">
                <b>Nebenwirkung:</b> <br>
                Geschmacksveränderungen
            </div>
            <hr>
        </div>

        <div class="row p15" id="sehrselten-xs">
            <h4> Sehr selten</h4>
            <div class="row">
                <b>Anzahl der betreffenden Behandelten: <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </b> <br> Mehr als 1 von 10000 Behandelten
            </div>
            <div class="row">
                <b>Nebenwirkung:</b> <br>
                <b>Übersäuerung des Blutes mit Milchsäure (<a class=" info_words" type="button" data-toggle="modal"
                        data-target="#laktatazidose">Laktatazidose</a>)</b> </br>Dies
                ist eine
                sehr seltene, aber schwerwiegende Komplikation, insbesondere bei Patienten mit
                eingeschränkter
                Nierenfunktion. Die Symptome einer <a class="info_words" type="button" data-toggle="modal"
                    data-target="#laktatazidose">Laktatazidose</a> sind unspezifisch.
                </br> </br>
                <b>Auffällige Leberfunktionswerte oder <a class="info_words" type="button" data-toggle="modal"
                        data-target="#hepatitis">Hepatitis</a></b> </br> Wenn Sie
                derartige Beschwerden bekommen, nehmen
                Sie
                Metformin Lich nicht weiter ein und sprechen Sie sofort mit Ihrem Arzt.</br></br>
                <b>Hautreaktionen wie</b>
                <ul>
                    <li> Rötung (Erythem)</li>
                    <li>Juckreiz oder juckender Ausschlag (Quaddeln)
                </ul>
                </br>
                <b>Niedrige Konzentration von Vitamin B12 im Blut.</b>
            </div>
            <hr>
        </div>
        <div class="row p15" id="nichtbekannt">
            <h4> Nicht bekannt</h4>
            <div class="row">
                <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100 Behandelten
            </div>
            <div class="row">
                <b>Nebenwirkung:</b> <br>
                <ul>
                    <li>Verringerte Anzahl der roten Blutkörperchen, die eine blassgelbe Haut,
                        Schwächegefühl
                        oder Atemlosigkeit verursachen kann (hämolytische Anämie).</li>
                    <li>Abnahme des Schilddrüse-stimulierenden Hormon-(TSH-)Blutspiegels bei Patienten
                        mit
                        einer Schilddrüsenunterfunktion (Hypothyreose).</li>
                    Niedriger Magnesiumspiegel im Blut (Hypomagnesiämie) im Rahmen einer
                    Durchfallerkrankung.</li>
                    <li>Eine Erkrankung, bei der die Funktionalität des Gehirns betroffen ist
                        (Enzephalopathie).
                    <li>Überempfindlichkeit der Haut gegenüber Licht (Photosensitivität).</li>

                    <li>Erkrankung der Nerven bei Patienten mit Vitamin-B12-Mangel, die Schwächegefühl,
                        Kribbeln oder Taubheitsgefühl verursachen kann (periphere Neuropathie).
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div>
    <h3>Nebenwirkungen für Kinder und Jugendliche <i class="fas fa-child"></i> </h3>
    <hr>
    Begrenzte Daten für Kinder und Jugendliche zeigten, dass die Nebenwirkungen in Art und
    Schwere jenen glichen, wie sie für Erwachsene gemeldet wurden.
</div>
',11,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (95,0,'Beispieltext7',11,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (96,0,'

<div class="row">
    <h4> Anwendung von Methfomin </h4>
    <ul>
        <li>Zur Behandlung von Patienten mit <b>Zuckerkrankheit (<a class="info_words" type="button" data-toggle="modal"
                    data-target="#diabetes_typ_2">Typ-2-Diabetes</a>)</b>, wenn der Blutzuckerspiegel
            durch Diät und
            Bewegung allein nicht ausreichend kontrolliert werden konnte.<br>
            Wenn Sie an Diabetes leiden, produziert Ihre Bauchspeicheldrüse entweder nicht genug <a class="info_words"
                type="button" data-toggle="modal" data-target="#insulin">Insulin</a>
            oder die Körpergewebe sprechen nicht richtig auf das gebildete <a class="info_words" type="button"
                data-toggle="modal" data-target="#insulin">Insulin</a>
            an. Hohe Blutzuckerspiegel sind die Folge. Metformin Lich hilft, Ihren Blutzucker auf möglichst normale
            Werte zu
            senken.</li>
        <li>Bei <b>übergewichtigen Patienten</b>. <br>
            Bei übergewichtigen Erwachsenen trägt die langfristige Einnahme von Metformin Lich außerdem dazu bei, das
            Risiko
            von diabetesbedingten Komplikationen zu senken.
            Unter Metformin Lich wird ein stabiles Körpergewicht oder eine mäßige Gewichtsabnahme beobachtet.</li>
    </ul>
</div>

<div class="row" style="padding:30px 0 30px 0px;">

    <table class="sideffect_table">
        <tr>
            <td style="width: 32%;">
                <div class="col-sm-1 text-center-xs"> <i class="fas fa-male allg_icon"></i></div>
                <div class="col-sm-10" style="padding-top:5px"> <b>Erwachsene</b> </div>
            </td>
            <td> Können Metformin Lich allein
                oder zusammen mit anderen blutzuckersenkenden
                Arzneimitteln (Arzneimittel, die über den Mund einzunehmen sind, oder Insulin) anwenden.</td>
        </tr>
        <tr>
            <td>
                <div class="col-sm-1 text-center-xs"> <i class="fas fa-child allg_icon"></i></div>
                <div class="col-sm-10">
                    <b>Kinder ab 10 Jahren &
                        Jugendliche</b></div>
            </td>
            <td> Können Metformin Lich allein oder zusammen mit <a class="info_words" type="button" data-toggle="modal"
                    data-target="#insulin">Insulin</a>
                anwenden.</td>
        </tr>
    </table>
</div>
',11,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (97,0,'
Metformin Lich sind weiße, längliche, in der Mitte verjüngte Filmtabletten mit abgeschrägten Kanten und einer Bruchkerbe
auf beiden Seiten. Die Tablette kann in gleiche Dosen geteilt werden.
',11,9);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (98,0,'
Enalapril AL 5mg ist in Packungen mit 30, 50 und 100 Tabletten erhältlich. Es werden möglicherweise nicht alle
Packungsgrößen in den Verkehr gebracht.
',11,10);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (99,0,'
1 Filmtablette enthält 1000 mg Metforminhydrochlorid, entsprechend 780 mg Metformin.<br>
<b>Die sonstigen Bestandteile sind:</b>
<ul>
    <li>Hypromellose</li>
    <li>Povidon K25</li>
    <li>Magnesiumstearat (Ph. Eur.).</li>
    <li>
        Macrogol 6000</li>
    <li>Titandioxid (E 171)</li>
</ul>
',11,11);

--Amlodipin--

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (100,0,'Beispieltext1',12,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (101,0,'Beispieltext2',12,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (102,0,'
<div class="row content_header">
    <h1>Warnhinweise und Vorsichtsmaßnahmen
    </h1>
    <hr>
</div>
<div>
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>


    Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, bevor Sie Amlodipin (besilat) Dexcel 5
    mg einnehmen.<br>
    Informieren Sie Ihren Arzt, wenn eine der folgenden Voraussetzungen auf Sie zutrifft oder
    einmal zutraf:
    <br><br>

    <div class="row">
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Erleiden eines Herzinfarktes (kürzlich)</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Herzerkrankung</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an einem starken Blutdruckanstieg (hypertensive Krise)</b>
                </div>
            </div>
        </div>
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an einer Lebererkrankung</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Wenn Sie älter sind und Ihre Dosis erhöht werden muss</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> <i class="fas fa-child"></i> Kinder</b><br>
                    Bei Kindern unter 6 Jahren wurde Amlodipin nicht untersucht. <br>
                    Amlodipin (besilat) Dexcel 5 mg kann nur bei Kindern und
                    Jugendlichen mit Bluthochdruck im Alter von 6 bis
                    17 Jahren angewendet werden
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel-group" id="accordion" style="margin: 30 0 30 0;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse3">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Amlodipin zusammen mit
                anderen Medikamente
            </h4>
        </div>
        <div id="collapse3" class="panel-collapse collapse in">
            <div class="panel-body">
                Informieren Sie Ihren Arzt oder Apotheker, wenn Sie andere Arzneimittel
                einnehmen/anwenden, kürzlich andere Arzneimittel eingenommen/angewendet haben oder
                beabsichtigen andere Arzneimittel einzunehmen/anzuwenden. <br>
                Amlodipin (besilat) Dexcel 5 mg kann andere Arzneimittel beeinflussen oder von anderen
                Arzneimitteln beeinflusst werden, wie z.B.:
                <ul>
                    <li>Ketoconazol, Itraconazol (gegen Pilzerkrankungen)</li>
                    <li>Ritonavir, Indinavir, Nelfinavir (so genannte Proteasehemmer gegen HIV-Infektionen)</li>
                    <li>Rifampicin, Erythromycin, Clarithromycin (Antibiotika)</li>
                    <li>Hypericum perforatum (Johanniskraut)</li>
                    <li>Verapamil, Diltiazem (Herzmittel)</li>
                    <li>Dantrolen (eine Infusion bei schwerer Störung der Körpertemperatur)</li>
                    <li>Tacrolimus (ein Arzneimittel zur Beeinflussung des Immunsystems)</li>
                    <li>Simvastatin (zur Senkung der Cholesterinwerte)</li>
                    <li>Ciclosporin (ein Mittel zur Unterdrückung des Immunsystems)</li>
                </ul>
                Amlodipin (besilat) Dexcel 5 mg kann Ihren Blutdruck noch weiter senken, wenn Sie bereits
                andere blutdrucksenkende Arzneimittel anwenden.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse4">
                <img width="40" src="./../../assets/icons/11.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Amlodipin zusammen mit
                Nahrungsmitteln und
                Getränken
            </h4>
        </div>
        <div id="collapse4" class="panel-collapse collapse">
            <div class="panel-body">
                Personen, die Amlodipin (besilat) Dexcel 5 mg einnehmen, sollten keine Grapefruit essen
                und keinen Grapefruitsaft trinken, weil hierdurch der Blutspiegel des Wirkstoffs Amlodipin
                erhöht werden kann, was möglicherweise zu einem unkontrollierten Anstieg der
                blutdrucksenkenden Wirkung von Amlodipin (besilat) Dexcel 5 mg führt.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse5">
                <img width="40" src="./../../assets/icons/8.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Schwangerschaft und Stillzeit
            </h4>
        </div>
        <div id="collapse5" class="panel-collapse collapse">
            <div class="panel-body">
                Wenn Sie schwanger sind oder stillen, oder wenn Sie vermuten, schwanger zu sein oder
                beabsichtigen, schwanger zu werden, fragen Sie vor der Anwendung dieses Arzneimittels
                Ihren Arzt oder Apotheker um Rat.
                <h4>Schwangerschaft</h4>
                Die Sicherheit von Amlodipin während einer Schwangerschaft konnte nicht nachgewiesen
                werden. Wenn Sie glauben, schwanger zu sein, oder eine Schwangerschaft planen,
                müssen Sie dies Ihrem Arzt vor der Einnahme von Amlodipin (besilat) Dexcel 5 mg sagen.</br>
                <h4>Stillzeit</h4>
                Es ist nicht bekannt, ob Amlodipin in die Muttermilch übergeht. Wenn Sie stillen oder mit
                dem Stillen beginnen möchten, müssen Sie dies Ihrem Arzt vor der Einnahme von
                Amlodipin (besilat) Dexcel 5 mg sagen.
                Fragen Sie vor der Einnahme von allen Arzneimitteln Ihren Arzt oder Apotheker um Rat.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse6">
                <img width="40" src="./../../assets/icons/3.svg" /><span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Verkehrstüchtigkeit und Fähigkeit zum Bedienen von Maschinen
            </h4>
        </div>
        <div id="collapse6" class="panel-collapse collapse">
            <div class="panel-body">Die Fähigkeit zur aktiven Teilnahme am Straßenverkehr oder zum Bedienen von
                Maschinen
                kann durch Amlodipin (besilat) Dexcel 5 mg beeinträchtigt werden. Falls die Tabletten bei
                Ihnen ein Krankheitsgefühl, Schwindel oder Müdigkeit hervorrufen oder Kopfschmerzen
                auftreten, fahren Sie kein Auto oder bedienen Sie keine Maschinen und suchen Sie
                umgehend Ihren Arzt auf. </div>
        </div>
    </div>
</div>
</div>
<h3 class="not_take"><i class="fas fa-bolt bolt_red" aria-hidden="true"></i> <br> Amlodipin (besilat) Dexcel 5 mg
    nicht
    einnehmen bei </h3>
<div class="row">
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Allergisch </b> gegen
                <ul>
                    <li>Amlodipin</li>
                    <li>Mikrokristalline Cellulose</li>
                    <li>CalciumhydrogenphosphatDihydrat</li>
                    <li>Carboxymethylstärke-Natrium (Typ A) (Ph. Eur.)</li>
                    <li>Magnesiumstearat (Ph.Eur.)
                        [pflanzlich]</li>
                </ul>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"> <b>Leiden an stark erniedrigtem Blutdruck (Hypotonie) </b> </div>
        </div>
    </div>
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Leiden an schwerer Verengung des Ausflusstraktes der linken
                    Herzkammer</b>
                (Aortenstenose) oder an einem <b>kardiogenen Schock</b> (dann kann Ihr Herz den Körper
                nicht mehr mit genügend Blut versorgen)</div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Leiden an Herzinsuffizienz nach einem Herzinfarkt </b>
            </div>
        </div>
    </div>
</div>
',12,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic, address) VALUES (103,0,'Beispieltext',12,4, '
<div class="row">
    <div class="col-md-9">
        <h3>Pharmazeutischer Unternehmer </h3>
        <p> Dexcel Pharma GmbH <br />
            Carl-Zeiss-Str. 2<br />
            63755 Alzenau<br />
            <b>Tel.:</b> 0 60 23 - 94 80 - 0 <br />
            <b>Fax:</b> 0 60 23 - 94 80 - 50 <br />
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/dexcel.jpeg" />
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <h3>Hersteller </h3>
        <p> Dexcel Pharma GmbH <br />
            Steinbruch 2, Halle 15<br />
            Lager im Industriepark Giesbert G.b.R. </br>
            63755 Alzenau<br />
        </p>
    </div>
    <div class="col-md-3">
    </div>
</div>');
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (104,0,'
<div class="row">
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    <ol>
        <li>Nehmen Sie dieses Arzneimittel immer genau nach Absprache mit Ihrem Arzt oder Apotheker ein.</li>
        <li>Fragen Sie bei Ihrem Arzt oder Apotheker nach, wenn Sie sich nicht sicher sind.</li>
    </ol>
</div>

<div class="row content_header">
    <h3 class="modal-title xs-center">Dosierung</h3>
    <hr />

    <div class=" with-nav-tabs panel-default">
        <div style="height: inherit;">
            <ul class="nav nav-tabs nav1-tabs">
                <li class="active"><a href="#tab1default" data-toggle="tab">Kindern und Jugendlichen im Alter von 6 bis
                        17 Jahren</a></li>
                <li><a href="#tab2default" data-toggle="tab">Erwachsene</a></li>
            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>2,5mg</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        10mg pro tag </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>Tabletten mit 2,5 mg Amlodipin sind derzeit nicht erhältlich und die
                                        2,5 mg Dosierung
                                        kann
                                        mit Amlodipin (besilat) Dexcel 5 mg nicht erhalten werden, da diese nicht so
                                        hergestellt
                                        wurden, dass sie in zwei gleiche Dosen geteilt werden können</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="tab-pane fade" id="tab2default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>5mg</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>
                                        1x täglich
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>

                                    <td>5mg pro tag </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Art und Dauer der Anwendung</h3>
    <hr />

    <div class="row text-center">
        <div class="col-sm-6">
            <i style="font-size:40px;    color: #575858;" class="fas fa-glass-whiskey"></i><br> <br>
            Dieses Arzneimittel
            kann unabhängig von Mahlzeiten oder Getränken
            eingenommen
            werden.Sie sollten dieses Arzneimittel jeden Tag zur gleichen Zeit mit einem Glas Wasser
            einnehmen.</div>
        <div class="col-sm-6">
            <img width=" 40" src="./../../assets/icons/11.svg" />
            <br>
            <br> Amlodipin (besilat) Dexcel 5 mg darf nicht mit Grapefruitsaft eingenommen
            werden.</div>
    </div>

    <div class="row" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4 class="modal-title xs-center">Teilung der Tablette</h4>
            <hr />

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-caption">
                            <h4> Schritt 1</h4>
                            <img src="./../../assets/p_form/usage/notcrack_small.svg" class="usage_tab" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p>Legen Sie bitte die Tablette mit der Bruchkerbe nach oben auf eine feste Unterlage.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 2</h4>
                            <img src="./../../assets/p_form/usage/crack_small.svg" class="usage_tab1" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p>Drücken Sie mit den Zeigefingern auf die linke und rechte Hälfte der Tablette.</p>
                        </div>
                    </div>

                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right">
                        </span></a>
                </div>
            </div>

        </div>
    </div>
</div>
<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Weitere Informationen</h3>
    <hr />
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingOne">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseOne1">
                        Wenn Sie eine größere Menge von Amlodipin (besilat) Dexcel 5 mg eingenommen haben, als Sie
                        sollten
                    </h4>
                </div>
                <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <p>Wenn Sie zu viele Tabletten eingenommen haben, kann Ihr Blutdruck abfallen oder auch
                            gefährlich niedrig werden.
                            <br>Sie können sich schwindelig, benommen und schwach fühlen
                            oder ohnmächtig werden. Wenn der Blutdruckabfall stark genug ist, kann es zu einem
                            Schock kommen.
                            <br>Ihre Haut kann sich dann kalt und feucht anfühlen und Sie könnten das
                            Bewusstsein verlieren. Begeben Sie sich sofort in medizinische Überwachung, wenn Sie zu
                            viele Amlodipin (besilat) Dexcel Tabletten eingenommen haben.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingTwo">
                    <h4 class="panel-title title_pan text-center-xs" data-toggle="collapse" data-target="#collapseTwo2">
                        Wenn Sie die Einnahme von Amlodipin (besilat) Dexcel 5 mg vergessen haben
                    </h4>
                </div>
                <div id="collapseTwo2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <p>Dies ist nicht schlimm. Nehmen Sie nicht die doppelte Menge ein, wenn Sie die vorherige
                            Einnahme vergessen haben. <br> Nehmen Sie die nächste Dosis dann wieder zur gewohnten
                            Zeit ein. </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingThree">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseThree3">

                        Wenn Sie die Einnahme von Amlodipin (besilat) Dexcel 5 mg abbrechen
                    </h4>
                </div>
                <div id="collapseThree3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <p>Ihr Arzt wird Ihnen sagen, wie lange Sie dieses Arzneimittel einnehmen müssen. Wenn Sie
                            die Anwendung dieses Arzneimittels beenden, bevor er Sie dazu aufgefordert hat, können
                            Ihre Beschwerden zurückkehren.<br>
                            Wenn Sie weitere Fragen zur Einnahme dieses Arzneimittels haben, wenden Sie sich an
                            Ihren Arzt oder Apotheker </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
',12,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (105,0,'
<div class="row content_header">
    <h1> Nebenwirkungen </h1>
    <hr>
    Wie alle Arzneimittel kann auch dieses Arzneimittel Nebenwirkungen haben, die aber nicht
    bei jedem auftreten müssen.
</div>
<div class="alert alert-info" style="margin-top: 15px;">
    Suchen Sie sofort Ihren Arzt auf, wenn bei Ihnen nach der Einnahme dieses Arzneimittels
    die folgenden Nebenwirkungen auftreten:
    <ul>
        <li>plötzliches Keuchen beim Atmen, Schmerzen im Brustbereich, Kurzatmigkeit oder
            Atembeschwerden</li>
        <li>Anschwellen der Augenlider, des Gesichts oder der Lippen</li>
        <li>Anschwellen der Zunge oder der Kehle, was zu starken Atembeschwerden führt</li>
        <li>schwere Hautreaktionen einschließlich starker Hautausschlag, Nesselsucht, Hautrötung
            am ganzen Körper, starkes Jucken, Blasenbildung, Abschälen und Anschwellen der
            Haut, Entzündung von Schleimhäuten (Stevens-Johnson-Syndrom) oder andere
            allergische Reaktionen
        <li>Herzinfarkt, ungewöhnlicher Herzschlag</li>
        <li>Bauchspeicheldrüsenentzündung, die zu starken Bauch- und Rückenschmerzen mit
            ausgeprägtem Unwohlsein führen kann </li>
    </ul>
</div>
<div class="row">
    <table class="sideffect_table hidden-xs">
        <thead>
            <tr>
                <th>Häufigkeit</th>
                <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                <th>Nebenwirkung</th>
            </tr>
        </thead>
        <tbody class="" style="padding: 15px;">
            <tr id="sehrhaeufig">
                <td>Sehr häufig</td>
                <td>Mehr als 1 von 10 Behandelten</td>
                <td>Knöchelschwellungen (Ödeme)
                </td>
            </tr>
            <tr id="haeufig">
                <td>Häufig</td>
                <td>Mehr als 1 von 10 Behandelten </td>
                <td>
                    <ul>
                        <li>Kopfschmerzen, Schwindel, Schläfrigkeit (insbesondere zu Beginn der Behandlung)</li>
                        <li>Herzklopfen (Palpitationen), Hautrötung mit Wärmegefühl</li>
                        <li>Bauchschmerzen, Übelkeit</li>
                        <li>veränderte Darmentleerungsgewohnheiten, Durchfälle, Verstopfung,
                            Verdauungsstörungen</li>
                        <li>Müdigkeit, Schwächegefühl</li>
                        <li>Sehstörungen, Doppeltsehen</li>
                        <li>Muskelkrämpfe</li>
                    </ul>
                </td>
            </tr>
            <tr id="gelegentlich">
                <td>Gelegentlich</td>
                <td>Bis zu 1 von 100 Behandelten</td>
                <td>
                    <ul>
                        <li>Stimmungsschwankungen, Angst, Depression, Schlaflosigkeit</li>
                        <li>Zittern, Geschmacksstörungen, kurze Bewusstlosigkeit</li>
                        <li>verminderte Empfindlichkeit für Berührungsreize oder Kribbeln in den Extremitäten,
                            Verlust des Schmerzgefühls</li>
                        <li>Ohrgeräusche</li>
                        <li>niedriger Blutdruck</li>
                        <li>Niesen/laufende Nase durch eine Entzündung der Nasenschleimhaut (Rhinitis)</li>
                        <li>Husten</li>
                        <li>Mundtrockenheit, Erbrechen</li>
                        <li>Haarausfall, vermehrtes Schwitzen, Hautjucken, rote Flecken auf der Haut,
                            Hautverfärbung</li>
                        <li>Störungen beim Wasserlassen, vermehrter nächtlicher Harndrang, häufigeres
                            Wasserlassen</li>
                        <li>Erektionsstörungen, Vergrößerung der Brustdrüsen beim Mann</li>
                        <li>Schmerzen, Unwohlsein</li>
                        <li>Gelenk- oder Muskelschmerzen, Rückenschmerzen</li>
                        <li>Gewichtszunahme oder Gewichtsabnahme</li>
                    </ul>
                </td>
            </tr>
            <tr id="selten">
                <td>Selten</td>
                <td> Bis zu 1 von 1.000 Behandelten </td>
                <td>
                    Verwirrung
                </td>
            </tr>
            <tr id="sehrselten">
                <td>Sehr selten</td>
                <td> Bis zu 1 von 10.000 Behandelten </td>
                <td>
                    <ul>
                        <li>Verminderung der weißen Blutkörperchen, Verminderung der Blutplättchen, was zu
                            ungewöhnlichen blauen Flecken oder leichtem Bluten führen kann (Schädigung der
                            roten Blutzellen)</li>
                        <li>erhöhter Blutzuckerspiegel (Hyperglykämie)</li>
                        <li>eine Nervenstörung, die zu Schwächegefühl, verminderter Empfindlichkeit für
                            Berührungsreize oder Kribbeln führen kann</li>
                        <li>Schwellung des Zahnfleischs</li>
                        <li>aufgeblähter Bauch (Gastritis)</li>
                        <li>gestörte Leberfunktion, Entzündung der Leber (Hepatitis), Gelbfärbung der Haut
                            (Gelbsucht), Anstieg der Leberenzyme, wodurch bestimmte medizinische Tests
                            beeinflusst werden können</li>
                        <li>erhöhte Muskelanspannung</li>
                        <li>entzündliche Reaktionen der Blutgefäße, häufig mit Hautausschlag</li>
                        <li>Lichtempfindlichkeit</li>
                        <li>Störungen, die sich aus Steifheit, Zittern und/oder Bewegungsstörungen
                            zusammensetzen</li>
                    </ul>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="hidden-sm hidden-md hidden-lg">
        <div class="row content_header">
            <h3> Häufigkeit der Nebenwirkungen </h3>
            <hr>
        </div>
        <div>
            <div class="row p15" id="sehrhaeufig-xs">
                <h4> Sehr häufig</h4>
                <div class="row">
                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10 Behandelten
                </div>
                <div class="row">
                    <b>Nebenwirkung:</b> <br>Knöchelschwellungen (Ödeme)
                </div>
                <hr>
            </div>

            <div class="row p15" id="haeufig-xs">
                <h4> Häufig</h4>
                <div class="row">
                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10 Behandelten
                </div>
                <div class="row">
                    <b>Nebenwirkung:</b> <br>
                    <ul>
                        <li>Kopfschmerzen, Schwindel, Schläfrigkeit (insbesondere zu Beginn der Behandlung)</li>
                        <li>Herzklopfen (Palpitationen), Hautrötung mit Wärmegefühl</li>
                        <li>Bauchschmerzen, Übelkeit</li>
                        <li>veränderte Darmentleerungsgewohnheiten, Durchfälle, Verstopfung,
                            Verdauungsstörungen</li>
                        <li>Müdigkeit, Schwächegefühl</li>
                        <li>Sehstörungen, Doppeltsehen</li>
                        <li>Muskelkrämpfe</li>
                    </ul>
                </div>
                <hr>
            </div>
            <div class="row p15" id="gelegentlich-xs">
                <h4> Gelegentlich</h4>
                <div class="row">
                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100 Behandelten
                </div>
                <div class="row">
                    <b>Nebenwirkung:</b> <br>
                    <ul>
                        <li>Stimmungsschwankungen, Angst, Depression, Schlaflosigkeit</li>
                        <li>Zittern, Geschmacksstörungen, kurze Bewusstlosigkeit</li>
                        <li>verminderte Empfindlichkeit für Berührungsreize oder Kribbeln in den Extremitäten,
                            Verlust des Schmerzgefühls</li>
                        <li>Ohrgeräusche</li>
                        <li>niedriger Blutdruck</li>
                        <li>Niesen/laufende Nase durch eine Entzündung der Nasenschleimhaut (Rhinitis)</li>
                        <li>Husten</li>
                        <li>Mundtrockenheit, Erbrechen</li>
                        <li>Haarausfall, vermehrtes Schwitzen, Hautjucken, rote Flecken auf der Haut,
                            Hautverfärbung</li>
                        <li>Störungen beim Wasserlassen, vermehrter nächtlicher Harndrang, häufigeres
                            Wasserlassen</li>
                        <li>Erektionsstörungen, Vergrößerung der Brustdrüsen beim Mann</li>
                        <li>Schmerzen, Unwohlsein</li>
                        <li>Gelenk- oder Muskelschmerzen, Rückenschmerzen</li>
                        <li>Gewichtszunahme oder Gewichtsabnahme</li>
                    </ul>
                </div>
                <hr>
            </div>
            <div class="row p15" id="selten-xs">
                <h4> Selten</h4>
                <div class="row">
                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 1000 Behandelten
                </div>
                <div class="row">
                    <b>Nebenwirkung:</b> <br>
                    Verwirrung
                </div>
                <hr>
            </div>
            <div class="row p15" id="sehrselten-xs">
                <h4> Sehr selten</h4>
                <div class="row">
                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10000 Behandelten
                </div>
                <div class="row">
                    <b>Nebenwirkung:</b> <br>
                    <ul>
                        <li>Verminderung der weißen Blutkörperchen, Verminderung der Blutplättchen, was zu
                            ungewöhnlichen blauen Flecken oder leichtem Bluten führen kann (Schädigung der
                            roten Blutzellen)</li>
                        <li>erhöhter Blutzuckerspiegel (Hyperglykämie)</li>
                        <li>eine Nervenstörung, die zu Schwächegefühl, verminderter Empfindlichkeit für
                            Berührungsreize oder Kribbeln führen kann</li>
                        <li>Schwellung des Zahnfleischs</li>
                        <li>aufgeblähter Bauch (Gastritis)</li>
                        <li>gestörte Leberfunktion, Entzündung der Leber (Hepatitis), Gelbfärbung der Haut
                            (Gelbsucht), Anstieg der Leberenzyme, wodurch bestimmte medizinische Tests
                            beeinflusst werden können</li>
                        <li>erhöhte Muskelanspannung</li>
                        <li>entzündliche Reaktionen der Blutgefäße, häufig mit Hautausschlag</li>
                        <li>Lichtempfindlichkeit</li>
                        <li>Störungen, die sich aus Steifheit, Zittern und/oder Bewegungsstörungen
                            zusammensetzen</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="alert alert-info" style="margin-top: 40px;">
        Wenn Ihnen die sehr seltenen Nebenwirkungen
        Probleme bereitet oder länger als 1 Woche andauert, sollten Sie Ihren Arzt aufsuchen.
    </div>
</div>

',12,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (106,0,'Beispieltext',12,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (107,0,'
<!-- Allgemein -->

<div class="row" style="padding-left: 15px;">
    <h4> Anwendung von Amlodipin (besilat) Dexcel 5 mg </h4>
    <ul>
        <li>Zur Behandlung von hohem Blutdruck (Hypertonie)</li>
        <li>Zur Behandlung einer bestimmten Form von Schmerzen im Brustbereich,
            was als <a class="info_words" type="button" data-toggle="modal" data-target="#angina_pectoris">Angina
                pectoris</a>
            oder, in einers seltenen Form, als <i>vasospastische (Prinzmetal-) Angina </i> bezeichnet wird.
        </li>
    </ul>
</div>

<div class="row" style="padding:30px 0 30px 15px;">
    <table class="sideffect_table">
        <tr>
            <td style="width: 32%;">
                <div class="col-sm-12" style="padding-top:5px"> <b>Patienten mit hohem Blutdruck </b> </div>
            </td>
            <td> Dieses Arzneimittel bewirkt eine Erweiterung der
                Blutgefäße, sodass das Blut leichter durch sie durchfließen kann</td>
        </tr>
        <tr>
            <td>
                <div class="col-sm-12">
                    <b>Patienten mit <a class="info_words" type="button" data-toggle="modal"
                            data-target="#angina_pectoris">Angina pectoris</a></b></div>
            </td>
            <td> Amlodipin (besilat) Dexcel 5 mg wirkt indem es die Blutversorgung des
                Herzmuskels verbessert, der dadurch besser mit Sauerstoff versorgt wird, wodurch
                wiederum die Schmerzen im Brustbereich verhindert werden. </td>
        </tr>
    </table>
</div>

',12,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (109,0,'
Amlodipin (besilat) Dexcel 5 mg Tabletten sind weiße, runde Tabletten.
',12,9);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (110,0,'
Amlodipin (besilat) Dexcel 5 mg Tabletten sind in Packungen mit 7, 10, 14, 20, 28, 30, 50, 60 und 100
Tabletten erhältlich.
Es werden möglicherweise nicht alle Packungsgrößen in den Verkehr gebracht
',12,10);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (111,0,'
1 Tablette enthält 6,935 mg Amlodipin als Besilat, entsprechend 5 mg Amlodipin. <br>
<b>Die sonstigen Bestandteile sind:</b>
<ul>
    <li>mikrokristalline Cellulose</li>
    <li>Calciumhydrogenphosphat-Dihydrat</li>
    <li>Carboxymethylstärke-Natrium (Typ A)</li>
    <li>
        Magnesiumstearat (Ph.Eur.) [pflanzlich]</li>
</ul>
',12,11);
-- Dump tailored_text

--Enalapril--

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (112,0,'Beispieltext1',13,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (113,0,'Beispieltext2',13,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (114,0,'
<div class="row content_header">
    <h1>Warnhinweise und Vorsichtsmaßnahmen
    </h1>
    <hr>
</div>
<div>



    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, bevor Sie enalapril-corax 5 mg einnehmen, wenn Sie an folgenden
    Erkrankungen leiden bzw. folgende Umstände bei Ihnen vorliegen:
    <br><br>
    <div class="row">
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Herzerkrankung</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Erkrankung der Blutgefäße im Gehirn</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Veränderungen in der Blutbildung </b><br>
                    z.B. einer verminderten Anzahl von oder einem
                    Mangel an
                    weißen Blutkörperchen (Neutropenie/Agranulozytose), einer niedrigen Anzahl an Blutplättchen
                    (Thrombozytopenie)
                    oder einer verminderten Anzahl roter Blutkörperchen (Anämie) </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Lebererkrankung</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Leiden an Nierenerkrankung</b> <br>(einschließlich einer Nierenverpflanzung). Dies kann zu
                    erhöhten
                    Kaliumspiegeln im Blut führen, was schwerwiegend sein kann. Ihr Arzt muss möglicherweise die Dosis
                    von
                    ENALAPRIL
                    AL anpassen oder Ihren Kaliumspiegel im Blut überwachen.
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Erhalten von Blutwäsche (Dialyse) </b></div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Kürzlich sehr krank mit übermäßigem Erbrechen oder
                        leiden an starkem
                        Durchfall </b></div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Einhalten einer salzarme Diät</b> <br> Einnahme von
                    Kaliumergänzungsmittel <br>Einnahmen von kaliumsparende Arzneimittel oder
                    Präparate, die Kaliumsalze enthalten</div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Älter als 70 Jahre</b></div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Leiden an Zuckerkrankheit (Diabetes mellitus)</b> <br>
                    Sie sollten Ihr
                    Blut auf niedrige
                    Blutzuckerspiegel
                    überprüfen lassen, besonders im ersten Monat der Behandlung. Der Kaliumspiegel im Blut kann in
                    diesem Fall
                    erhöht sein.</div>
            </div>
        </div>
        <div class="col-sm-6 nopadd">


            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Auftreten einer allergischen Reaktion</b><br>
                    Schwellung an Gesicht,
                    Lippen, Zunge
                    oder
                    Rachen und mit Schluck- oder Atembeschwerden. <br> Bitte beachten Sie, dass Patienten mit schwarzer
                    Hautfarbe ein
                    erhöhtes Risiko haben, so auf ACE-Hemmer zu reagieren.</div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Niedrigen Blutdruck</b><br> (Sie können das eventuell
                    als Schwäche- oder
                    Schwindelgefühl, besonders
                    im
                    Stehen, bemerken)</div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Leiden einer Kollagen-Erkrankung mit
                        Gefäßbeteiligung</b><br> (z.B. Lupus
                    erythematodes, rheumatoide
                    Arthritis oder Sklerodermie), wenn Sie mit Arzneimitteln, die das Immunsystem unterdrücken,
                    behandelt werden
                    oder wenn Sie Allopurinol (Arzneimittel gegen Gicht) oder Procainamid (Arzneimittel gegen
                    Herzrhythmusstörungen)
                    erhalten, bzw. wenn Sie gleichzeitig mehrere der o. g. Risikofaktoren aufweisen</div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Stillen Ihres Kindes oder möchten </b><br> (siehe unter
                    Abschnitt
                    Schwangerschaft und Stillzeit)</div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Anwendung folgender Arzneimittel</b> <br>
                    <ul>
                        <li> Sirolimus, Everolimus und andere Arzneimittel, die zur Klasse der mTOR-Inhibitoren gehören
                            (werden
                            zur
                            Verhinderung einer Abstoßung des Organtransplantats verwendet),</li>
                        Erhöht sich das Risiko eines Angioödems (rasche
                        Schwellung
                        unter der Haut in Bereichen wie dem Rachen)
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange"><b> Einnahme folgenden Arzneimittel zur Behandlung von
                        hohem Blutdruck </b>
                    <ul>
                        <li> einen Angiotensin-II-Rezeptor-AnTagonisten (diese werden auch als Sartane bezeichnet – z.B.
                            Valsartan,
                            Telmisartan, Irbesartan), insbesondere wenn Sie Nierenprobleme aufgrund von Diabetes
                            mellitus haben,
                        </li>

                        <li>Aliskiren.</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>



    <div class="row">
        Ihr Arzt wird gegebenenfalls Ihre Nierenfunktion, Ihren Blutdruck und die Elektrolytwerte (z.B. Kalium) in Ihrem
        Blut in regelmäßigen Abständen überprüfen.<br><br>

        Bitte beachten Sie, dass bei Patienten mit schwarzer Hautfarbe die Blutdrucksenkung durch ACE-Hemmer im
        Vergleich zu Patienten mit nicht schwarzer Hautfarbe weniger stark ist.<br><br>

        Teilen Sie Ihrem Arzt mit, wenn Sie vermuten, schwanger zu sein (oder schwanger werden könnten). Die Einnahme
        von Enalapril AL in der frühen Phase der Schwangerschaft wird nicht empfohlen, und Enalapril AL darf nicht mehr
        nach dem dritten Schwangerschaftsmonat eingenommen werden, da die Einnahme von Enalapril AL in diesem Stadium zu
        schweren Schädigungen Ihres ungeborenen Kindes führen kann (siehe unter Abschnitt 2.: Schwangerschaft und
        Stillzeit).<br><br>

        Wenn Sie sich nicht sicher sind, ob einer oder mehrere der oben genannten Punkte auf Sie zutreffen, wenden Sie
        sich bitte an Ihren Arzt oder Apotheker, bevor Sie Enalapril AL einnehmen.<br><br>
    </div>
    <div class="row">
        WENN SIE EINE BESONDERE BEHANDLUNG ERHALTEN SOLLEN:
        <ul>
            <li>Wenn eine der folgenden Behandlungen für Sie geplant ist, informieren Sie bitte Ihren Arzt, dass Sie
                ENALAPRIL
                AL einnehmen:
                <ul>
                    <li>alle Operationen oder jeder Einsatz von Betäubungs- oder Narkosemitteln (auch beim Zahnarzt),
                    </li>
                    <li> eine Behandlung zur Entfernung von Cholesterin aus dem Blut, die als LDL-Apherese bezeichnet
                        wird,
                    </li>
                    <li> eine Desensibilisierungsbehandlung, um das Ausmaß einer allergischen Reaktion auf Bienen- oder
                        Wespenstiche zu
                        vermindern.</li>
                </ul>
            </li>
            <li> Wenn eine der o. g. Behandlungen oder Eingriffe für Sie geplant ist, sprechen Sie vorher mit Ihrem
                Arzt oder
                Zahnarzt.</li>
        </ul>
    </div>
</div>
<div class="panel-group" id="accordion" style="margin: 30 0 30 0;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse3">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Enalapril ALzusammen mit
                anderen Medikamente
            </h4>
        </div>
        <div id="collapse3" class="panel-collapse collapse in">
            <div class="panel-body">
                Informieren Sie Ihren Arzt oder Apotheker, wenn Sie andere Arzneimittel anwenden, kürzlich andere
                Arzneimittel angewendet haben oder beabsichtigen, andere Arzneimittel anzuwenden.
                <br><br>
                Einige Arzneimittel können in ihrer Wirkung durch Enalapril AL beeinflusst werden, sowie auch andere
                Arzneimittel die Wirkung von Enalapril AL beeinflussen können. Daher ist es wichtig, Ihren Arzt oder
                Apotheker zu informieren, insbesondere wenn Sie eines oder mehrere der folgenden Arzneimittel einnehmen
                oder anwenden:
                <ul>
                    <li> andere blutdrucksenkende Arzneimittel, wie z.B. Betablocker oder harntreibende Arzneimittel
                        (Diuretika),</li>
                    <li> Kalium-Ergänzungsmittel oder kaliumhaltige Salzersatzstoffe, Diuretika (Wassertabletten,
                        insbesondere jene, die als kaliumsparend bezeichnet werden), andere Arzneimittel, die den
                        Kaliumspiegel in Ihrem Körper erhöhen können (wie Heparin und Co-Trimoxazol, auch bekannt als
                        Trimethoprim/ Sulfamethoxazol),</li>
                    <li> Arzneimittel zur Behandlung der Zuckerkrankheit (einschließlich blutzuckersenkender
                        Arzneimittel zur
                        Einnahme und Insulin),</li>
                    <li> Lithium (Arzneimittel gegen bestimmte Depressionen),</li>
                    <li> Arzneimittel gegen Depressionen, die als trizyklische Antidepressiva bezeichnet werden,</li>
                    <li> Arzneimittel zur Behandlung seelischer Probleme, die als Antipsychotika bezeichnet werden,</li>
                    <li> bestimmte Arzneimittel zur Behandlung von Husten und Erkältungen oder Arzneimittel zur
                        Gewichtsabnahme, die einen als „Sympathomimetikum“ bezeichneten Stoff enthalten,</li>
                    <li> bestimmte Arzneimittel zur Behandlung von Schmerzen oder Gelenkerkrankungen, darunter auch
                        Goldpräparate,</li>
                    <li> Acetylsalicylsäure (z.B. Aspirin),</li>
                    <li>Arzneimittel zur Auflösung von Blutgerinnseln (Thrombolytika),</li>
                    <li> Alkohol,</li>
                    <li> Arzneimittel, die sehr oft zur Verhinderung einer Abstoßung des Organtransplantats verwendet
                        werden
                        (Sirolimus, Everolimus und andere Arzneimittel, die zur Klasse der mTORInhibitoren gehören).
                        Siehe
                        unter Abschnitt 2.: Warnhinweise und Vorsichtsmaßnahmen.</li>
                </ul>
                Ihr Arzt muss unter Umständen Ihre Dosierung anpassen und/ oder sonstige Vorsichtsmaßnahmen treffen:
                <ul>
                    <li>
                        wenn Sie einen Angiotensin-II-Rezeptor-AnTagonisten oder Aliskiren einnehmen (siehe unter
                        Abschnitt 2.:
                        „Enalapril AL darf NICHT eingenommen werden“ und „Warnhinweise und Vorsichtsmaßnahmen“).</li>
                </ul>
                Wenn Sie sich nicht sicher sind, ob einer oder mehrere der oben genannten Punkte auf Sie zutreffen,
                wenden Sie sich bitte an Ihren Arzt oder Apotheker, bevor Sie Enalapril AL einnehmen.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse4">
                <img width="40" src="./../../assets/icons/16.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Enalapril ALzusammen mit
                Nahrungsmitteln und
                Getränken
            </h4>
        </div>
        <div id="collapse4" class="panel-collapse collapse">
            <div class="panel-body">
                Enalapril AL kann mit oder ohne Nahrung eingenommen werden. Die meisten Patienten nehmen Enalapril AL
                mit etwas Wasser ein.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse5">
                <img width="40" src="./../../assets/icons/8.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Schwangerschaft und Stillzeit
            </h4>
        </div>
        <div id="collapse5" class="panel-collapse collapse">
            <div class="panel-body">
                Wenn Sie schwanger sind oder stillen, oder wenn Sie vermuten, schwanger zu sein oder beabsichtigen,
                schwanger zu werden, fragen Sie vor der Anwendung dieses Arzneimittels Ihren Arzt oder Apotheker um Rat.
                <h4>Schwangerschaft</h4>
                Teilen Sie Ihrem Arzt mit, wenn Sie vermuten, schwanger zu sein (oder schwanger werden könnten). In der
                Regel wird Ihr Arzt Ihnen empfehlen, Enalapril AL vor einer Schwangerschaft bzw. sobald Sie wissen, dass
                Sie schwanger sind, abzusetzen, und er wird Ihnen ein anderes Arzneimittel empfehlen. Die Anwendung von
                Enalapril AL in der frühen Schwangerschaft wird nicht empfohlen und Enalapril AL darf nicht mehr nach
                dem dritten Schwangerschaftsmonat eingenommen werden, da die Einnahme von Enalapril AL in diesem Stadium
                zu schweren Schädigungen Ihres ungeborenen Kindes führen kann.</br>
                <h4>Stillzeit</h4>
                Teilen sie Ihrem Arzt mit, wenn Sie stillen oder mit dem Stillen beginnen wollen. Das Stillen von
                Neugeborenen (in den ersten Wochen nach der Geburt) und besonders von Frühgeburten wird nicht empfohlen,
                wenn Sie Enalapril AL einnehmen.
                <br>
                Bei älteren Säuglingen sollte der Arzt Sie über Nutzen und mögliche Schäden der Anwendung von ENALAPRIL
                AL in der Stillzeit im Vergleich zu Behandlungsalternativen aufklären.
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse6">
                <img width="40" src="./../../assets/icons/3.svg" /><span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Verkehrstüchtigkeit und Fähigkeit zum Bedienen von Maschinen
            </h4>
        </div>
        <div id="collapse6" class="panel-collapse collapse">
            <div class="panel-body">Sie können unter der Behandlung Schwindel oder Müdigkeit spüren. Wenn dies der Fall
                ist, sollten Sie kein Fahrzeug steuern oder Werkzeuge bzw. Maschinen bedienen. </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse7">
                <img width="40" src="./../../assets/icons/15.svg" /><span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Enalapril AL enthält Lactose
            </h4>
        </div>
        <div id="collapse7" class="panel-collapse collapse">
            <div class="panel-body">Bitte nehmen Sie Enalapril AL daher erst nach Rücksprache mit Ihrem Arzt ein, wenn
                Ihnen bekannt ist, dass Sie unter einer Unverträglichkeit gegenüber bestimmten Zuckern leiden.

            </div>
        </div>
    </div>
</div>
</div>
<h3 class="not_take"><i class="fas fa-bolt bolt_red" aria-hidden="true"></i> <br> Enalapril AL(besilat) Dexcel 5 mg
    nicht
    einnehmen </h3>
<div class="row">
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse">
                Allergie gegen Enalaprilmaleat, einen anderen ACE-Hemmer oder einen der sonstigen
                Bestandteile, wie Croscarmellose-Natrium, Lactose-Monohydrat, Magnesiumstearat (Ph. Eur.),
                vorverkleisterte Maisstärke, Natriumhydrogencarbonat dieses Arzneimittels sind
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12 info_notuse"> Wenn bei Ihnen während einer früheren Behandlung mit einem ACE-Hemmer
                Gewebeschwellungen (angioneurotische Ödeme) auftraten wenn Sie eine vererbte Neigung zu
                Gewebeschwellungen oder Gewebeschwellungen aus unbekannter Ursache haben (hereditäres oder
                idiopathisches Angioödem)</div>
        </div>
    </div>
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse">Wenn Sie mehr als drei Monate schwanger sind. (Es wird empfohlen,
                Enalapril AL 5mg auch in der frühen Phase der Schwangerschaft nicht anzuwenden, siehe Abschnitt
                Schwangerschaft, Stillzeit und Zeugungs-/Gebärfähigkeit).</div>
        </div>

    </div>
</div>
',13,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic, address) VALUES (115,0,'Beispieltext',13,4, '
<div class="row">
    <div class="col-md-9">
        <h3>Pharmazeutischer Unternehmer </h3>
        <p> ALIUD PHARMA® GmbH

            <br />
            Gottlieb-Daimler-Straße 19
            <br />
            89150 Laichingen
            <br />
            <b>Tel.:</b> +49 7333 9651-0<br />
            <b>Fax:</b> +49 7333 9651-4000<br />
            <b>E-mail:</b> info@aliud.de<br />
            <b>Web:</b> https://www.aliud.de/<br />

        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/aliud_pharma.png" />
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <h3>Hersteller </h3>
        <p> STADA Arzneimittel AG
            <br />
            Stadastraße 2-18
            <br />
            61118 Bad Vilbel
            <br />
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/stada.png" />
    </div>
</div>');
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (116,0,'
<div class="row">
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    <ol>
        <li>Nehmen Sie dieses Arzneimittel immer genau nach Absprache mit Ihrem Arzt oder Apotheker ein.</li>
        <li>Fragen Sie bei Ihrem Arzt oder Apotheker nach, wenn Sie sich nicht sicher sind.</li>
        <li> Es ist sehr wichtig, dass Sie Enalapril AL 5mg einnehmen, solange es Ihnen Ihr Arzt verordnet.</li>
    </ol>
</div>
<div class="row content_header">
    <h3 class="modal-title xs-center">Dosierung</h3>
    <hr />
    <div class=" with-nav-tabs panel-default">
        <div style="height: inherit;">
            <ul class="nav nav-tabs nav1-tabs">
                <li class="active"><a href="#tab1default" data-toggle="tab">Bluthochdruck</a></li>
                <li><a href="#tab3default" data-toggle="tab">Eingeschränkte Nierenfunktion</a></li>
                <li><a href="#tab4default" data-toggle="tab">Ältere Patienten</a></li>
                <li><a href="#tab2default" data-toggle="tab"> Herzleistungsschwäche / Funktionsstörung der linken
                        Herzkammer
                    </a>
                </li>

            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <h4>Anfangsdosis</h4>
                        <hr>
                        <table class="sideffect_table ">

                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>5mg</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich (siehe Aufteilung des Dosis)</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        20mg pro Tag </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>je nach Schweregrad der Erkrankung und Ihrem Zustand</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row content_header">
                        <h4> Leichter Bluthochdruck </h4>
                        <hr>
                        <table class="sideffect_table ">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th style="width: 26%;">Anfangsdosis</th>
                                    <th>Patienten mit stark aktiviertem blutdruckregulierendem System
                                        <span class="tooltip">(z.B)
                                            <span class="tooltiptext">bei Bluthochdruck aufgrund einer
                                                Nierenerkrankung, Salz- und/oder Flüssigkeitsmangel, nicht
                                                ausgeglichener
                                                Herzleistungsschwäche oder
                                                schwerem Bluthochdruck</span>
                                        </span>

                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>5mg (1 Tablette) - 10mg (2 Tabletten) </td>
                                    <td>5mg oder einer geringeren Dosis</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich </td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        10mg pro Tag </td>
                                    <td>5mg pro Tag</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td></td>
                                    <td>Bei Therapiebeginn kann
                                        es zu einem übermäßigen Blutdruckabfall kommen; eine engmaschige ärztliche
                                        Überwachung ist
                                        erforderlich.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row content_header">
                        <h4> Patienten mit vorausgegangener Therapie mit hoch dosierten harntreibenden Arzneimitteln
                            (Diuretika)</h4>
                        <hr>
                        <table class="sideffect_table ">

                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>5mg oder einer geringeren Dosis</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>

                                    <td>5mg pro Tag</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>Eine vorausgegangene Therapie mit hoch
                                        dosierten harntreibenden Arzneimitteln kann zu einem Flüssigkeitsmangel führen,
                                        so
                                        dass die Gefahr
                                        eines Blutdruckabfalls bei Therapiebeginn besteht. Wenn möglich sollten diese
                                        Arzneimittel 2-3 Tage
                                        lang abgesetzt werden, bevor die Therapie mit Enalapril AL 5mg eingeleitet wird.
                                        Die
                                        Nierenfunktion und die Kaliumwerte im Blut sollten überwacht werden.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row content_header">
                        <h4> Erhaltungsdosis</h4>
                        <hr>
                        <table class="sideffect_table ">

                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>20mg </td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>40mg pro Tag</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>Für die höheren
                                        Dosierungen stehen Tabletten mit geeigneter Wirkstoffstärke zur Verfügung.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab2default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <h4>Anfangsdosis</h4>
                        <hr>
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>2,5mg</td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        20mg pro Tag </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>Enalapril AL 5 mg wird bei der Behandlung der Herzleistungsschwäche
                                        üblicherweise
                                        zusätzlich zu harntreibenden Arzneimitteln und Digitalis oder Betablockern
                                        angewendet. <br>
                                        Die
                                        Therapie ist unter engmaschiger ärztlicher Überwachung einzuleiten, um die
                                        anfängliche Wirkung auf
                                        den Blutdruck zu ermitteln.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="row content_header">
                        <h4> Erhaltungsdosis</h4>
                        <hr>
                        Zu Beginn der Therapie mit Enalapril AL 5mg kann es bei Patienten mit
                        Herzleistungsschwäche zu einem Blutdruckabfall kommen.<br>Wenn dieser behoben ist, sollte die
                        Dosis
                        schrittweise über einen Zeitraum von 2-4 Wochen auf die Erhaltungsdosis von 20 mg
                        Enalaprilmaleat
                        täglich gesteigert werden.
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Dosis</b></td>
                                    <td>20mg </td>
                                </tr>
                                <tr>
                                    <td> <b>Wie oft?</b></td>
                                    <td>1x täglich</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>

                                    <td>40mg pro Tag</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Hinweis</b> </td>
                                    <td>Diese Dosis kann als Einzeldosis eingenommen oder auf zwei Gaben verteilt
                                        werden, je nach Verträglichkeit.
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <br> Für die höheren Dosierungen stehen Tabletten mit
                        geeigneter Wirkstoffstärke zur Verfügung. Sie sollten besonders vorsichtig sein, wenn Sie Ihre
                        erste
                        Dosis einnehmen oder wenn Ihre Dosis erhöht wird. Teilen Sie Ihrem Arzt unverzüglich mit, wenn
                        Sie
                        sich benommen oder schwindlig fühlen. Vor und nach Beginn der Einnahme von Enalapril AL 5mg
                        sollten Blutdruck und Nierenfunktion engmaschig überwacht werden, da über Blutdruckabfall und
                        (seltener) nachfolgendem Nierenversagen berichtet wurde. <br>Wenn Sie mit harntreibenden
                        Arzneimitteln
                        behandelt werden, sollte – falls möglich – deren Dosis vor Beginn der Einnahme von Enalapril AL
                        5
                        mg verringert werden. <br> Ein Blutdruckabfall bei Therapiebeginn mit Enalapril AL 5mg bedeutet
                        nicht, dass auch während der Dauerbehandlung mit Enalapril AL 5mg solche Reaktionen auftreten
                        werden und schließt die Weiterbehandlung mit dem Arzneimittel nicht aus. Die Kaliumwerte im Blut
                        und
                        die Nierenfunktion sollten ebenfalls überwacht werden.
                    </div>
                </div>
                <div class="tab-pane fade" id="tab3default">Grundsätzlich sollten die Abstände zwischen den
                    Anwendungen
                    von Enalapril AL 5mg verlängert werden und/oder die Dosis reduziert werden. Ihr Arzt wird Ihre
                    Behandlung individuell festlegen. <br>
                    <ul>
                        <li><b>Bei mäßiger Einschränkung der Nierenfunktion</b> </br>
                            <table class="sideffect_table ">
                                <tbody>
                                    <tr>
                                        <td> <b>Dosis</b></td>
                                        <td>5-10 mg </td>
                                    </tr>
                                    <tr>
                                        <td> <b>Wie oft?</b></td>
                                        <td>1x täglich</td>

                                    </tr>

                                </tbody>
                            </table>
                        </li>
                        <li><b> Bei schwerer Nierenfunktionseinschränkung</b> </br>
                            <table class="sideffect_table ">

                                <tbody>
                                    <tr>
                                        <td> <b>Dosis</b></td>
                                        <td>2,5 mg </td>
                                    </tr>
                                    <tr>
                                        <td> <b>Wie oft?</b></td>
                                        <td>1x täglich</td>

                                    </tr>

                                </tbody>
                            </table>
                        </li>
                        <li><b>Für Dialysepatienten</b> </br>
                            <table class="sideffect_table ">

                                <tbody>
                                    <tr>
                                        <td> <b>Dosis</b></td>
                                        <td>2,5 mg </td>
                                    </tr>
                                    <tr>
                                        <td> <b>Wie oft?</b></td>
                                        <td>1x täglich (an Dialyse-Tagen)</td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <b>Hinweis</b> </td>
                                        <td>An dialysefreien Tagen richtet
                                            sich
                                            die Dosis nach der Blutdrucksenkung.
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </li>
                    </ul>
                </div>
                <div class="tab-pane fade" id="tab4default">Die Dosis sollte sich nach der Nierenfunktion des
                    Patienten
                    richten.<br>

                    Ihr Arzt wird Ihre anfängliche Dosis individuell nach Ihrem Gesundheitszustand und dem
                    Schweregrad
                    Ihrer Erkrankung wählen und entsprechend der Wirkung des Arzneimittels auf Ihren Blutdruck die
                    Dosis
                    schrittweise anpassen.<br>

                    Die Tabletten können in gleiche Hälften geteilt werden.</div>
            </div>
        </div>
    </div>


</div>

<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Art und Dauer der Anwendung</h3>
    <hr />

    <div class="row text-center">
        <div class="col-sm-6">
            <i style="font-size:40px;    color: #575858;" class="fas fa-glass-whiskey"></i><br> <br>
            Nehmen Sie die Tabletten unzerkaut mit ausreichend Flüssigkeit (z. B. einem Glas Wasser) ein. Die
            Einnahme
            kann unabhängig von den Mahlzeiten erfolgen. </div>
        <div class="col-sm-6">
            <i style="font-size:40px;    color: #575858;" class="fas fa-user-md"></i>
            <br>
            <br> Die Dauer der Behandlung bestimmt Ihr Arzt. Die Behandlung mit Enalapril AL 5mg ist in der Regel
            eine
            Langzeittherapie. <br>

            Bitte sprechen Sie mit Ihrem Arzt, wenn Sie den Eindruck haben, dass die Wirkung von Enalapril AL 5mg zu
            stark oder zu schwach ist.
        </div>
    </div>

    <div  class="row hidden-xs" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4>Gleiche Aufteilung der Dosen</h4>
            <table class="sideffect_table">
                <thead class="text-center">
                    <tr>
                        <th>Anzahl der Einnahmen pro Tag </th>
                        <th>Morgens <br> zum Frühstück</th>
                        <th>Mittags <br> zum Mittagessen</th>
                        <th>Abends <br> zum Abendessen</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <tr>
                        <td>
                            1x
                        </td>
                        <td>
                            X
                        </td>
                        <td>

                        </td>
                        <td>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            2x
                        </td>
                        <td>
                            X
                        </td>
                        <td>

                        </td>
                        <td>
                            X
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>



    <div class="row" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4 class="modal-title xs-center">Teilung der Tablette</h4>
            <hr />

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>

                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-caption">
                            <h4> Schritt 1</h4>
                            <img src="./../../assets/p_form/usage/notcrack_small.svg" class="usage_tab" alt="Tablette"
                            title="Tablette">
                        <br><br>
                        <p>Legen Sie bitte die Tablette mit der Bruchkerbe nach oben auf eine feste Unterlage.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 2</h4>
                            <img src="./../../assets/p_form/usage/crack_small.svg" class="usage_tab1" alt="Tablette"
                            title="Tablette">
                        <br><br>
                        <p>Drücken Sie mit den Zeigefingern auf die linke und rechte Hälfte der Tablette.</p>
                        </div>
                    </div>

                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right">
                        </span></a>
                </div>
            </div>

        </div>
    </div>

</div>
<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Weitere Informationen</h3>
    <hr />
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingOne">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseOne1">
                        Wenn Sie eine größere Menge Enalapril AL 5mg eingenommen haben, als Sie sollten

                    </h4>
                </div>
                <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <p>Wenn Sie durch ein Versehen zu viele Tabletten eingenommen haben oder ein Kind einige
                            Tabletten geschluckt hat, wenden Sie sich sofort an einen Arzt/Notarzt. Dieser kann
                            entsprechend der Schwere der Vergiftung über die erforderlichen Maßnahmen entscheiden.
                            In
                            Abhängigkeit vom Ausmaß der Überdosierung sind folgende Symptome möglich: Starker
                            Blutdruckabfall, Kreislaufversagen, beschleunigter oder verlangsamter Herzschlag,
                            Herzklopfen, Nierenversagen, Atembeschleunigung, Schwindel, Angstgefühl und Husten. Bei
                            Verdacht auf eine Überdosierung benötigen Sie ärztliche Hilfe!
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingTwo">
                    <h4 class="panel-title title_pan text-center-xs" data-toggle="collapse" data-target="#collapseTwo2">
                        Wenn Sie die Einnahme von Enalapril AL 5mg vergessen haben
                    </h4>
                </div>
                <div id="collapseTwo2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <p>Nehmen Sie beim nächsten Mal nicht zusätzlich mehr Tabletten ein, sondern setzen Sie die
                            Einnahme von Enalapril AL 5mg wie verordnet fort.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="headingThree">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseThree3">

                        Wenn Sie die Einnahme von Enalapril AL 5mg abbrechen
                    </h4>
                </div>
                <div id="collapseThree3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <p>Unterbrechen oder beenden Sie die Behandlung mit Enalapril AL 5mg nicht ohne Rücksprache
                            mit Ihrem behandelnden Arzt! Bei Patienten mit Bluthochdruck kann der Blutdruck erneut
                            ansteigen und bei Patienten mit Herzleistungsschwäche können die Symptome wieder
                            auftreten.

                            Wenn Sie weitere Fragen zur Anwendung dieses Arzneimittels haben, wenden Sie sich an
                            Ihren
                            Arzt oder Apotheker.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
',13,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (117,0,'
<div class="row content_header">
    <h1> Nebenwirkungen </h1>
    <hr>
</div>
<div class="row">
    Wie alle Arzneimittel kann auch dieses Arzneimittel Nebenwirkungen haben, die aber nicht
    bei jedem auftreten müssen.
</div>
<div class="row" style="margin-top: 30px;">
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead1">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben1">
                        Erkrankungen des Blutes-und Lymphsystems
                    </h4>
                </div>
                <div id="neben1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="nebenhead1">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Blutarmut durch vermehrten Zerfall roter Blutkörperchen (hämolytische
                                        Anämie),
                                        Blutarmut durch Blutbildungsstörung im Knochenmark (aplastische Anämie)
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Verminderung der Anzahl bestimmter Blutzellen (Neutropenie,
                                        Thrombozytopenie,
                                        Panzytopenie) bis zu einer hochgradigen Verminderung bestimmter weißer
                                        Blutkörperchen mit Infektneigung und schweren Allgemeinsymptomen
                                        (Agranulozytose), Abnahme bestimmter Laborwerte (Hämoglobin und Hämatokrit),
                                        herabgesetzte Funktion des Knochenmarks (Knochenmarksdepression),
                                        Lymphknotenschwellung, Autoimmunkrankheiten. </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Blutarmut durch vermehrten Zerfall roter Blutkörperchen (hämolytische
                                        Anämie),
                                        Blutarmut durch Blutbildungsstörung im Knochenmark (aplastische Anämie)

                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 1000
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Verminderung der Anzahl bestimmter Blutzellen (Neutropenie,
                                        Thrombozytopenie,
                                        Panzytopenie) bis zu einer hochgradigen Verminderung bestimmter weißer
                                        Blutkörperchen mit Infektneigung und schweren Allgemeinsymptomen
                                        (Agranulozytose), Abnahme bestimmter Laborwerte (Hämoglobin und Hämatokrit),
                                        herabgesetzte Funktion des Knochenmarks (Knochenmarksdepression),
                                        Lymphknotenschwellung, Autoimmunkrankheiten. </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead2">
                    <h4 class="panel-title title_pan text-center-xs" data-toggle="collapse" data-target="#neben2">
                        Stoffwechsel- und Ernährungsstörungen
                    </h4>
                </div>
                <div id="neben2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead2">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Zu niedrige Blutzuckerwerte (Hypoglykämie).
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Zu niedrige Blutzuckerwerte (Hypoglykämie).

                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead3">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben3">
                        Augenerkrankungen
                    </h4>
                </div>
                <div id="neben3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead3">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="sehrhaeufig">
                                    <td>Sehr häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten</td>
                                    <td>Verschwommensehen
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="sehrhaeufig-xs">
                                    <h4> Sehr häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>Verschwommensehen
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead4">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben4">
                        Herz-Kreislauf-System
                    </h4>
                </div>
                <div id="neben4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead4">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="sehrhaeufig">
                                    <td>Sehr häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten</td>
                                    <td>Schwindel
                                    </td>
                                </tr>
                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Übermäßige Blutdrucksenkung einschließlich übermäßiger Blutdruckabfall bei
                                        Lagewechsel vom Liegen zum Stehen (orthostatische Hypotonie), kurzzeitiger
                                        Bewusstseinsverlust (Synkope), Herzinfarkt oder Schlaganfall, vermutlich
                                        infolge
                                        übermäßigen Blutdruckabfalls bei gefährdeten Patienten (Patienten mit
                                        Durchblutungsstörungen im Bereich des Herzens und/oder des Gehirns),
                                        Schmerzenim
                                        Brustkorb, Herzrhythmusstörungen, Herzengegefühl (Angina pectoris),
                                        beschleunigter Herzschlag (Tachykardie).
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Übermäßiger Blutdruckabfall bei Lagewechsel vom Liegen zum Stehen
                                        (orthostatische Hypotonie), Herzklopfen.
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Durch Gefäßkrämpfe bedingte Durchblutungsstörungen an Händen und Füßen
                                        (Raynaud-Phänomen). </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="sehrhaeufig-xs">
                                    <h4> Sehr häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>Schwindel
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Übermäßige Blutdrucksenkung einschließlich übermäßiger Blutdruckabfall bei
                                        Lagewechsel vom Liegen zum Stehen (orthostatische Hypotonie), kurzzeitiger
                                        Bewusstseinsverlust (Synkope), Herzinfarkt oder Schlaganfall, vermutlich
                                        infolge
                                        übermäßigen Blutdruckabfalls bei gefährdeten Patienten (Patienten mit
                                        Durchblutungsstörungen im Bereich des Herzens und/oder des Gehirns),
                                        Schmerzenim
                                        Brustkorb, Herzrhythmusstörungen, Herzengegefühl (Angina pectoris),
                                        beschleunigter Herzschlag (Tachykardie).
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Übermäßiger Blutdruckabfall bei Lagewechsel vom Liegen zum Stehen
                                        (orthostatische Hypotonie), Herzklopfen.
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 1000
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Durch Gefäßkrämpfe bedingte Durchblutungsstörungen an Händen und Füßen
                                        (Raynaud-Phänomen).
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead5">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben5">
                        Erkrankungen der Atemwege, des Brustraums und Mediastinums
                    </h4>
                </div>
                <div id="neben5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead5">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="sehrhaeufig">
                                    <td>Sehr häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten</td>
                                    <td>Übelkeit
                                    </td>
                                </tr>
                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Durchfall, Bauchschmerzen, Geschmacksveränderungen.
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Darmverschluss (Ileus), Entzündung der Bauchspeicheldrüse,
                                        Erbrechen,
                                        Verdauungsstörungen, Verstopfung, Appetitlosigkeit,
                                        Magenreizung,
                                        Mundtrockenheit, Magengeschwür (peptisches Ulkus).
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Entzündungen der Mundschleimhaut mit Geschwürbildung
                                        (Stomatitis/aphthöse
                                        Ulzerationen), Entzündungen der Zungenschleimhaut
                                        (Glossitis). </td>
                                </tr>
                                <tr id="sehrselten">
                                    <td>Sehr selten</td>
                                    <td> Bis zu 1 von 10.000 Behandelten </td>
                                    <td>
                                        Gewebeschwellung des Darms (intestinales angioneurotisches
                                        Ödem).
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="sehrhaeufig-xs">
                                    <h4> Sehr häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>Übelkeit
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Durchfall, Bauchschmerzen, Geschmacksveränderungen.

                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Darmverschluss (Ileus), Entzündung der Bauchspeicheldrüse,
                                        Erbrechen, Verdauungsstörungen, Verstopfung,
                                        Appetitlosigkeit, Magenreizung, Mundtrockenheit,
                                        Magengeschwür (peptisches Ulkus).
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Entzündungen der Mundschleimhaut mit Geschwürbildung
                                        (Stomatitis/aphthöse Ulzerationen), Entzündungen der
                                        Zungenschleimhaut (Glossitis).
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="sehrselten-xs">
                                    <h4> Sehr selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Gewebeschwellung des Darms (intestinales angioneurotisches Ödem).
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead6">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben6">
                        Leber- und Gallenerkrankungen
                    </h4>
                </div>
                <div id="neben6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead6">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Leberversagen, Leberentzündung (Hepatitis - hepatozellulär oder
                                        cholestatisch,
                                        einschließlich hepatische Nekrose), Gelbsucht. </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Leberversagen, Leberentzündung (Hepatitis - hepatozellulär oder
                                        cholestatisch,
                                        einschließlich hepatische Nekrose), Gelbsucht.
                                    </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead7">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben7">
                        Erkrankungen der Haut und des Unterhautzellgewebes
                    </h4>
                </div>
                <div id="neben7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead7">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Ausschlag, Überempfindlichkeit/Gewebeschwellung (angioneurotisches Ödem):
                                        angioneurotische Ödeme mit Beteiligung von Gesicht, Gliedmaßen, Lippen,
                                        Zunge,
                                        Stimmapparat des Kehlkopfes (Glottis) und/oder Kehlkopf wurden beobachtet.
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Vermehrtes Schwitzen, Juckreiz, Nesselsucht, Haarausfall. Selten:
                                        Schwerwiegende
                                        Hautreaktionen (Erythema multiforme, Stevens-Johnson-Syndrom, exfoliative
                                        Dermatitis, toxische epidermale Nekrolyse, Pemphigus, Erythroderma).
                                    </td>
                                </tr>
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Ein Symptomenkomplex wurde beschrieben, der mit einigen oder allen der
                                        folgenden
                                        Nebenwirkungen einhergehen kann: Fieber, Entzündung seröser Häute
                                        (Serositis),
                                        Gefäßentzündung (Vaskulitis), Muskel- und Gelenkschmerzen/Muskel- und
                                        Gelenkentzündungen (Myalgien/Myositis, Arthralgien/Arthritis) und bestimmten
                                        Laborwertveränderungen (positive ANA-Titer, erhöhte
                                        Blutkörperchensenkungsgeschwindigkeit, Eosinophilie und Leukozytose).
                                        Hautausschlag, Lichtempfindlichkeit oder andere Reaktionen der Haut können
                                        auftreten.
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Ausschlag, Überempfindlichkeit/Gewebeschwellung (angioneurotisches Ödem):
                                        angioneurotische Ödeme mit Beteiligung von Gesicht, Gliedmaßen, Lippen,
                                        Zunge,
                                        Stimmapparat des Kehlkopfes (Glottis) und/oder Kehlkopf wurden beobachtet.
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Vermehrtes Schwitzen, Juckreiz, Nesselsucht, Haarausfall. Selten:
                                        Schwerwiegende
                                        Hautreaktionen (Erythema multiforme, Stevens-Johnson-Syndrom, exfoliative
                                        Dermatitis, toxische epidermale Nekrolyse, Pemphigus, Erythroderma).
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Ein Symptomenkomplex wurde beschrieben, der mit einigen oder allen der
                                        folgenden
                                        Nebenwirkungen einhergehen kann: Fieber, Entzündung seröser Häute
                                        (Serositis),
                                        Gefäßentzündung (Vaskulitis), Muskel- und Gelenkschmerzen/Muskel- und
                                        Gelenkentzündungen (Myalgien/Myositis, Arthralgien/Arthritis) und bestimmten
                                        Laborwertveränderungen (positive ANA-Titer, erhöhte
                                        Blutkörperchensenkungsgeschwindigkeit, Eosinophilie und Leukozytose).
                                        Hautausschlag, Lichtempfindlichkeit oder andere Reaktionen der Haut können
                                        auftreten.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead8">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben8">
                        Erkrankungen der Nieren und Harnwege
                    </h4>
                </div>
                <div id="neben8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead8">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Nierenfunktionsstörungen, Nierenversagen, vermehrte Eiweißausscheidung im
                                        Urin
                                        (Proteinurie).
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Verminderte Harnausscheidung </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Nierenfunktionsstörungen, Nierenversagen, vermehrte Eiweißausscheidung im
                                        Urin
                                        (Proteinurie).
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Verminderte Harnausscheidung
                                    </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead9">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben9">
                        Erkrankungen der Geschlechtsorgane und der Brustdrüse
                    </h4>
                </div>
                <div id="neben9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead9">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Impotenz
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>Vergrößerung der Brust bei Männern (Gynäkomastie). </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Impotenz
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Vergrößerung der Brust bei Männern (Gynäkomastie). </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead10">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben10">
                        Allgemeine Erkrankungen und Beschwerden am Verabreichungsort
                    </h4>
                </div>
                <div id="neben10" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead10">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="sehrhaeufig">
                                    <td>Sehr häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten</td>
                                    <td>Schwächegefühl
                                    </td>
                                </tr>
                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Müdigkeit
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Muskelkrämpfe, Gesichtsrötung (Flush), Ohrgeräusche (Tinnitus), Unwohlsein,
                                        Fieber.
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="sehrhaeufig-xs">
                                    <h4> Sehr häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>Schwächegefühl
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Müdigkeit
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Muskelkrämpfe, Gesichtsrötung (Flush), Ohrgeräusche (Tinnitus), Unwohlsein,
                                        Fieber. </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading head_panel" role="tab" id="nebenhead11">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben11">
                        Untersuchungen
                    </h4>
                </div>
                <div id="neben11" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead11">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Anstieg der Kaliumwerte im Blut, Anstieg der Kreatininwerte im Blut.
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Anstieg des Harnstoffs im Blut, Abnahme der Natriumwerte im Blut.
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td>
                                        Erhöhte Leberwerte (Leberenzyme, Serum-Bilirubin).</td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Anstieg der Kaliumwerte im Blut, Anstieg der Kreatininwerte im Blut.
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Anstieg des Harnstoffs im Blut, Abnahme der Natriumwerte im Blut.
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Erhöhte Leberwerte (Leberenzyme, Serum-Bilirubin).
                                    </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</div>
</div>

<div class="row">
    <div class="alert alert-info" style="margin-top: 40px;">
        <h4>Gegenmaßnahmen</h4>
        <ul>
            <li><b>Schwerwiegende Hautreaktion</b> <br>
                Falls Sie den Verdacht haben, dass sich bei Ihnen eine schwerwiegende Hautreaktion entwickelt, müssen
                Sie sofort
                Ihren Arzt aufsuchen und gegebenenfalls die Behandlung mit Enalapril AL 5mg abbrechen.
            </li>
            <li>
                <b>Gewebeschwellung</b> <br>
                Eine Gewebeschwellung (angioneurotisches Ödem) mit Beteiligung von Kehlkopf, Stimmapparat des Kehlkopfes
                und/oder Zunge muss von Ihrem
                Arzt sofort mit Notfallmedikamenten behandelt werden.
            </li>
            <li><b>Gelbsucht</b> <br>
                Wenn bei Ihnen eine Gelbsucht auftritt oder die
                Leberenzymwerte bei Ihnen deutlich ansteigen, müssen Sie die Behandlung abbrechen, und Ihr Arzt wird Sie
                überwachen.
            </li>
            <li><b>Fieber, Lymphknotenschwellungen und/oder Halsentzündung</b> <br>
                Beim Auftreten von Fieber, Lymphknotenschwellungen und/oder Halsentzündung benachrichtigen Sie bitte
                umgehend Ihren Arzt, damit er das weiße Blutbild untersuchen kann.
            </li>
            <li><b>Sonstige</b><br>
                Sollten Sie die oben genannten Nebenwirkungen
                bei sich beobachten, benachrichtigen Sie Ihren Arzt. Er wird über den Schweregrad und gegebenenfalls
                über
                erforderliche weitere Maßnahmen entscheiden.
            </li>
        </ul>
    </div>
</div>
',13,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (118,0,'Beispieltext',13,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (119,0,'
<!-- Allgemein -->
<div class="row" style="padding-left: 15px;">
    <h4> Anwendung von Enalapril AL </h4>
    <ul>
        <li> Zur Behandlung von Bluthochdruck (Hypertonie).
        </li>
        <li> Zur Behandlung der Herzleistungsschwäche (Herzinsuffizienz). Es kann die Notwendigkeit von
            Krankenhauseinweisungen verringern und bei einigen Patienten lebensverlängernd wirken.
        </li>
        <li> Zur Vorbeugung der Entwicklung von Krankheitszeichen einer Herzleistungsschwäche, wie z.B.
            <ul>
                <li>Kurzatmigkeit</li>
                <li>Ermüdung bereits nach leichter körperlicher Betätigung wie Gehen, oder Schwellungen an Knöcheln und
                    Füßen</li>
            </ul>
        </li>
    </ul>
</div>
<div class="row" style="padding:0 0 0 15px;">
    <h4>Wirkung von Enalapril AL</h4>
    <ul>
        <li>Wirkt über eine Erweiterung der Blutgefäße. Das senkt Ihren Blutdruck.
        <li>Das Arzneimittel beginnt
            normalerweise innerhalb einer Stunde zu wirken</li>
        <li> Die Wirkung dauert mindestens 24 Stunden lang an.</li>
        <li>Einige
            Patienten benötigen eine Behandlung von mehreren Wochen, bis die beste Wirkung auf den Blutdruck zu
            beobachten ist.</li>
    </ul>
</div>
',13,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (120,0,'
Enalapril AL 5mg sind runde flache weiße Tabletten mit beidseitiger Bruchkerbe.
',13,9);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (121,0,'
Enalapril AL 5mg ist in Packungen mit 30, 50 und 100 Tabletten erhältlich.
Es werden möglicherweise nicht alle Packungsgrößen in den Verkehr gebracht.

',13,10);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (122,0,'
1 Tablette enthält 5 mg Enalaprilmaleat. <br>
<b>Die sonstigen Bestandteile sind:</b>
<ul>
    <li>Natriumhydrogencarbonat</li>
    <li>Lactose-Monohydrat</li>
    <li>Maisstärke</li>
    <li>
        Talkum</li>
    <li>Magnesiumstearat (Ph.Eur.)</li>
    <li>Hyprolose</li>

</ul>
',13,11);

--Salbutamol--

INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (123,0,'Beispieltext1',14,1);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (124,0,'Beispieltext2',14,2);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (125,0,'
<div class="row content_header">
    <h1>Warnhinweise und Vorsichtsmaßnahmen
    </h1>
    <hr>
</div>
<div>
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    Bitte sprechen Sie mit Ihrem Arzt oder Apotheker, bevor Sie Salbutamol einnehmen.<br>
    Informieren Sie Ihren Arzt, wenn eine der folgenden Voraussetzungen auf Sie zutrifft oder
    einmal zutraf:
    <br><br>

    <div class="row">
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Überempfindlichkeit gegen andere Sympathomimetika</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Schweren Herzerkrankung </b>
                    <p>Insbesondere bei frischem
                        Herzinfarkt, koronarer Herzkrankheit (Erkrankung der Herzkranzgefäße), hypertropher obstruktiver
                        Kardiomyopathie
                        (eine chronische Herzmuskelerkrankung), tachykarden
                        Arrhythmien (Herzrhythmusstörungen mit erhöhter
                        Herzschlagfrequenz)</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Schwerer und unbehandelter Hypertonie (Bluthochdruck) </b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Phäochromozytom (bestimmte Erkrankung des Nebennierenmarks) </b>
                </div>
            </div>
        </div>
        <div class="col-sm-6 nopadd">
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Einnahme von Herzglykosiden (Arzneimittel zur Behandlung
                        von Herzschwäche)</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Aneurysmen (krankhafte Ausweitungen der Gefäßwand)</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> Hyperthyreose/Thyreotoxikose (Überfunktion der Schilddrüse)</b>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12 info_notuse bg_orange">
                    <b> schwer kontrollierbarem Diabetes mellitus</b>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel-group" id="accordion" style="margin: 30 0 30 0;">
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse0">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Spezielle Therapiehinweise
            </h4>
        </div>
        <div id="collapse0" class="panel-collapse collapse in">
            <div class="panel-body">
                <ul>
                    <li> Eine Behandlung des fortdauernden Asthma bronchiale soll
                        nur zusammen mit entzündungshemmenden Medikamenten
                        erfolgen.
                        Ein ansteigender Bedarf von Beta2-Sympathomimetika, wie
                        Salbutamol-ratiopharm® N Dosieraerosol, ist ein Anzeichen für
                        eine Verschlechterung der Erkrankung.</li>
                    <li>Kommt es trotz Behandlung zu keiner Besserung oder gar zu
                        einer Verschlechterung der Beschwerden, muss die Therapie
                        durch den Arzt überdacht und gegebenenfalls neu festgesetzt
                        werden. Die Therapie kann durch Kombination mit entzündungshemmenden Arzneimitteln,
                        Dosisanpassung einer bereits
                        bestehenden entzündungshemmenden Behandlung oder die
                        zusätzliche Gabe weiterer Arzneimittel ergänzt werden.</li>
                    <li> Bei akuter oder sich rasch verschlimmernder Atemnot muss
                        unverzüglich ärztliche Hilfe in Anspruch genommen werden.
                        Wie andere Beta-Agonisten kann Salbutamol bei manchen
                        Patienten eine bedeutende Hypokaliämie (Senkung des
                        Blutkalium-Spiegels) herbeiführen.</li>
                    <li> Eine erhebliche Überschreitung der vorgegebenen Dosierung –
                        sowohl beim akuten Anfall als auch bei der Tagesdosis – kann
                        wegen der Nebenwirkungen auf das Herz gefährlich sein.</li>
                    <li> Wenn Sie bereits an einer schweren Herzerkrankung leiden und
                        gleichzeitig Salbutamol erhalten ist besondere Vorsicht geboten.
                        Es gibt im Zusammenhang mit Salbutamol Hinweise darauf,
                        dass selten ein Sauerstoffmangel am Herzmuskel (myokardialer
                        Ischämie) auftreten kann. Sie sollten dringend ärztlichen Rat
                        suchen, wenn Sie Schmerzen in der Brust haben oder es
                        Anzeichen gibt, dass Ihre Herzerkrankung sich verschlimmert.</li>
                    <li> Es ist wiederholt über ein erhöhtes Risiko für schwere
                        Komplikationen und Todesfälle bei der Behandlung des
                        Asthma bronchiale mit β-Sympathomimetika zur Inhalation
                        berichtet worden, ohne dass die ursächlichen Zusammenhänge bisher hinreichend geklärt werden
                        konnten.</li>
                    <li> Besondere Vorsicht ist erforderlich, wenn in Notfallsituationen
                        wiederholt Salbutamol verabreicht wird. Nach Gabe hoher
                        Dosen kann es – in seltenen Fällen – zu einer so genannten
                        Laktatazidose kommen. Die Laktatazidose kann die Ursache für
                        eine zunehmende Atemnot sein.</li>
                    <li>Bei der Inhalation von Salbutamol-ratiopharm® N
                        Dosieraerosol in hohen Dosen kann der Blutzuckerspiegel
                        ansteigen. Als Diabetiker sollten Sie häufig Ihre Blutzuckerwerte kontrollieren.</li>
                    <li> Zur Beurteilung von Krankheitsverlauf und Behandlungserfolg
                        ist eine tägliche Selbstkontrolle nach ärztlicher Anleitung
                        wichtig. Messen Sie z. B. regelmäßig die maximale Atemstoßstärke mit einem Peak-flow-Meter.</li>
                    <li> Es ist für den Patienten möglicherweise gefährlich, den
                    <li> Gebrauch von Beta2-Sympathomimetika wie Salbutamolratiopharm® N Dosier aerosol selbst zu
                        erhöhen.</li>
                    <li> Wie bei anderen Inhalationstherapien kann nach der
                        Anwendung von Salbutamol-ratiopharm® N Dosieraerosol ein
                        Bronchial krampf (paradoxer Bronchospasmus) auftreten mit
                        einer sofortigen Zunahme des Giemens (Keuchens). In diesem
                        Fall sollte sofort ein bronchienerweiterndes Arzneimittel mit
                        schnellem Wirkungseintritt inhaliert werden.</li>
                    <li>Die Behandlung
                        mit Salbutamol-ratiopharm® N Dosieraerosol soll unverzüglich
                        abgebrochen und der behandelnde Arzt informiert werden.
                        Dieser entscheidet, ob weitere Maßnahmen erforderlich sind.</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse1">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Kinder und Jugendliche
            </h4>
        </div>
        <div id="collapse1" class="panel-collapse collapse in">
            <div class="panel-body">
                Die besonderen Dosierungsempfehlungen für Kinder sind zu
                beachten (siehe auch 3. „Wie ist Salbutamol-ratiopharm® N
                Dosieraerosol anzuwenden?“).
            </div>
        </div>
    </div>
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse2">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Ältere Menschen
            </h4>
        </div>
        <div id="collapse2" class="panel-collapse collapse in">
            <div class="panel-body">
                Die Dosierung muss bei älteren Menschen nicht speziell
                angepasst werden.
            </div>
        </div>
    </div>
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse3">
                <img width="40" src="./../../assets/icons/10.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Einnahme von Salbutamol-ratiopharm® N
                Dosieraerosol zusammen mit
                anderen Medikamente
            </h4>
        </div>
        <div id="collapse3" class="panel-collapse collapse in">
            <div class="panel-body">
                Informieren Sie Ihren Arzt oder Apotheker, wenn Sie andere
                Arzneimittel einnehmen/anwenden, kürzlich andere Arzneimittel eingenommen/angewendet haben oder
                beabsichtigen
                andere Arzneimittel einzunehmen/anzuwenden.<br>
                Es können sowohl Wirkungen als auch Nebenwirkungen der
                kombinierten Arzneimittel verändert werden. Dies kann vorkommen, wenn Sie Salbutamol-ratiopharm® N
                Dosieraerosol
                anwenden zusammen mit
                <ul>
                    <li>Beta-Rezeptorenblockern (Mittel zur Blutdrucksenkung)</li>
                    <li>Antidiabetika (Mittel gegen Zuckerkrankheit)</li>
                    <li>Digitalisglykosiden (Herzglykoside) und Mitteln gegen
                        Herzrhythmusstörungen</li>
                    <li>Anästhetika (Narkosemittel)</li>
                    <li>Sympathomimetika (Mittel zur Beeinflussung des
                        vegetativen Nervensystems)</li>
                    <li>Theophyllin oder anderen Sympathomimetika, auch
                        Substanzen, wie z. B. L-Dopa, L-Thyroxin, Oxytocin oder
                        Alkohol</li>
                    <li> Mutterkornalkaloiden, wie z. B. Ergotamin</li>
                    <li>Arzneimitteln zur Behandlung von Depressionen (Monoaminoxidasehemmern oder trizyklischen
                        Antidepressiva)</li>
                    <li>Procarbazin</li>
                </ul>
                Die durch Salbutamol-ratiopharm® N Dosieraerosol
                möglicherweise ausgelöste Hypokaliämie (Senkung des
                Blutkaliumspiegels) kann bei gleichzeitiger Einnahme von
                Methylxanthinen (z. B. Theophyllin), Kortikoiden, Diuretika
                oder Digitalisglykosiden noch verstärkt werden. <br>
                <b>Hinweis:</b><br>
                Wenn bei Ihnen eine Narkose geplant ist, sollten Sie
                Salbutamol-ratiopharm® N Dosieraerosol eventuell 6 Stunden
                zuvor nicht mehr anwenden. Fragen Sie Ihren Arzt.
            </div>
        </div>
    </div>

    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse4">
                <img width="40" src="./../../assets/icons/8.svg" /> <span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span> Schwangerschaft und Stillzeit
            </h4>
        </div>
        <div id="collapse4" class="panel-collapse collapse">
            <div class="panel-body">
                Wenn Sie schwanger sind oder stillen, oder wenn Sie vermuten, schwanger zu sein oder beabsichtigen,
                schwanger zu
                werden, fragen Sie vor der Anwendung dieses Arzneimittels
                Ihren Arzt oder Apotheker um Rat.
                <h4>Schwangerschaft</h4>
                Salbutamol passiert die Plazentaschranke. Für den Menschen
                liegen über eine Anwendung während der Schwangerschaft
                unzureichende Erfahrungen vor.
                Ein Anstieg der Herzfrequenz (Tachykardie) und ein
                erniedrigter Blutzuckerspiegel (Hypoglykämie) des Neugeborenen sind bei der Anwendung von Salbutamol als
                wehenhemmendes Mittel beschrieben worden. Studien bei
                der Ratte haben in sehr hoher Dosierung eine Fortpflanzung
                gefährdende Wirkung gezeigt. Das mögliche Risiko für den
                Menschen ist nicht bekannt.
                Salbutamol-ratiopharm® N Dosieraerosol sollte in der
                Schwangerschaft, insbesondere während der ersten drei
                Monate, nur nach strenger Indikationsstellung angewendet
                werden. Das Gleiche gilt wegen der wehenhemmenden
                Wirkung für die Anwendung am Ende der Schwangerschaft.
                Salbutamol-ratiopharm® N Dosieraerosol darf nicht zur
                Behandlung vorzeitiger Wehen angewendet werden</br>
                <h4>Stillzeit</h4>
                Da Salbutamol wahrscheinlich in die Muttermilch übergeht,
                wird die Anwendung in der Stillzeit nur nach sorgfältiger
                Nutzen-Risiko- Abwägung empfohlen.
            </div>
        </div>
    </div>
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse5">
                <img width="40" src="./../../assets/icons/3.svg" /><span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Verkehrstüchtigkeit und Fähigkeit zum Bedienen von Maschinen
            </h4>
        </div>
        <div id="collapse5" class="panel-collapse collapse">
            <div class="panel-body">Durch individuell auftretende unterschiedliche Reaktionen,
                insbe sondere bei höherer Dosierung, kann die Fähigkeit zur
                aktiven Teilnahme am Straßenverkehr oder zum Bedienen von
                Maschinen beeinträchtigt werden. Dies gilt im verstärkten
                Maß bei Behandlungsbeginn sowie im Zusammenwirken mit
                Alkohol oder Beruhigungs- und Schlafmitteln </div>
        </div>
    </div>
    <div class="panel panel-default panel_neben">
        <div class="panel-heading">
            <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapse6">
                <img width="40" src="./../../assets/icons/3.svg" /><span
                    class="hidden-lg hidden-sm hidden-md"><br><br></span>
                Auswirkungen bei Fehlgebrauch zu Dopingzwecken
            </h4>
        </div>
        <div id="collapse6" class="panel-collapse collapse">
            <div class="panel-body">Die Anwendung von Salbutamol-ratiopharm® N Dosieraerosol
                kann bei Dopingkontrollen zu positiven Ergebnissen führen.
                Die Anwendung von Salbutamol-ratiopharm® N Dosieraerosol
                als Dopingmittel kann zu einer Gefährdung der Gesundheit
                führen. </div>
        </div>
    </div>
</div>
</div>
<h3 class="not_take"><i class="fas fa-bolt bolt_red" aria-hidden="true"></i> <br> Salbutamol-ratiopharm® N Dosieraerosol
    nicht anwenden bei </h3>
<div class="row">
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Allergisch </b> gegen
                <ul>
                    <li>Salbutamol</li>
                    <li>Ethanol (3,9 mg/Sprühstoß)</li>
                    <li>Norfluran (HFA-134a)</li>

                </ul>
            </div>
        </div>

    </div>
    <div class="col-sm-6 nopadd">
        <div class="row">
            <div class="col-sm-12 info_notuse"><b>Bei gleichzeitiger Behandlung mit Beta-Rezeptorenblockern.
                    Beta-Rezeptorenblocker können schwere Bronchialkrämpfe
                    auslösen.</div>
        </div>

    </div>
</div>
',14,3);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic, address) VALUES (126,0,'Beispieltext',14,4, '
<div class="row">
    <div class="col-md-9">
        <h3>Pharmazeutischer Unternehmer </h3>
        <p> ratiopharm GmbH <br />
            Graf-Arco-Str. 3<br />
            89079 Ulm<br />
            <b>Tel.:</b> 0 60 23 - 94 80 - 0 <br />
            <b>Fax:</b> 0 60 23 - 94 80 - 50 <br />
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/ratiopharm.png" />
    </div>
</div>
<div class="row">
    <div class="col-md-9">
        <h3>Hersteller </h3>
        <p> Merckle GmbH<br />
            Ludwig-Merckle-Str. 3<br />
            89143 Blaubeuren<br />
        </p>
        <p> Norton (Waterford) Limited<br>
            T/A Ivax Pharmaceuticals Ireland<br>
            T/A Teva Pharmaceuticals Ireland<br />
            Unit 301 IDA Industrial Park<br>
            Cork Road<br />
            Waterford<br />
            Irland
        </p>
    </div>
    <div class="col-md-3">
        <img class="img-responsive" src="/assets/images/company/merkle.png" />

    </div>
</div>');
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (127,0,'
<!--Anwendung und Dosierung-->
<div class="row">
    <h3 class="not_take"><i class="fas fa-user-injured bolt_grey"></i><i style="    font-size: 47px;
        " class="fas fa-comments bolt_grey"></i><i class="fas fa-user-md bolt_grey" aria-hidden="true"></i> </h3>
    <ol>
        <li>Nehmen Sie dieses Arzneimittel immer genau nach Absprache mit Ihrem Arzt oder Apotheker ein.</li>
        <li>Fragen Sie bei Ihrem Arzt oder Apotheker nach, wenn Sie sich nicht sicher sind.</li>
    </ol>
</div>

<div class="row content_header">
    <h3 class="modal-title xs-center">Dosierung</h3>
    <hr />

    <div class=" with-nav-tabs panel-default panel_neben">
        <div style="height: inherit;">
            <ul class="nav nav-tabs nav1-tabs">
                <li class="active"><a href="#tab1default" data-toggle="tab">Erwachsene</a></li>
                <li><a href="#tab2default" data-toggle="tab">Kinder (4 – 11 Jahre)</a></li>
                <li><a href="#tab3default" data-toggle="tab">Kinder unter 4 Jahre</a></li>

            </ul>
        </div>
        <div class="panel-body">
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab1default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Einzeldosis</b></td>
                                    <td>1-2 Sprühstoße &#8793;
                                        100-200 Mikrogramm Salbutamol</td>
                                </tr>

                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>
                                    <td>
                                        12 Sprühstöße &#8793;
                                        1,2 mg Salbutamol <br>Eine höhere Dosierung wird in der Regel
                                        nicht besser wirken, aber es besteht die Gefahr, dass dadurch
                                        schwerwiegende Nebenwirkungen entstehen. </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Akutbehandlung</b> </td>
                                    <td>Zur Akutbehandlung plötzlich auftretender Bronchialkrämpfe
                                        und anfallsweise auftretender Atemnot wird eine Einzeldosis
                                        inhaliert.<br>
                                        Sollte sich die Atemnot 5 – 10 Minuten nach Inhalation der
                                        ersten Einzeldosis nicht spürbar gebessert haben, kann eine
                                        weitere Einzeldosis genommen werden.<br>
                                        Kann ein schwerer Anfall von Luftnot auch durch eine zweite
                                        Einzeldosis nicht behoben werden, können weitere
                                        Einzeldosen erforderlich werden. In diesen Fällen muss
                                        unverzüglich ärztliche Hilfe in Anspruch genommen werden.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Vorbeugung </b> </td>
                                    <td>Zur gezielten Vorbeugung bei Anstrengungsasthma oder
                                        vorhersehbarem Allergenkontakt wird eine Einzeldosis, wenn
                                        möglich 10 – 15 Minuten vorher, inhaliert.<br>
                                        Der Abstand zwischen den einzelnen Inhalationen soll
                                        mindestens 3 – 4 Stunden betragen.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="tab-pane fade" id="tab2default">
                    <div class="row content_header" style="margin-top: 15px;">
                        <table class="sideffect_table ">
                            <tbody>
                                <tr>
                                    <td> <b>Einzeldosis</b></td>
                                    <td>1 Sprühstoß &#8793;
                                        100 Mikrogramm Salbutamol</td>
                                </tr>

                                <tr>
                                    <td>
                                        <b>Höchstdosis pro Tag</b>
                                    </td>

                                    <td> 6 Sprühstöße &#8793;
                                        0,6 mg Salbutamol <br> Eine höhere Dosierung wird in der Regel
                                        nicht besser wirken, aber es besteht die Gefahr, dass dadurch
                                        schwerwiegende Nebenwirkungen entstehen.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>Akutbehandlung</b> </td>
                                    <td>Zur Akutbehandlung plötzlich auftretender Bronchialkrämpfe
                                        und anfallsweise auftretender Atemnot wird eine Einzeldosis
                                        inhaliert.<br>
                                        Sollte sich die Atemnot 5 – 10 Minuten nach Inhalation der
                                        ersten Einzeldosis nicht spürbar gebessert haben, kann eine
                                        weitere Einzeldosis genommen werden.<br>
                                        Kann ein schwerer Anfall von Luftnot auch durch eine zweite
                                        Einzeldosis nicht behoben werden, können weitere
                                        Einzeldosen erforderlich werden. In diesen Fällen muss
                                        unverzüglich ärztliche Hilfe in Anspruch genommen werden.</td>
                                </tr>
                                <tr>
                                    <td>
                                        <b> Vorbeugung </b> </td>
                                    <td>Zur gezielten Vorbeugung bei Anstrengungsasthma oder
                                        vorhersehbarem Allergenkontakt wird eine Einzeldosis, wenn
                                        möglich 10 – 15 Minuten vorher, inhaliert.<br>
                                        Der Abstand zwischen den einzelnen Inhalationen soll
                                        mindestens 3 – 4 Stunden betragen.</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="tab3default">
                    <div class="row content_header" style="margin-top: 15px;">
                        Die Sicherheit von Salbutamol-ratiopharm® N Dosieraerosol
                        bei Kindern unter 4 Jahren ist mit derjenigen bei Kindern über
                        4 Jahren vergleichbar.<br> Eine Dosierungsempfehlung kann
                        jedoch nicht gegeben werden. Bitte wenden Sie sich an Ihren
                        behandelnden Arzt.
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Art und Dauer der Anwendung</h3>
    <hr />
    <div class="row text-center">
        <div class="col-sm-4">
            <i style="font-size:40px;    color: #575858;" class="fas fa-child"></i><br> <br>
            Kinder sollten dieses Arzneimittel nur unter Aufsicht eines
            Erwachsenen und nach Vorschrift des Arztes anwenden.
            Jüngere Kinder sollten mit Hilfe Erwachsener inhalieren.
            <br>
            Diese müssen das Kind ermuntern auszuatmen und sofort bei Beginn des Einatmens einen
            Sprühstoß auszulösen.</div>
        <div class="col-sm-4">
            <img width=" 40" src="./../../assets/images/sit.svg" />
            <br>
            <br> Nach Möglichkeit sollte die Anwendung im Sitzen oder Stehen
            erfolgen.</div>
        <div class="col-sm-4">
            <i style="font-size:40px;    color: #575858;" class="fas fa-hourglass-half"></i><br> <br>
            Die Dauer der Behandlung richtet sich nach Art, Schwere
            und Verlauf der Erkrankung und ist vom Arzt individuell zu
            entscheiden.</div>
    </div>
    <div class="row" style="margin-top: 30px;">
        <div class="col-sm-12">
            <h4 class="modal-title xs-center">Bedienungsanleitung</h4>
            <hr />
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="5"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="6"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="7"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="8"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="9"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="carousel-caption">
                            <h4> Schritt 1</h4>
                            <img src="./../../assets/medication/14/1.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Durch leichtes Zusammendrücken
                                der Seitenflächen die Schutzkappe
                                vom Mundrohr entfernen.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 2</h4>
                            <br><br>
                            <p> Das Mundrohr inklusive des
                                Wirkstoffbehälters auf das
                                Vorhandensein von losen Fremdkörpern prüfen.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 3</h4>
                            <img src="./../../assets/medication/14/3.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Das Dosieraerosol kräftig
                                schütteln, um sicherzustellen,
                                dass mögliche Fremdkörper
                                entfernt werden und der Inhalt
                                gleichmäßig durchmischt wird.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 4</h4>
                            <img src="./../../assets/medication/14/4.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Das Dosieraerosol zwischen
                                Daumen und Zeigefinger, aufrecht mit
                                dem Behälterboden nach oben
                                halten.
                                Das Dosieraerosol ist bei der
                                Inhalation senkrecht, mit dem
                                Boden nach oben zu halten,
                                unabhängig von der Körper position.
                                Langsam so tief wie möglich ausatmen.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 5</h4>
                            <img src="./../../assets/medication/14/5.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Dann das Mundrohr mit den
                                Lippen fest umschließen, aber
                                nicht auf das Mundrohr beißen. </p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 6</h4>
                            <img src="./../../assets/medication/14/6.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Tief und gleichmäßig durch das
                                Mundrohr einatmen. Kurz nach
                                Beginn des Einatmens den Wirkstoffbehälter einmal fest nach
                                unten drücken; währenddessen
                                und auch danach weiter gleichmäßig und tief einatmen.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 7</h4>
                            <img src="./../../assets/medication/14/7.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Den Atem so lange wie möglich
                                anhalten. Das Mundrohr absetzen
                                und den Zeigefinger vom oberen
                                Ende des Dosieraerosols nehmen.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 8</h4>
                            <br><br>
                            <p> Wenn ein weiterer Sprühstoß
                                inhaliert werden soll, das Dosieraerosol weiterhin aufrecht halten
                                und ca. eine halbe Minute warten,
                                bevor die Schritte 3 bis 7 wiederholt werden.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="carousel-caption">
                            <h4>Schritt 9</h4>
                            <img src="./../../assets/medication/14/9.JPG" class="usage_tab2" alt="Tablette"
                                title="Tablette">
                            <br><br>
                            <p> Die Schutzkappe wieder auf das
                                Mundrohr aufsetzen, indem diese
                                bis zum Einrasten fest auf das
                                Mundrohr gedrückt wird.</p>
                        </div>
                    </div>
                    <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                        href="#carousel-example-generic" data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right">
                        </span></a>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="alert alert-info" role="alert">
            <b> Wichtig:</b>
            <ul>
                <li>Die Schritte 5, 6 und 7 nicht hastig durchführen. Es ist wichtig,
                    mit dem Einatmen zu beginnen, bevor der Sprühstoß
                    ausgelöst wird.</li>
                <li>Das Dosieraerosol ist stets senkrecht,
                    mit dem Boden nach oben zu halten, unabhängig von der
                    Körperposition, in der inhaliert wird.</li>
                <li> Bei Kindern unter 6 Jahren und älteren Patienten wird der
                    Einsatz einer Inhalierhilfe (Spacer) dringend empfohlen.</li>
                <li>Bitte beachten Sie, dass bei Verwendung von Salbutamolratiopharm® N Dosieraerosol zusammen mit
                    einer
                    Inhalierhilfe
                    unter Umständen die Dosis durch den Arzt angepasst werden
                    muss.</li>
                <li data-toggle="modal" data-target="#myModal" style="cursor: pointer;color: #00283b;"><i
                        class="fas fa-broom"></i> Reinigung des
                    Mundrohres</li>
            </ul>
        </div>
    </div>
    <div class="row">
        <!-- Modal -->
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Reinigung des
                            Mundrohres</h4>
                    </div>
                    <div class="modal-body">
                        <ul>
                            <li>Das Mundrohr sollte regelmäßig, am besten täglich
                                gereinigt werden.</li>
                            <li>Spülen Sie das Mundrohr nach Herausnehmen des
                                Behälters gründlich in warmem fließendem Wasser. Das
                                Wasser soll nacheinander von beiden Richtungen durch die
                                Öffnungen einlaufen, damit eine mögliche Verstopfung der
                                kleinen Öffnung im Innern des Mundstücks freigesetzt
                                werden kann.</li>
                            <li>Anschließend trocknen Sie es bitte sorgfältig von innen und
                                außen.</li>
                            <li>Der Behälter wird erst in das vollständig getrocknete
                                Mundrohr wieder eingesetzt.</li>
                            <li>Bitte achten Sie darauf, dass der Behälter nicht ins Wasser
                                gelegt wird.</li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>

    </div>

</div>
<div class="row content_header" style="margin-top: 30px;">
    <h3 class="modal-title xs-center">Weitere Informationen</h3>
    <hr />
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="headingOne">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseOne1">
                        Wenn Sie eine größere Menge von Salbutamolratiopharm® N Dosieraerosol eingenommen haben, als Sie
                        sollten
                    </h4>
                </div>
                <div id="collapseOne1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <p>Die Symptome bzw. Anzeichen einer Überdosierung
                            entsprechen den Nebenwirkungen. Diese treten dann sehr
                            schnell und gegebenenfalls in verstärktem Umfang in
                            Erscheinung.<br>
                            <b>Symptome bzw. Anzeichen einer Überdosierung sind:</b>
                            Herzrasen, Herzklopfen, unregelmäßiger und/oder
                            beschleunigter Herzschlag, Ruhelosigkeit, Schlafstörungen,
                            Brustschmerzen und heftiges Zittern insbesondere an den
                            Händen, aber auch am ganzen Körper. Gelegentlich sind nach
                            exzessiven Salbutamol-Anwendungen psychotische
                            Reaktionen beobachtet worden. Weiterhin kann es zum
                            Auftreten einer Laktatazidose kommen, die sich durch eine
                            vertiefte Atmung, Übelkeit und Bauchschmerzen äußern kann.
                            Treten diese Beschwerden auf, soll unverzüglich ärztliche
                            Hilfe in Anspruch genommen werden.
                        </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="headingTwo">
                    <h4 class="panel-title title_pan text-center-xs" data-toggle="collapse" data-target="#collapseTwo2">
                        Wenn Sie die Einnahme von Salbutamol-ratiopharm® N
                        Dosieraerosol vergessen haben
                    </h4>
                </div>
                <div id="collapseTwo2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">
                        <p>Sie sollten in keinem Fall
                            die Dosis beim nächsten Mal erhöhen!<br>
                            Eine nachträgliche Anwendung ist nicht erforderlich.
                            Salbutamol-ratiopharm® N Dosieraerosol sollte möglichst nur
                            bei Bedarf angewendet werden. </p>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="headingThree">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#collapseThree3">

                        Wenn Sie die Einnahme von Salbutamol-ratiopharm® N
                        Dosieraerosol abbrechen
                    </h4>
                </div>
                <div id="collapseThree3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                    <div class="panel-body">
                        <p>Es könnte sich hierdurch Ihre Krankheit verschlechtern. Bitte brechen Sie die Behandlung mit
                            Salbutamol-ratiopharm® N Dosieraerosol nicht ohne Rücksprache mit Ihrem Arzt ab. </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

',14,5);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (128,0,'
<div class="row content_header">
    <h1> Nebenwirkungen </h1>
    <hr>
    Wie alle Arzneimittel kann auch dieses Arzneimittel Nebenwirkungen haben, die aber nicht
    bei jedem auftreten müssen.
</div>
<div class="alert alert-info" style="margin-top: 15px;">
    Suchen Sie sofort Ihren Arzt auf, wenn bei Ihnen nach der Einnahme dieses Arzneimittels
    die folgenden Nebenwirkungen auftreten:
    <ul>
        <li>Zittern (Tremor)
        <li>Übelkeit</li>
        <li>Schwitzen</li>
        <li>Kopfschmerzen</li>
        <li>Schwindel</li>
        <li>Herzklopfen (Palpitationen)</li>
    </ul>
    Diese Nebenwirkungen können sich
    bei Fortführung der Behandlung im Verlaufe von 1 – 2 Wochen
    zurückbilden.
</div>
<div class="row" style="margin-top: 30px;">
    <div class="col-md-12">
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead1">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben1">
                        Erkrankungen des Immunsystems </h4>
                </div>
                <div id="neben1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="nebenhead1">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Überempfindlichkeitsreaktionen einschließlich
                                        Juckreiz, Nesselsucht (Urtikaria), Schwellung
                                        im Mund-Rachenbereich (Quincke-Ödem),
                                        Hautausschlag (Exanthem), Bronchialkrampf
                                        (Bronchospasmus), Blutdruckabfall und
                                        Kollaps.
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar< </div> <div class="row">
                                            <b>Nebenwirkung:</b> <br>
                                            Überempfindlichkeitsreaktionen einschließlich
                                            Juckreiz, Nesselsucht (Urtikaria), Schwellung
                                            im Mund-Rachenbereich (Quincke-Ödem),
                                            Hautausschlag (Exanthem), Bronchialkrampf
                                            (Bronchospasmus), Blutdruckabfall und
                                            Kollaps.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead2">
                    <h4 class="panel-title title_pan text-center-xs" data-toggle="collapse" data-target="#neben2">
                        Stoffwechsel- und Ernährungsstörungen </h4>
                </div>
                <div id="neben2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead2">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Erhöhter Blutzuckergehalt (Hyperglykämie).
                                    </td>
                                </tr>
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Senkung des Blut-Kaliumspiegels
                                        (Hypokaliämie): unter der Therapie mit Beta2-
                                        Agonisten kann es möglicherweise zu einer
                                        sehr ausgeprägten Senkung des BlutkaliumSpiegels kommen; Übersäuerung des Blutes
                                        (Laktatazidose).
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div class="row p15" id="haeufig-xs">
                                <h4> Häufig</h4>
                                <div class="row">
                                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10 Behandelten
                                </div>
                                <div class="row">
                                    <b>Nebenwirkung:</b> <br>
                                    Erhöhter Blutzuckergehalt (Hyperglykämie).
                                </div>
                                <hr>
                            </div>
                            <div class="row p15" id="nichtbekannt">
                                <h4> Nicht bekannt</h4>
                                <div class="row">
                                    <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                    verfügbaren Daten nicht abschätzbar< </div> <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Senkung des Blut-Kaliumspiegels
                                        (Hypokaliämie): unter der Therapie mit Beta2-
                                        Agonisten kann es möglicherweise zu einer
                                        sehr ausgeprägten Senkung des BlutkaliumSpiegels kommen; Übersäuerung des Blutes
                                        (Laktatazidose).
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead3">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben3">
                        Psychiatrische Erkrankungen
                    </h4>
                </div>
                <div id="neben3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead3">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Schlaflosigkeit (Insomnie)
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar< </div> <div class="row">
                                            <b>Nebenwirkung:</b> <br>
                                            Schlaflosigkeit (Insomnie)
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead4">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben4">
                        Erkrankungen des Nervensystems </h4>
                </div>
                <div id="neben4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead4">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Zittern (Tremor), Kopfschmerzen
                                    </td>
                                </tr>
                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Unruhe
                                    </td>
                                </tr>
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Schwindel </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 10
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Zittern (Tremor), Kopfschmerzen.
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1 von 100
                                        Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Unruhe
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar</div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Schwindel </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead5">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben5">
                        Herzerkrankungen </h4>
                </div>
                <div id="neben5" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead5">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="haeufig">
                                    <td>Häufig</td>
                                    <td>Mehr als 1 von 10 Behandelten </td>
                                    <td>
                                        Herzrasen (Tachykardie).
                                        Herzrhythmusstörungen einschließlich
                                        Vorhofflimmern, Anstieg der Herzfrequenz
                                        (supraventrikuläre Tachykardie) und
                                        unregelmäßigem Puls (ventrikuläre
                                        Extrasystolie), Brustenge (pektanginöse
                                        Beschwerden) und Herzklopfen
                                        (Palpitationen), Sauerstoffmangel am
                                        Herzmuskel (myokardiale Ischämie) </td>
                                </tr>
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Minderdurchblutung des Herzmuskels
                                        (Myokardischämie). </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="haeufig-xs">
                                    <h4> Häufig</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 10 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Durchfall, Bauchschmerzen, Geschmacksveränderungen.

                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar</div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Minderdurchblutung des Herzmuskels
                                        (Myokardischämie). </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead6">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben6">
                        Gefäßerkrankungen </h4>
                </div>
                <div id="neben6" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead6">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">
                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Periphere Erweiterung der Blutgefäße </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar</div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Periphere Erweiterung der Blutgefäße </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead7">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben7">
                        Erkrankungen der Atemwege, des Brustraums und
                        Mediastinums </h4>
                </div>
                <div id="neben7" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead7">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                    <th>Hinweis</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="nichtbekannt">
                                    <td>Nicht Bekannt</td>
                                    <td>Häufigkeit auf Grundlage der verfügbaren Daten nicht abschätzbar</td>
                                    <td>
                                        Husten, Bronchialkrampf (paradoxer
                                        Bronchospasmus), Reizung im Rachenbereich. </td>
                                    <td>Wie bei anderen Inhalationstherapien kann nach der
                                        Anwendung von Salbutamol-ratiopharm® N Dosieraerosol ein
                                        Bronchialkrampf auftreten mit einer sofortigen Zunahme des
                                        Giemens (Keuchens). In diesem Fall sollte sofort ein anderes
                                        bronchienerweiterndes Arzneimittel mit schnellem
                                        Wirkungseintritt inhaliert werden. Die Behandlung mit
                                        Salbutamol-ratiopharm® N Dosieraerosol soll unverzüglich
                                        abgebrochen und der behandelnde Arzt informiert werden.
                                        Dieser entscheidet, ob weitere Maßnahmen erforderlich sind.</td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="nichtbekannt">
                                    <h4> Nicht bekannt</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Häufigkeit auf Grundlage der
                                        verfügbaren Daten nicht abschätzbar</div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Husten, Bronchialkrampf (paradoxer
                                        Bronchospasmus), Reizung im Rachenbereich. </div>
                                    <div class="row">
                                        <b>Hinweis:</b> <br>
                                        Wie bei anderen Inhalationstherapien kann nach der
                                        Anwendung von Salbutamol-ratiopharm® N Dosieraerosol ein
                                        Bronchialkrampf auftreten mit einer sofortigen Zunahme des
                                        Giemens (Keuchens). In diesem Fall sollte sofort ein anderes
                                        bronchienerweiterndes Arzneimittel mit schnellem
                                        Wirkungseintritt inhaliert werden. Die Behandlung mit
                                        Salbutamol-ratiopharm® N Dosieraerosol soll unverzüglich
                                        abgebrochen und der behandelnde Arzt informiert werden.
                                        Dieser entscheidet, ob weitere Maßnahmen erforderlich sind.

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead8">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben8">
                        Erkrankungen des Gastrointestinaltrakts </h4>
                </div>
                <div id="neben8" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead8">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Reizung im Mund oder Rachenbereich und
                                        Änderung des Geschmackempfindens.
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>

                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Reizung im Mund oder Rachenbereich und
                                        Änderung des Geschmackempfindens
                                    </div>
                                    <hr>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default panel_neben">
                <div class="panel-heading head_panel" role="tab" id="nebenhead9">
                    <h4 class="panel-title text-center-xs" data-toggle="collapse" data-target="#neben9">
                        Skelettmuskulatur-, Bindegewebs- und Knochenerkrankungen </h4>
                </div>
                <div id="neben9" class="panel-collapse collapse" role="tabpanel" aria-labelledby="nebenhead9">
                    <div class="panel-body">
                        <table class="sideffect_table hidden-xs">
                            <thead>
                                <tr>
                                    <th>Häufigkeit</th>
                                    <th style="width: 25%;">Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> </th>
                                    <th>Nebenwirkung</th>
                                </tr>
                            </thead>
                            <tbody class="" style="padding: 15px;">

                                <tr id="gelegentlich">
                                    <td>Gelegentlich</td>
                                    <td>Bis zu 1 von 100 Behandelten</td>
                                    <td>
                                        Muskelkrämpfe
                                    </td>
                                </tr>
                                <tr id="selten">
                                    <td>Selten</td>
                                    <td> Bis zu 1 von 1.000 Behandelten </td>
                                    <td> Störungen beim Wasserlassen, Sodbrennen
                                        sowie Blutdrucksteigerungen oder -senkungen . </td>
                                </tr>

                            </tbody>
                        </table>
                        <div class="hidden-sm hidden-md hidden-lg">
                            <div class="row content_header">
                                <h3> Häufigkeit der Nebenwirkungen </h3>
                                <hr>
                            </div>
                            <div>
                                <div class="row p15" id="gelegentlich-xs">
                                    <h4> Gelegentlich</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 100 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Muskelkrämpfe
                                    </div>
                                    <hr>
                                </div>
                                <div class="row p15" id="selten-xs">
                                    <h4> Selten</h4>
                                    <div class="row">
                                        <b>Anzahl der betreffenden Behandelten <span style="cursor: pointer" data-toggle="modal" data-target="#neben_info"><i class="fas fa-info-circle"></i></span> :</b> <br> Mehr als 1
                                        von 1000 Behandelten
                                    </div>
                                    <div class="row">
                                        <b>Nebenwirkung:</b> <br>
                                        Störungen beim Wasserlassen, Sodbrennen
                                        sowie Blutdrucksteigerungen oder -senkungen . </div>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            Vereinzelt ist über zentralnervös stimulierende Wirkungen
            nach Inhalation von Salbutamol berichtet worden, die sich in
            Übererregbarkeit, hyperaktiven Verhaltensauffälligkeiten,
            Schlafstörungen sowie Halluzinationen äußerten. Diese
            Beobachtungen wurden überwiegend (zu 90 %) bei Kindern
            im Alter bis zu 12 Jahren gemacht.<br>
            Einige der genannten Nebenwirkungen können unter
            Umständen akut lebensbedrohlich sein (wie z. B. lebensbedrohliche Tachykardien). Darum sollten Sie sofort einen
            Arzt informieren, falls ein derartiges Ereignis plötzlich auftritt
            oder sich unerwartet stark entwickelt.
        </div>
    </div>
</div>

',14,6);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (129,0,'Beispieltext',14,7);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (130,0,'
<!-- Allgemein -->
<div class="row" style="padding-left: 15px;">
    <h4> Anwendung von Salbutamol </h4>
    <ul>
        <li> symptomatischen Behandlung von Erkrankungen mit
            rückbildungsfähiger (reversibler) Verengung (Obstruktion)
            der Atemwege wie
            <ul>
                <li> Bronchialasthma,
                <li> COPD (chronische Atemwegserkrankung, die durch</li>
                Rauchen ausgelöst wird)</li>
    </ul>
    </li>
    <li>Vorbeugung einer
        <ul>
            <li>Verkrampfung der Atemwege (Atemnot) bei Anstrengung
                oder Kontakt mit Allergie auslösenden Stoffen.</li>
        </ul>
    </li>
    <li>
        Bei Erwachsenen, Jugendlichen und Kindern im Alter von
        4 bis 11 Jahren (für die Anwendung bei Kleinkindern und
        Kindern unter 4 Jahren siehe Abschnitt 3. „Wie ist
        Salbutamol-ratiopharm® N Dosieraerosol anzuwenden?“).
    </li>
    </ul>

    Eine längerfristige Behandlung soll nur zusammen mit
    entzündungshemmenden Medikamenten erfolgen.
</div>
',14,8);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (131,0,'
<!--Inhalt der Packung-->
<ul>
    <li>Packung mit 1 Dosieraerosol mit 8,5 g Suspension und
        Treibmittel (entsprechend 200 Sprühstößen zu je
        0,1 mg Salbutamol)</li>
    <li>Packung mit 2 Dosieraerosolen mit 8,5 g Suspension und
        Treibmittel (entsprechend 200 Sprühstößen zu je
        0,1 mg Salbutamol)</li>
    <li>Packung mit 3 Dosieraerosolen mit 8,5 g Suspension und
        Treibmittel (entsprechend 200 Sprühstößen zu je
        0,1 mg Salbutamol)</li>
</ul>
',14,9);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (132,0,'
<!--Darstellung des Medikaments-->

',14,10);
INSERT INTO packaging_section (id, state, text, iddrug, idpackaging_topic) VALUES (133,0,'
<!-- Wirkstoff -->
Der Wirkstoff ist: Salbutamol.<br>
 Jeder Sprühstoß zu 0,025 ml Suspension und Treibmittel
enthält 0,12 mg Salbutamolsulfat.<br>
 Dies entspricht einer vom Mundrohr abgegebenen Menge
von 0,09 mg Salbutamol.<br>
<b>Die sonstigen Bestandteile sind:</b>
<ul>
    <li>Ethanol (3,9 mg/Sprühstoß)</li>
    <li>Norfluran (HFA-134a)</li>

</ul>
',14,11);
-- Dump tailored_text--


INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (1, 1, 1, 16, 30, 'Hey %firstname% %lastname%, Hier steht eine wichtige Information für Männer im Alter von %age% Jahren, die sich für dieses Medikament interessieren.<br />2 mal täglich einnehmen<br />1 Tablette morgens gegen 9:00<br />1 Tablette am Abend gegen 20:00');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (2, 1, 1, 4, 0, 0, 'XYZ... Hier steht eine andere Information für Männer ohne Altersbezug, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (3, 1, 1, 5, 0, 0, 'Hallo Hallo! Hier steht eine andere Information für ohne Altersbezug, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (4, 1, 1, 8, 30, 40, 'Hier steht eine andere Information für Männer zwischen 30 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (5, 1, 2, 4, 0, 0, '%firstname% %lastname%,<br />Hier steht eine andere Information für Männer ohne Altersbezug, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (6, 1, 3, 5, 21, 40, 'Hallo Hallo %firstname%! Hier steht eine andere Information für Männer zwischen 21 und 40 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (7, 1, 2, 8, 30, 40, 'Hier steht eine andere Information für Männer mit %age% Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (8, 1, 1, 4, 0, 36, '%firstname% %lastname%,<br />Hier steht eine andere Information für Männer bis 36 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (9, 1, 6, 5, 21, 40, 'Hallo Hallo! Hier steht eine andere Information für Männer zwischen 16 und 40 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (10, 1, 7, 8, 30, 40, 'Hier steht eine andere Information für Männer zwischen 16 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (11, 1, 1, 30, 40, ' Text... hier steht eine andere Information für Männer zwischen 16 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (12, 1, 1, 10, 40, 'Hier steht eine andere Information für Männer zwischen 10 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (13, 1, 3, 0, 60, 'Hier steht wieder eine Information für Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (14, 2, 1, 30, 40, 'Hier steht eine andere Information für Frauen zwischen 30 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (15, 2, 2, 40, 60, 'Hier steht eine andere Information für Frauen zwischen 40 und 60 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (16, 2, 7, 21, 25, 'Hallo %firstname% %lastname%, Hier steht eine andere Information für Frauen zwischen 21 und 25 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (17, 2, 1, 30, 40, 'Hier steht eine andere Information für Frauen zwischen 30 und 40 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (18, 2, 3, 70, 90, 'Hier steht eine andere Information für Frauen zwischen 70 und 90 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (19, 1, 1, 4, 0, 36, '%firstname%,<br />Hier steht eine andere Information für Frauen bis 36 Jahren, die sich für dieses Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (20, 1, 1, 5, 21, 40, 'Hallo Hallo! Hier steht eine andere Information für Frauen zwischen 21 und 40 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (21, 2, 1, 8, 30, 40, 'Hier steht eine andere Information für Frauen zwischen 30 und 40 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (22, 2, 5, 4, 0, 36, '%firstname%,<br />Hier steht eine andere Information für Frauen bis 36 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (23, 2, 6, 5, 21, 40, 'Hallo Hallo! Hier steht eine andere Information für Frauen zwischen 21 und 40 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (24, 2, 7, 8, 10, 60, 'Hey %fistname%, andere Informationen für Frauen zwischen 10 und 60 Jahren, die sich für diese Medikament interessieren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (25, 1, 2, 1, 15, 40, 'Hallo %firstname% %lastname%,<br />Hier steht wieder ein Text für Frauen mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (26, 2, 2, 2, 9, 40, 'Na, %firstname%? Hier steht wieder eine Information für Frauen mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (27, 2, 2, 3, 26, 40, 'Hey Hey, Hier steht wieder eine Information für Frauen mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (28, 1, 2, 4, 30, 40, 'Hier steht wieder eine Information für Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, idpackaging_topic, min_age, max_age, text) VALUES (29, 1, 2, 5, 0, 40, 'Hier steht wieder eine Information für alle Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (30, 1, 2, 0, 40, 'Eine Zusammenfassung für Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (31, 1, 2, 41, 70, 'Eine andere Zusammenfassung für Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (32, 1, 2, 0, 0, 'Eine Zusammenfassung für Männer ohne Altersbezug.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (33, 2, 2, 0, 0, 'Eine Zusammenfassung für Frauen ohne Altersbezug, %firstname%.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (34, 2, 1, 0, 45, 'Eine Zusammenfassung für Frauen bis 45, %firstname%.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (35, 1, 3, 41, 70, 'Eine andere Zusammenfassung für Männer mit %age% Jahren.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (36, 1, 3, 0, 0, 'Eine Zusammenfassung für Männer ohne Altersbezug. 2 mal täglich einnehmen<br />1 Tablette morgens gegen 9:00<br />1 Tablette am Abend gegen 20:00');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (37, 2, 3, 0, 0, 'Eine Zusammenfassung für Frauen ohne Altersbezug, %firstname%.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (38, 2, 4, 0, 0, 'Eine Zusammenfassung für dieses Medikament Frauen ohne Altersbezug, %firstname%.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (61, 1, 11, 0, 0, 'Bitte nehme pro 5mg Amlodipin zu dir.  %firstname%.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, text) VALUES (62, 1, 12, 0, 0, 'Bitte nehme pro 5mg Amlodipin zu dir.  %firstname%.');


-- minimum summaries for listing

INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (49, 1, 1, 0, 0, true, '2 mal täglich einnehmen<br />1 Tablette morgens gegen 9:00<br />1 Tablette am Abend gegen 20:00');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (50, 1, 2, 0, 0, true, '2 Mal am Tag einmassieren');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (51, 1, 3, 0, 0, true, 'Nimm 2 Mal am Tag eine Kapsel, %firstname%.<br />1h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (52, 1, 4, 0, 0, true, '3 mal täglich eincremen<br />1 Mal morgens gegen 9:00<br />1 Mal mittags gegen 14:00<br />1 Mal abend gegen 19:00');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (53, 1, 5, 0, 0, true, '1 Mal am Tag eine Tablette.<br />1h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (54, 1, 6, 0, 0, true, '1 Mal am Abend 20 Tropfen<br />Verträgt sich nicht mit Alkohol!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (55, 1, 7, 0, 0, true, '1 Mal am Morgen eine Kapsel.<br />1h vor der Einnahme darfst dur keine Milch zu dir nehmen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (56, 1, 8, 0, 0, true, 'Nimm 2 Mal am Tag eine Kapsel.<br />1 h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (57, 1, 9, 0, 0, true, '2 Mal am Tag 1 Kapsel<br />20 min vor der Einnahme nicht in die Sonne gehen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (58, 1, 10, 0, 0, true, '1 Mal am Tag eine Tablette in ca. 150 ml warmem Wasser auflösen und trinken.');

INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (39, 2, 1, 0, 0, true, '2 Mal am Tag eine Kapsel.<br />1h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (40, 2, 2, 0, 0, true, '3 Mal am Tag eine Tablette in ca. 150 ml warmem Wasser auflösen und trinken.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (41, 2, 3, 0, 0, true, '1 Spritze morgens gegen 10:00');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (42, 2, 4, 0, 0, true, '2 Mal täglich einschmieren.<br />1 Mal morgens gegen 9:00<br />1 Mal abends gegen 19:00');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (43, 2, 5, 0, 0, true, 'Nimm 2 Mal am Tag eine Kapsel.<br />1h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (44, 2, 6, 0, 0, true, '1 Mal täglich eincremen<br />1h vor der Einnahme nicht duschen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (45, 2, 7, 0, 0, true, 'Vor dem zu Bett gehen eine Filmtablette einnehmen.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (46, 2, 8, 0, 0, true, 'Nimm 2 Mal am Tag eine Kapsel.<br />1h vor der Einnahme nichts essen!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (47, 2, 9, 0, 0, true, '1 Mal am Abend 20 Tropfen<br />Verträgt sich nicht mit Nikotin!');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (48, 2, 10, 0, 0, true, '1 Mal täglich morgens gegen 8:00 einnehmen');

INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (59, 1, 1, 18, 25, true, 'Jeden zweiten Tag eine Tablette lutschen.');
INSERT INTO tailored_text (id, idgender, iddrug, min_age, max_age, is_minimum, text) VALUES (60, 2, 2, 21, 40, true, 'Jeden dritten Tag eine Tablette kauen und nicht in Chlorwasser schwimmen.');
