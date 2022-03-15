<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <title>Document</title>
</head>

<body>
<div>
    <h2 style="margin-bottom: 2px">UNIVERSITE CHEIKH ANTA DIOP</h2>
    <p style="text-align: center; margin-top: 2px">
        <img src="ucad.jpg" width="50px" height="50px" alt="" />
</div>
<h3 style="margin-bottom: 40px">ECOLE DOCTORALE:</h3>
<div style="border-bottom: 2px dashed black"></div>
<div class="c">
    <h4>FORMULAIRE DE DEMANDE D'ADMISSION EN DOCTORAT</h4>
</div>
<div class="c1">
    <h3 style="text-align: center; margin-top: 2px">
        Identifiant du candidat
    </h3>
    <% try {

    %>
    <div style="width: 50%; display: inline-block">Nom: ${candidateIdentifierForm.get().name}</div>
    <div style="width: 50%; display: inline">Nom d'épouse: ${candidateIdentifierForm.get().nameWife}</div>
    <div>Prénoms: ${candidateIdentifierForm.get().surname}</div>
    <div>Adresse domicile: ${candidateIdentifierForm.get().homeAddress}</div>
    <div style="width: 50%; display: inline-block">Téléphone: ${candidateIdentifierForm.get().phoneNumber}</div>
    <div style="width: 50%; display: inline">E-mail: ${candidateIdentifierForm.get().email}</div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Cursus universitaire du candidat
    </h3>
    <div style="width: 50%; display: inline-block">Diplome d'accès: ${candidateUniversityCurriculumForm.get().accessDiploma}</div>
    <div style="width: 50%; display: inline">Spécialité: ${candidateUniversityCurriculumForm.get().speciality}</div>
    <div style="width: 60%; display: inline-block">
        Université ayant livré le diplome: ${candidateUniversityCurriculumForm.get().university}
    </div>
    <div style="width: 40%; display: inline">Pays: ${candidateUniversityCurriculumForm.get().country}</div>
    <div style="width: 60%; display: inline-block">
        Lieu et date d'obtention du diplome: ${candidateUniversityCurriculumForm.get().placeDiploma} ${candidateUniversityCurriculumForm.get().dateDiploma}
    </div>
    <div style="width: 40%; display: inline">Mention: ${candidateUniversityCurriculumForm.get().mention}</div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Doctorat auquel le candidat demande son admission
    </h3>
    <div>Intitulé du doctorat: ${phdSoughtForm.get().entitled}</div>
    <div>Etablissement de rattachement du doctorat: ${phdSoughtForm.get().institute}</div>
    <div>Ecole doctorale: ${phdSoughtForm.get().phdSchool}</div>
    <div>Intitulé et adresse du laboratoire d'accueil: ${phdSoughtForm.get().nameAddressLaboratory}</div>
    <div>Sujet de thèse: ${phdSoughtForm.get().topicPhd}</div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">Thèse en cotutelle</h3>
    <div>Nom et adresse de l'etablissement universitaire partenaire: ${cotutellePhdForm.get().nameAddressUniversity}</div>
    <div>
        Nom et Prénoms du Responsable de la formation doctorale dans l'établissement partenaire: ${cotutellePhdForm.get().nameSurnameManagerFormation}
    </div>
    <div>
        Nom, prénoms et grade du Directeur de thèse dans l'établissement partenaire: ${cotutellePhdForm.get().nameSurnameManagerThesis}
    </div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Avis du(des) Directeur(s) de thèse
    </h3>
    <div>Nom, prénoms et grade du Directeur de thèse:</div>
    <div>Addresse:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis1" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis1" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
    <p style="margin-bottom: 15px"></p>
    <div>Nom, prénoms et grade du co-directeur de thèse:</div>
    <div>Addresse:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis2" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis2" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Avis du laboratoire d'accueil (s'il existe)
    </h3>
    <div>Nom et prénoms du directeur de laboratoire:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis3" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis3" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Avis du responsable du doctorat
    </h3>
    <div>Nom et prénoms du Responsable du doctorat:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis4" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis4" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Avis du directeur de l'Ecole doctorale
    </h3>
    <div>Nom et prénoms du directeur de l'Ecole doctorale:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis5" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis5" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
</div>
<div class="c2">
    <h3 style="text-align: center; margin-top: 2px">
        Avis du chef de l'établissement de rattachement du Doctorat
    </h3>
    <div>Nom et prénoms du chef de l'établissement:</div>
    <div style="width: 50%; display: inline-block">
        Avis favorable: <input type="radio" name="avis6" id="favorable" />
    </div>
    <div style="width: 50%; display: inline">
        Avis défavorable:
        <input type="radio" name="avis6" id="defavorable" />
    </div>
    <div style="width: 53%; display: inline-block">Date:</div>
    <div style="width: 47%; display: inline">Signature:
        <img src="ucad.jpg" width="30px" height="10px" alt="" /></div>
</div>
</div>
<div style="padding-bottom: 75px"></div>
</body>
    <%
    session.invalidate();
    } catch (Exception e)
    {
        System.err.println(e);
    }%>
</html>