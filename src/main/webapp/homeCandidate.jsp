<%@page pageEncoding="UTF-8" contentType="text/html" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<link rel="stylesheet" href="bootstrap.css">

<style>
    * {
        box-sizing: border-box;
    }

    body {
        background-color: #f1f1f1;
    }

    #regForm {
        background-color: #ffffff;
        margin: 100px auto;
        font-family: Raleway;
        padding: 40px;
        width: 70%;
        min-width: 300px;
    }

    h1 {
        text-align: center;
    }

    input {
        padding: 10px;
        width: 100%;
        font-size: 17px;
        font-family: Raleway;
        border: 1px solid #aaaaaa;
    }

    input.invalid {
        background-color: #ffdddd;
    }

    /* Hide all steps by default: */
    .tab {
        display: none;
    }

    button {
        background-color: #04AA6D;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        font-size: 17px;
        font-family: Raleway;
        cursor: pointer;
    }

    button:hover {
        opacity: 0.8;
    }

    #prevBtn {
        background-color: #bbbbbb;
    }

    .step {
        height: 15px;
        width: 15px;
        margin: 0 2px;
        background-color: #bbbbbb;
        border: none;
        border-radius: 50%;
        display: inline-block;
        opacity: 0.5;
    }

    .step.active {
        opacity: 1;
    }

    .step.finish {
        background-color: #04AA6D;
    }
</style>
<body>
<br><br><br>
<h1 class="container">ECOLE DOCTORALE DE MATHEMATIQUE ET D'INFORMATIQUE</h1>

<form id="regForm" action="" method="">
    <h1>FORMULAIRE DE CANDIDATURE:</h1><br><br>
    <div class="tab">
        <h2 class="container-fluid">identification du candidat:</h2>

        Nom:
        <p><input  type="text" placeholder="nom"  oninput="this.className = ''" name="name" value="${candidateIdentifier.get(0).name}" disabled></p>
        Nom d'epouse:
        <p><input type="text" placeholder="nom"  oninput="this.className = ''" value="" name="nameWife"></p>


        Prenom:
        <p><input type="text" placeholder="prenom" oninput="this.className = ''" name="surname" value="${candidateIdentifier.get(0).surname}" disabled></p>
        Addresse domicile:
        <p><input type="text" placeholder="addresse" oninput="this.className = ''" value="" name="homeAddress" value=""></p>
        Telephone:
        <p><input type="tel" placeholder="+221...." oninput="this.className = ''" value="" name="phoneNumber"></p>
        Email
        <p><input placeholder="use@mail.com" oninput="this.className = ''" name="email" value="${candidateIdentifier.get(0).email}" disabled></p>

    </div>

    <div class="tab">
        <h2 class="container-fluid">CURSUS UNIVERSITAIRE DU CANDIDAT:</h2>
        diplome d'acces:
        <p><input type="text" placeholder="diplome" oninput="this.className = ''" name="accessDiploma" value=""></p>
        Specialite:
        <p><input type="text" placeholder="specialité" oninput="this.className = ''" name="speciality" value=""></p>
        Université ayant delivre le diplome:
        <p><input type="text" placeholder="universite" oninput="this.className = ''" name="university" value=""></p>
        Pays:
        <p><input placeholder="pays" oninput="this.className = ''" name="country" value=""></p>
        Lieu d'obtention du  diplome:
        <p><input type="text" placeholder="lieu " oninput="this.className = ''" name="placeDiploma" value=""></p>
        date d'obtention du diplome:
        <p><input type="date" placeholder="date" oninput="this.className = ''" name="dateDiploma" value=""></p>
        Mention:
        <p><input type="text" placeholder="mention" oninput="this.className = ''" name="mention" value=""></p>
    </div>
    <div class="tab">
        <h2 class="container-fluid">DOCTORAT AUQUEL LE CANDIDAT DEMANDE SON ADMISSION:</h2>
        intitulé du doctorat:
        <p><input type="text" placeholder="intitulé" oninput="this.className = ''" name="entitled" value=""></p>
        Etablissement de ratachement du doctorat:
        <p><input type="text" placeholder="etablissement" oninput="this.className = ''" name="institute" value=""></p>
        Ecole doctorale
        <p><input placeholder="edmi" oninput="this.className = ''" name="phdSchool" value="EDMI" disabled></p>
        intitule et addresse du laboratoire d'acceuil:
        <p><input placeholder="addresse du laboratoire" oninput="this.className = ''" name="nameAdressLaboratory" value="" ></p>
        Sujet de these:
        <p><input placeholder="Sujet de these" oninput="this.className = ''" name="topicPhd" value="" ></p>


    </div>
    <div class="tab">
        <h2 class="container-fluid">THESE EN COTUTELLE:</h2>
        Nom et addresse de l'etablissement universitaire partenaire:
        <p><input type="text" placeholder="nom  addresse" oninput="this.className = ''" value="" name="nameAdressUniversity"></p>
        Nom et prenoms du responsable de la formation doctorale dans l'etablissement partenaire:
        <p><input placeholder="nom prenom" oninput="this.className = ''" name="nameSurnameManagerFormation" value="" type="text"></p>
        Nom,prenoms et grade du Directeur de these dans l'etablissement partenaire:
        <p><input placeholder="nom prenom" oninput="this.className = ''" name="nameSurnameManagerThesis" type="text"></p>

    </div>
    <div style="overflow:auto;">
        <div style="float:right;">
            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
            <button type="button" id="nextBtn" class="btn-primary" onclick="nextPrev(1)">Next</button>
        </div>
    </div>
    <!-- Circles which indicates the steps of the form: -->
    <div style="text-align:center;margin-top:40px;">
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
    </div>
