<%@page pageEncoding="UTF-8" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CANDIDATURE</title>
    <!-- Normalize CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
    <!-- Bootstrap 4 CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta.2/css/bootstrap.css'>
    <!-- Telephone Input CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.2/css/intlTelInput.css'>
    <!-- Icons CSS -->
    <link rel='stylesheet' href='https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css'>
    <!-- Nice Select CSS -->
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css'>
    <!-- Style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Demo CSS -->
    <link rel="stylesheet" href="css/demo.css">

</head>
<body>
<header class="intro">
    <h1>ECOLE DOCTORALE DE MATHEMATIQUE ET D'INFORMATIQUE </h1>
    <p> FORMULAIRE DE CANDIDATURE.</p>


</header>

<main class="container-fluid w-30">
    <article>

        <!-- Start Multiform HTML -->
        <section class="multi_step_form ">
            <form id="msform" method="POST" name="form" action="homeCandidateForm">
                <!-- Tittle -->
                <div class="tittle">
                    <h2> Processus de candidature</h2>
                    <p>Veuillez completer tous les champs</p>
                </div>
                <!-- progressbar -->
                <ul id="progressbar">
                    <li class="active">INFORMATIONS DU CANDIDAT</li>
                    <li>CURSUS UNIVERSITAIRE DU CANDIDAT</li>
                    <li>DOCTORAT AUQUEL LE CANDIDAT  DEMANDE SON ADMISSION </li>
                    <li>THÈSE EN COTUTELLE</li>
                </ul>
                <!-- fieldsets -->
                <fieldset>
                    <h3>remplissez les champs suivants</h3>
                    <div class="form-column">
                        <center>
                            <div class="form-group col-md-6">
                                <label for="name">NOM:</label>
                                <input type="text"  class="form-control" disabled value="${candidateIdentifier.get(0).name}" name="myName" placeholder="nom" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">NOM D'ÉPOUSE:</label>
                                <input type="text" class="form-control" name="nameWife" value="" placeholder="nom d'épouse" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">PRENOM:</label>
                                <input type="text" class="form-control" disabled name="surname" value="${candidateIdentifier.get(0).surname}" placeholder="prenom" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">ADDRESSE DOMICILE:</label>
                                <input type="text" class="form-control" name="homeAdress"  value="" placeholder="adresse domicile" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">TELEPHONE:</label>
                                <input type="tel" id="phone" class="form-control" name="phoneNumber" value="" placeholder="numero de telephone" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">EMAIL:</label>
                                <input type="email" class="form-control" name="email" disabled value="${candidateIdentifier.get(0).email}" placeholder="user@gmail.com" required>

                            </div>

                    </div>

                    </center>
                    </div>



                    <button type="button" class="action-button previous_button">Back</button>
                    <button type="button" class="next action-button">Continue</button>
                </fieldset>
                <fieldset>
                    <h3>CURSUS UNIVERSITAIRE DU CANDIDAT</h3>
                    <div class="form-column">
                        <center>
                            <div class="form-group col-md-6">
                                <label for="name">DIPLOME D'ACCES:</label>
                                <input type="text"  class="form-control" name="accessDiploma" placeholder="diplome d'acces" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">SPÉCIALITÉ:</label>
                                <input type="text" class="form-control" name="speciality" placeholder="spécialité" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">UNIVERSITÉ AYANT DÉLIVRÉ LE DIPLOME:</label>
                                <input type="text" class="form-control" name="university" placeholder="université" required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">PAYS:</label>
                                <input type="text" class="form-control" name="country" placeholder="pays"required>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">LIEU D'OBTENTION DE DIPLOME:</label>
                                <input type="text"  class="form-control" name="placeDiploma" placeholder="lieu d'obtention du diplome" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">DATE D'OBTENTION DE DIPLOME:</label>
                                <input type="date"  class="form-control" name="dateDiploma" placeholder="dtae d'obtention du diplome" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="surname">MENTION:</label>
                                <input type="text" class="form-control" name="mention" placeholder="mention" required>

                            </div>

                    </div>

                    </center>
                    </div>

                    <button type="button" class="action-button previous previous_button">Back</button>
                    <button type="button" class="next action-button">Continue</button>
                </fieldset>
                <fieldset>
                    <h3>DOCTORAT AUQUEL LE CANDIDAT DEMANDE SON ADMISSION</h3>
                    <center>
                        <div class="form-group col-md-6">
                            <label for="name">INTITULÉ DU DOCTORAT</label>
                            <input type="text"  class="form-control" name="entitled" placeholder="intitulé du doctorat" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">ETABLISSEMENT DE RATACHEMENT DU DOCTORAT:</label>
                            <input type="text" class="form-control" name="institute" placeholder="etablissement" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">ÉCOLE DOCTORALE:</label>
                            <input type="text" class="form-control" name="phdSchool" placeholder="école doctorale" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">INTITULÉ ET ADRESSE DU LABORATOIRE D'ACCEUIL:</label>
                            <input type="text" class="form-control" name="nameAddressLaboratory" placeholder="intitulé et addresse du laboratoire d'acceuil" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">SUJET DE THÈSE:</label>
                            <input type="text"  class="form-control w-10 h-50" name="topicPhd" placeholder="sujet de thèse" required>
                        </div>






                    </center>
                    </div>
                    <button type="button" class="action-button previous previous_button">Back</button>
                    <button type="button" class="next action-button">Continue</button>

                </fieldset>
                <fieldset>
                    <h3>THÈSE EN COTUTELLE</h3>
                    <center>
                        <div class="form-group col-md-6">
                            <label for="name">NOM ET ADRESSE DE L'ÉTABLISSEMENT UNIVERSITAIRE PARTENAIRE</label>
                            <input type="text"  class="form-control" name="nameAddressUniversity" placeholder="nom et addresse de l'etablissement universitaire partenaire" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">NOM ET PRENOM DU RESPONSABLE DE LA FORMATION DOCTORALE DANS L'ÉTABLISSEMENT PARTENAIRE:</label>
                            <input type="text" class="form-control" name="nameSurnameManagerFormation" placeholder="nom et prenom" required>

                        </div>
                        <div class="form-group col-md-6">
                            <label for="surname">NOM,PRENOM ET GRADE DU DIRECTEUR DE THESE DE L'ETABLISSEMENT PARTENAIRE:</label>
                            <input type="text" class="form-control" name="nameSurnameManagerThesis" placeholder="nom,prenom,grade" required>

                        </div>






                    </center>
                    </div>
                    <button type="button" class="action-button previous previous_button">Back</button>
                    <input type="submit" value="valider" class="action-button">

                </fieldset>


            </form>
        </section>
        <!-- END Multiform HTML -->
    </article>
</main>

<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-beta/js/bootstrap.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/12.1.2/js/intlTelInput.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js'></script>
<script src="js/script.js"></script>

</body>
</html>