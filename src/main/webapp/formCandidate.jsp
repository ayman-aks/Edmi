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
    </p>
    <h3 style="margin-bottom: 40px">ECOLE DOCTORALE:</h3>
    <div style="border-bottom: 2px dashed black"></div>
    <div class="c">
        <h4>FORMULAIRE DE DEMANDE D'ADMISSION EN DOCTORAT</h4>
    </div>
    <div class="c1">
        <h3 style="text-align: center; margin-top: 2px">
            Identifiant du candidat
        </h3>
        <div style="width: 50%; display: inline-block">Nom: ${candidateIdentifierForm.name}</div>
        <div style="width: 50%; display: inline">Nom d'épouse: ${candidateIdentifierForm.nameWife}</div>
        <p>Prénoms: ${candidateIdentifierForm.surname}</p>
        <p>Adresse domicile: ${candidateIdentifierForm.homeAdress}</p>
        <div style="width: 50%; display: inline-block">Téléphone: ${candidateIdentifierForm.phoneNumber}</div>
        <div style="width: 50%; display: inline">E-mail: ${candidateIdentifierForm.email}</div>
    </div>
    <div class="c2">
        <h3 style="text-align: center; margin-top: 2px">
            Cursus universitaire du candidat
        </h3>
        <div style="width: 50%; display: inline-block">Diplome d'accès: ${candidateUniversityCurriculumForm.accessDiploma}</div>
        <div style="width: 50%; display: inline">Spécialité: ${candidateUniversityCurriculumForm.speciality}</div>
        <p></p>
        <div style="width: 60%; display: inline-block">
            Université ayant livré le diplome: ${candidateUniversityCurriculumForm.university}
        </div>
        <div style="width: 40%; display: inline">Pays: ${candidateUniversityCurriculumForm.country}</div>
        <p></p>
        <div style="width: 60%; display: inline-block">
            Lieu et date d'obtention du diplome: ${candidateUniversityCurriculumForm.placeDiploma} ${candidateUniversityCurriculumForm.dateDiploma}
        </div>
        <div style="width: 40%; display: inline">Mention: ${candidateUniversityCurriculumForm.mention}</div>
    </div>
    <div class="c2">
        <h3 style="text-align: center; margin-top: 2px">
            Doctorat auquel le candidat demande son admission
        </h3>
        <div>Intitulé du doctorat: ${phdSoughtForm.entitled}</div>
        <p></p>
        <div>Etablissement de rattachement du doctorat: ${phdSoughtForm.institute}</div>
        <p></p>
        <div>Ecole doctorale: ${phdSoughtForm.phdSchool}</div>
        <p></p>
        <div>Intitulé et adresse du laboratoire d'accueil: ${phdSoughtForm.nameAddressLaboratory}</div>
        <p></p>
        <div>Sujet de thèse: ${phdSoughtForm.topicPhd}</div>
    </div>
    <div class="c2">
        <h3 style="text-align: center; margin-top: 2px">Thèse en cotutelle</h3>
        <div>Nom et adresse de l'etablissement universitaire partenaire: ${cotutellePhdForm.nameAddressUniversity}</div>
        <p></p>
        <div>
            Nom et Prénoms du Responsable de la formation doctorale dans
            l'établissement partenaire: ${cotutellePhdForm.nameSurnameManagerFormation}
        </div>
        <p></p>
        <div>
            Nom, prénoms et grade du Directeur de thèse dans l'établissement
            partenaire: ${cotutellePhdForm.nameSurnameManagerThesis}
        </div>
    </div>
</div>
<div style="padding-bottom: 75px"></div>
</body>
</html>