</form>

<script>
    var currentTab = 0; // Current tab is set to be the first tab (0)
    showTab(currentTab); // Display the current tab

    function showTab(n) {
        // This function will display the specified tab of the form...
        var x = document.getElementsByClassName("tab");
        x[n].style.display = "block";
        //... and fix the Previous/Next buttons:
        if (n == 0) {
            document.getElementById("prevBtn").style.display = "none";
        } else {
            document.getElementById("prevBtn").style.display = "inline";
        }
        if (n == (x.length - 1)) {
            document.getElementById("nextBtn").innerHTML = "Submit";
        } else {
            document.getElementById("nextBtn").innerHTML = "Next";
        }
        //... and run a function that will display the correct step indicator:
        fixStepIndicator(n)
    }

    function nextPrev(n) {
        // This function will figure out which tab to display
        var x = document.getElementsByClassName("tab");
        // Exit the function if any field in the current tab is invalid:
        if (n == 1 && !validateForm()) return false;
        // Hide the current tab:
        x[currentTab].style.display = "none";
        // Increase or decrease the current tab by 1:
        currentTab = currentTab + n;
        // if you have reached the end of the form...
        if (currentTab >= x.length) {
            // ... the form gets submitted:
            document.getElementById("regForm").submit();
            return false;
        }
        // Otherwise, display the correct tab:
        showTab(currentTab);
    }

    function validateForm() {
        // This function deals with validation of the form fields
        var x, y, i, valid = true;
        x = document.getElementsByClassName("tab");
        y = x[currentTab].getElementsByTagName("input");
        // A loop that checks every input field in the current tab:
        for (i = 0; i < y.length; i++) {
            // If a field is empty...
            if (y[i].value == "") {
                // add an "invalid" class to the field:
                y[i].className += " invalid";
                // and set the current valid status to false
                valid = false;
            }
        }
        // If the valid status is true, mark the step as finished and valid:
        if (valid) {
            document.getElementsByClassName("step")[currentTab].className += " finish";
        }
        return valid; // return the valid status
    }

    function fixStepIndicator(n) {
        // This function removes the "active" class of all steps...
        var i, x = document.getElementsByClassName("step");
        for (i = 0; i < x.length; i++) {
            x[i].className = x[i].className.replace(" active", "");
        }
        //... and adds the "active" class on the current step:
        x[n].className += " active";
    }
</script>

</body>
</html>
