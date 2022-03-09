<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="userprofile.css">
    <link rel="stylesheet" href="bootstrap.css">
    <title>PROFILE DE L'UTILISATEUR</title>
    <style>
        button{
            position: relative;
            left: 67em;
            bottom: 2em;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="main-body">

            <nav aria-label="breadcrumb" class="main-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                    <%
                        try{
                            String check=session.getAttribute("fileStatus").toString();
                            if(check.equals("noValid"))  {
                    %>
                    <li class="breadcrumb-item active" aria-current="page"><a href="uploadFile">je soumets mes documents</a></li>
                    <%
                    } else {
                    %>
                    <li class="breadcrumb-item active" aria-current="page"><a href="formCandidate">Ma demande</a></li>
                    <%
                            }}catch (NullPointerException e) {
                            System.err.println("Caught IOException: " + e.getMessage());}
                    %>

                </ol>
                <button class="btn btn-primary"><a class="text-white" href="logOut">deconnexion</a></button>
            </nav>

            <div class="row gutters-sm">
                <div class="col-md-4 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex flex-column align-items-center text-center">
                                <img src="img/User-Profile-PNG-Clipart.png" alt="Admin" class="rounded-circle"
                                    width="150">
                                <div class="mt-3">
                                    <h4>${candidateIdentifierForm.surname} ${candidateIdentifierForm.name}</h4>
                                    <p class="text-secondary mb-1">${candidateUniversityCurriculumForm.accessDiploma}</p>
                                    <p class="text-muted font-size-sm">${candidateIdentifierForm.homeAddress}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        try{
                            String check=session.getAttribute("fileStatus").toString();
                            if(check.equals("noValid"))  {
                    %>
                    <div class="card mt-3">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>Formulaire de candidature</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>diplomes</p>
                                <p class="text-danger">pas encore soumis</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>Cirriculum vitae</p>
                                <p class="text-danger">pas encore soumis</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Projet de these en quelques pages</p>
                                <p class="text-danger">Pas encore soumis</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Convention de cotutelle de thèse</p>
                                <p class="text-danger">pas encore soumis</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Attestation de bourse si vous etes boursier</p>
                                <p class="text-danger">pas encore soumis</p>
                            </li>

                        </ul>
                    </div>
                    <%
                    } else {
                    %>
                    <div class="card mt-3">
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>Formulaire de candidature</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>diplomes</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p>Cirriculum vitae</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Projet de these en quelques pages</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Convention de cotutelle de thèse</p>
                                <p class="text-success">complet</p>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                <p class="w-50">Attestation de bourse si vous etes boursier</p>
                                <p class="text-success">complet</p>
                            </li>

                        </ul>
                    </div>
                    <%
                            }}catch (NullPointerException e) {
                            System.err.println("Caught IOException: " + e.getMessage());}
                    %>
                </div>
                <div class="col-md-8">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Nom:</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${candidateIdentifierForm.name}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Prenom:</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${candidateIdentifierForm.surname}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Telephone:</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${candidateIdentifierForm.phoneNumber}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Email:</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${candidateIdentifierForm.email}
                                </div>
                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Etablissement de provenance:</h6>
                                </div>
                                <div class="col-sm-9 text-secondary">
                                    ${candidateUniversityCurriculumForm.university}
                                </div>
                            </div>
                        </div>
                    </div>
                    <center><strong>
                            <p class="text-success"> ETAT DU DOSSIER: EN COURS DE TRAITEMENT</p>
                        </strong></center>


                </div>
            </div>

</body>

</html>
