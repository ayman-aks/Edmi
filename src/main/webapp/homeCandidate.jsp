<%@page pageEncoding="UTF-8" contentType="text/html" %>
<!DOCTYPE html>
<html>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link
    href="https://fonts.googleapis.com/css?family=Raleway"
    rel="stylesheet"
  />
  <link rel="stylesheet" href="bootstrap.css" />

  <style>
    * {
      box-sizing: border-box;
    }

    body {
      background-color: #f6f6f6;
      font-family: Arial, Helvetica, sans-serif;
    }

    .Fst {
      display: none;
    }

    #regForm {
      margin: 100px auto;
      font-family: Raleway;
      padding: 40px;
      width: 70%;
      min-width: 300px;
      background-color: #f1f1f1;
      font-family: Arial, Helvetica, sans-serif;
    }

    h1 {
      font-family: Arial, Helvetica, sans-serif;
      text-align: center;
    }

    input,
    select {
      padding: 10px;
      width: 100%;
      font-size: 17px;
      font-family: Raleway;
      border: 1px solid #aaaaaa;
      font-family: Arial, Helvetica, sans-serif;
    }

    input.invalid {
      background-color: #ffdddd;
    }

    /* Hide all steps by default: */
    .tab {
      display: none;
    }

    button {
      background-color: #04aa6d;
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
      background-color: blue;
    }
    a {
      text-decoration: none;
    }
  </style>

  <body>
    <br />
      <a class="text-white" href="logOut"><button class="btn text-white float-end bg-danger">Deconnexion</button></a>
    <br /><br />
    <h1 class="container shadow py-5">
      ECOLE DOCTORALE DE MATHEMATIQUE ET D'INFORMATIQUE
    </h1>

    <form id="regForm" class="shadow" action="homeCandidateForm" method="POST">
      <h1>FORMULAIRE DE CANDIDATURE:</h1>
      <br /><br />
      <div class="tab">
        <h2 class="container-fluid">identification du candidat:</h2>

        Nom:
        <p>
          <input
            type="text"
            placeholder="nom"
            oninput="this.className = ''"
            name="name"
            value="${candidateIdentifier.get(0).name}"
            disabled
          />
        </p>
        Nom d'epouse:
        <p>
          <input
            type="text"
            placeholder="nom"
            oninput="this.className = ''"
            value=""
            name="nameWife"
          />
        </p>

        Prenom:
        <p>
          <input
            type="text"
            placeholder="prenom"
            oninput="this.className = ''"
            name="surname"
            value="${candidateIdentifier.get(0).surname}"
            disabled
          />
        </p>
        Addresse domicile:
        <p>
          <input
            type="text"
            placeholder="addresse"
            oninput="this.className = ''"
            value=""
            name="homeAddress"
            value=""
          />
        </p>
        Telephone:
        <p>
          <input
            type="tel"
            placeholder="+221...."
            oninput="this.className = ''"
            value=""
            name="phoneNumber"
          />
        </p>
        Email
        <p>
          <input
            placeholder="use@mail.com"
            oninput="this.className = ''"
            name="email"
            value="${candidateIdentifier.get(0).email}"
            disabled
          />
        </p>
      </div>

      <div class="tab">
        <h2 class="container-fluid">CURSUS UNIVERSITAIRE DU CANDIDAT:</h2>
        diplôme d'acces:
        <p>
          <input
            type="text"
            placeholder="diplome"
            oninput="this.className = ''"
            name="accessDiploma"
            value=""
          />
        </p>
        Specialite:
        <p>
          <input
            type="text"
            placeholder="specialité"
            oninput="this.className = ''"
            name="speciality"
            value=""
          />
        </p>
        Université ayant delivre le diplome:
        <p>
          <input
            type="text"
            placeholder="universite"
            oninput="this.className = ''"
            name="university"
            value=""
          />
        </p>
        Pays:
        <p>
          <select
            placeholder="pays"
            oninput="this.className = ''"
            name="country"
            value=""
          >
            <option value="Sénégal" selected="selected">Sénégal</option>
            <option value="Afghanistan">Afghanistan</option>
            <option value="Afrique_Centrale">Afrique_Centrale</option>
            <option value="Afrique_du_sud">Afrique_du_Sud</option>
            <option value="Albanie">Albanie</option>
            <option value="Algerie">Algerie</option>
            <option value="Allemagne">Allemagne</option>
            <option value="Andorre">Andorre</option>
            <option value="Angola">Angola</option>
            <option value="Anguilla">Anguilla</option>
            <option value="Arabie_Saoudite">Arabie_Saoudite</option>
            <option value="Argentine">Argentine</option>
            <option value="Armenie">Armenie</option>
            <option value="Australie">Australie</option>
            <option value="Autriche">Autriche</option>
            <option value="Azerbaidjan">Azerbaidjan</option>
            <option value="Bahamas">Bahamas</option>
            <option value="Bangladesh">Bangladesh</option>
            <option value="Barbade">Barbade</option>
            <option value="Bahrein">Bahrein</option>
            <option value="Belgique">Belgique</option>
            <option value="Belize">Belize</option>
            <option value="Benin">Benin</option>
            <option value="Bermudes">Bermudes</option>
            <option value="Bielorussie">Bielorussie</option>
            <option value="Bolivie">Bolivie</option>
            <option value="Botswana">Botswana</option>
            <option value="Bhoutan">Bhoutan</option>
            <option value="Boznie_Herzegovine">Boznie_Herzegovine</option>
            <option value="Bresil">Bresil</option>
            <option value="Brunei">Brunei</option>
            <option value="Bulgarie">Bulgarie</option>
            <option value="Burkina_Faso">Burkina_Faso</option>
            <option value="Burundi">Burundi</option>
            <option value="Caiman">Caiman</option>
            <option value="Cambodge">Cambodge</option>
            <option value="Cameroun">Cameroun</option>
            <option value="Canada">Canada</option>
            <option value="Canaries">Canaries</option>
            <option value="Cap_vert">Cap_Vert</option>
            <option value="Chili">Chili</option>
            <option value="Chine">Chine</option>
            <option value="Chypre">Chypre</option>
            <option value="Colombie">Colombie</option>
            <option value="Comores">Colombie</option>
            <option value="Congo">Congo</option>
            <option value="Congo_democratique">Congo_democratique</option>
            <option value="Cook">Cook</option>
            <option value="Coree_du_Nord">Coree_du_Nord</option>
            <option value="Coree_du_Sud">Coree_du_Sud</option>
            <option value="Costa_Rica">Costa_Rica</option>
            <option value="Cote_d_Ivoire">Côte_d_Ivoire</option>
            <option value="Croatie">Croatie</option>
            <option value="Cuba">Cuba</option>
            <option value="Danemark">Danemark</option>
            <option value="Djibouti">Djibouti</option>
            <option value="Dominique">Dominique</option>
            <option value="Egypte">Egypte</option>
            <option value="Emirats_Arabes_Unis">Emirats_Arabes_Unis</option>
            <option value="Equateur">Equateur</option>
            <option value="Erythree">Erythree</option>
            <option value="Espagne">Espagne</option>
            <option value="Estonie">Estonie</option>
            <option value="Etats_Unis">Etats_Unis</option>
            <option value="Ethiopie">Ethiopie</option>
            <option value="Falkland">Falkland</option>
            <option value="Feroe">Feroe</option>
            <option value="Fidji">Fidji</option>
            <option value="Finlande">Finlande</option>
            <option value="France">France</option>
            <option value="Gabon">Gabon</option>
            <option value="Gambie">Gambie</option>
            <option value="Georgie">Georgie</option>
            <option value="Ghana">Ghana</option>
            <option value="Gibraltar">Gibraltar</option>
            <option value="Grece">Grece</option>
            <option value="Grenade">Grenade</option>
            <option value="Groenland">Groenland</option>
            <option value="Guadeloupe">Guadeloupe</option>
            <option value="Guam">Guam</option>
            <option value="Guatemala">Guatemala</option>
            <option value="Guernesey">Guernesey</option>
            <option value="Guinee">Guinee</option>
            <option value="Guinee_Bissau">Guinee_Bissau</option>
            <option value="Guinee equatoriale">Guinee_Equatoriale</option>
            <option value="Guyana">Guyana</option>
            <option value="Guyane_Francaise ">Guyane_Francaise</option>
            <option value="Haiti">Haiti</option>
            <option value="Hawaii">Hawaii</option>
            <option value="Honduras">Honduras</option>
            <option value="Hong_Kong">Hong_Kong</option>
            <option value="Hongrie">Hongrie</option>
            <option value="Inde">Inde</option>
            <option value="Indonesie">Indonesie</option>
            <option value="Iran">Iran</option>
            <option value="Iraq">Iraq</option>
            <option value="Irlande">Irlande</option>
            <option value="Islande">Islande</option>
            <option value="Israel">Israel</option>
            <option value="Italie">italie</option>
            <option value="Jamaique">Jamaique</option>
            <option value="Jan Mayen">Jan Mayen</option>
            <option value="Japon">Japon</option>
            <option value="Jersey">Jersey</option>
            <option value="Jordanie">Jordanie</option>
            <option value="Kazakhstan">Kazakhstan</option>
            <option value="Kenya">Kenya</option>
            <option value="Kirghizstan">Kirghizistan</option>
            <option value="Kiribati">Kiribati</option>
            <option value="Koweit">Koweit</option>
            <option value="Laos">Laos</option>
            <option value="Lesotho">Lesotho</option>
            <option value="Lettonie">Lettonie</option>
            <option value="Liban">Liban</option>
            <option value="Liberia">Liberia</option>
            <option value="Liechtenstein">Liechtenstein</option>
            <option value="Lituanie">Lituanie</option>
            <option value="Luxembourg">Luxembourg</option>
            <option value="Lybie">Lybie</option>
            <option value="Macao">Macao</option>
            <option value="Macedoine">Macedoine</option>
            <option value="Madagascar">Madagascar</option>
            <option value="Madère">Madère</option>
            <option value="Malaisie">Malaisie</option>
            <option value="Malawi">Malawi</option>
            <option value="Maldives">Maldives</option>
            <option value="Mali">Mali</option>
            <option value="Malte">Malte</option>
            <option value="Man">Man</option>
            <option value="Mariannes du Nord">Mariannes du Nord</option>
            <option value="Maroc">Maroc</option>
            <option value="Marshall">Marshall</option>
            <option value="Martinique">Martinique</option>
            <option value="Maurice">Maurice</option>
            <option value="Mauritanie">Mauritanie</option>
            <option value="Mayotte">Mayotte</option>
            <option value="Mexique">Mexique</option>
            <option value="Micronesie">Micronesie</option>
            <option value="Midway">Midway</option>
            <option value="Moldavie">Moldavie</option>
            <option value="Monaco">Monaco</option>
            <option value="Mongolie">Mongolie</option>
            <option value="Montserrat">Montserrat</option>
            <option value="Mozambique">Mozambique</option>
            <option value="Namibie">Namibie</option>
            <option value="Nauru">Nauru</option>
            <option value="Nepal">Nepal</option>
            <option value="Nicaragua">Nicaragua</option>
            <option value="Niger">Niger</option>
            <option value="Nigeria">Nigeria</option>
            <option value="Niue">Niue</option>
            <option value="Norfolk">Norfolk</option>
            <option value="Norvege">Norvege</option>
            <option value="Nouvelle_Caledonie">Nouvelle_Caledonie</option>
            <option value="Nouvelle_Zelande">Nouvelle_Zelande</option>
            <option value="Oman">Oman</option>
            <option value="Ouganda">Ouganda</option>
            <option value="Ouzbekistan">Ouzbekistan</option>
            <option value="Pakistan">Pakistan</option>
            <option value="Palau">Palau</option>
            <option value="Palestine">Palestine</option>
            <option value="Panama">Panama</option>
            <option value="Papouasie_Nouvelle_Guinee">
              Papouasie_Nouvelle_Guinee
            </option>
            <option value="Paraguay">Paraguay</option>
            <option value="Pays_Bas">Pays_Bas</option>
            <option value="Perou">Perou</option>
            <option value="Philippines">Philippines</option>
            <option value="Pologne">Pologne</option>
            <option value="Polynesie">Polynesie</option>
            <option value="Porto_Rico">Porto_Rico</option>
            <option value="Portugal">Portugal</option>
            <option value="Qatar">Qatar</option>
            <option value="Republique_Dominicaine">
              Republique_Dominicaine
            </option>
            <option value="Republique_Tcheque">Republique_Tcheque</option>
            <option value="Reunion">Reunion</option>
            <option value="Roumanie">Roumanie</option>
            <option value="Royaume_Uni">Royaume_Uni</option>
            <option value="Russie">Russie</option>
            <option value="Rwanda">Rwanda</option>
            <option value="Sahara Occidental">Sahara Occidental</option>
            <option value="Sainte_Lucie">Sainte_Lucie</option>
            <option value="Saint_Marin">Saint_Marin</option>
            <option value="Salomon">Salomon</option>
            <option value="Salvador">Salvador</option>
            <option value="Samoa_Occidentales">Samoa_Occidentales</option>
            <option value="Samoa_Americaine">Samoa_Americaine</option>
            <option value="Sao_Tome_et_Principe">Sao_Tome_et_Principe</option>
            <option value="Senegal">Senegal</option>
            <option value="Seychelles">Seychelles</option>
            <option value="Sierra Leone">Sierra Leone</option>
            <option value="Singapour">Singapour</option>
            <option value="Slovaquie">Slovaquie</option>
            <option value="Slovenie">Slovenie</option>
            <option value="Somalie">Somalie</option>
            <option value="Soudan">Soudan</option>
            <option value="Sri_Lanka">Sri_Lanka</option>
            <option value="Suede">Suede</option>
            <option value="Suisse">Suisse</option>
            <option value="Surinam">Surinam</option>
            <option value="Swaziland">Swaziland</option>
            <option value="Syrie">Syrie</option>
            <option value="Tadjikistan">Tadjikistan</option>
            <option value="Taiwan">Taiwan</option>
            <option value="Tonga">Tonga</option>
            <option value="Tanzanie">Tanzanie</option>
            <option value="Tchad">Tchad</option>
            <option value="Thailande">Thailande</option>
            <option value="Tibet">Tibet</option>
            <option value="Timor_Oriental">Timor_Oriental</option>
            <option value="Togo">Togo</option>
            <option value="Trinite_et_Tobago">Trinite_et_Tobago</option>
            <option value="Tristan da cunha">Tristan de cuncha</option>
            <option value="Tunisie">Tunisie</option>
            <option value="Turkmenistan">Turmenistan</option>
            <option value="Turquie">Turquie</option>
            <option value="Ukraine">Ukraine</option>
            <option value="Uruguay">Uruguay</option>
            <option value="Vanuatu">Vanuatu</option>
            <option value="Vatican">Vatican</option>
            <option value="Venezuela">Venezuela</option>
            <option value="Vierges_Americaines">Vierges_Americaines</option>
            <option value="Vierges_Britanniques">Vierges_Britanniques</option>
            <option value="Vietnam">Vietnam</option>
            <option value="Wake">Wake</option>
            <option value="Wallis et Futuma">Wallis et Futuma</option>
            <option value="Yemen">Yemen</option>
            <option value="Yougoslavie">Yougoslavie</option>
            <option value="Zambie">Zambie</option>
            <option value="Zimbabwe">Zimbabwe</option>
          </select>
          <!-- <input
            placeholder="pays"
            oninput="this.className = ''"
            name="country"
            value=""
          /> -->
        </p>
        Lieu d'obtention du diplome:
        <p>
          <input
            type="text"
            placeholder="lieu "
            oninput="this.className = ''"
            name="placeDiploma"
            value=""
          />
        </p>
        date d'obtention du diplome:
        <p>
          <input
            type="date"
            placeholder="date"
            oninput="this.className = ''"
            name="dateDiploma"
            value=""
          />
        </p>
        Mention:
        <p>
          <select name="mention" id="" oninput="this.className = ''">
            <option value="Passable">Passable</option>
            <option value="Assez Bien">Assez Bien</option>
            <option value="Bien">Bien</option>
            <option value="Tres Bien">Très Bien</option>
          </select>
          <!-- <input
            type="text"
            placeholder="mention"
            oninput="this.className = ''"
            name="mention"
            value=""
          /> -->
        </p>
      </div>
      <div class="tab">
        <h2 class="container-fluid">
          DOCTORAT AUQUEL LE CANDIDAT DEMANDE SON ADMISSION:
        </h2>
        Intitulé du doctorat:
        <p>
          <select name="entitled" id="" oninput="this.className = ''">
            <option value="Géométrie Différentielle et Application">
              Géométrie Différentielle et Application
            </option>
            <option value="Codage, Cryptographie, Algèbre et Applications">
              Codage, Cryptographie, Algèbre et Applications
            </option>
            <option value="Informatique">Informatique</option>
            <option value="Modélisation et Calcul Scientifique">
              Modélisation et Calcul Scientifique
            </option>
            <option value="Télécommunications">Télécommunications</option>
            <option value="Analyse, Statistiques et Applications">
              Analyse, Statistiques et Applications
            </option>
            <option value="Didactique des Mathématiques">
              Didactique des Mathématiques
            </option>
            <option value="Sciences et Technologies du Numérique">
              Sciences et Technologies du Numérique
            </option>
          </select>
        </p>
        Etablissement de ratachement du doctorat:
        <p>
          <select name="institute" id="main_menu" oninput="this.className = ''">
            <option value="Esp">Esp</option>
            <option value="Fst">Fst</option>
          </select>
          <!-- <input
            type="text"
            placeholder="etablissement"
            oninput="this.className = ''"
            name="institute"
            value=""
          /> -->
        </p>
        Ecole doctorale
        <p>
          <input
            placeholder="edmi"
            oninput="this.className = ''"
            name="phdSchool"
            value="EDMI"
            disabled
          />
        </p>
        intitule et addresse du laboratoire d'acceuil:
        <p>
          <select
            oninput="this.className=''"
            id="sub_menu"
            name="nameAddressLaboratory"
            class="custom_select"
          ></select>
          <!-- <input
            placeholder="addresse du laboratoire"
            oninput="this.className = ''"
            name="nameAdressLaboratory"
            value=""
          /> -->
        </p>
        Sujet de these:
        <p>
          <input
            placeholder="Sujet de these"
            oninput="this.className = ''"
            name="topicPhd"
            value=""
          />
        </p>
      </div>
      <div class="tab">
        <h2 class="container-fluid">THESE EN COTUTELLE:</h2>
        Nom et addresse de l'etablissement universitaire partenaire:
        <p>
          <input
            type="text"
            placeholder="nom  addresse"
            oninput="this.className = ''"
            value=""
            name="nameAddressUniversity"
          />
        </p>
        Nom et prenoms du responsable de la formation doctorale dans
        l'etablissement partenaire:
        <p>
          <input
            placeholder="nom prenom"
            oninput="this.className = ''"
            name="nameSurnameManagerFormation"
            value=""
            type="text"
          />
        </p>
        Nom,prenoms et grade du Directeur de these dans l'etablissement
        partenaire:
        <p>
          <input
            placeholder="nom prenom"
            oninput="this.className = ''"
            name="nameSurnameManagerThesis"
            type="text"
          />
        </p>
      </div>
      <div style="overflow: auto">
        <div style="float: right">
          <button type="button" id="prevBtn" onclick="nextPrev(-1)">
            Previous
          </button>
          <button
            type="button"
            id="nextBtn"
            class="btn-primary"
            onclick="nextPrev(1)"
          >
            Next
          </button>
        </div>
      </div>
      <!-- Circles which indicates the steps of the form: -->
      <div style="text-align: center; margin-top: 40px">
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
        <span class="step"></span>
      </div>
    </form>
    <script src="./js/dynamic.js"></script>
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
        if (n == x.length - 1) {
          document.getElementById("nextBtn").innerHTML = "Submit";
        } else {
          document.getElementById("nextBtn").innerHTML = "Next";
        }
        //... and run a function that will display the correct step indicator:
        fixStepIndicator(n);
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
        var x,
          y,
          i,
          valid = true;
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
          document.getElementsByClassName("step")[currentTab].className +=
            " finish";
        }
        return valid; // return the valid status
      }

      function fixStepIndicator(n) {
        // This function removes the "active" class of all steps...
        var i,
          x = document.getElementsByClassName("step");
        for (i = 0; i < x.length; i++) {
          x[i].className = x[i].className.replace(" active", "");
        }
        //... and adds the "active" class on the current step:
        x[n].className += " active";
      }
    </script>
  </body>
</html>
