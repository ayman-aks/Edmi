<%@ page import="com.edmi.project.myclass.CandidateIdentifier" %>
<%@ page import="java.util.List" %>
<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="bootstrap.css" />
  <style>
    .contenu {
      padding-top: 4em;
    }

    .lien {
      border-bottom: 0.5px solid gray;
      padding: 0.6em 0em;
    }

    .lien:hover {
      border-bottom: 2px solid rgb(36, 125, 194);
    }

    a {
      text-decoration: none;
    }

    a:hover {
      color: aqua;
    }
    .logo {
      width: 8em;
      height: 6em;
    }
    #bg1,#bg2:hover
    {
      cursor: pointer;
    }
  </style>
  <script>
    function showOne(){
        let v1 = document.getElementById("1");
        let v2 = document.getElementById("2");
        v1.style.display="block";
        v2.style.display="none";
        v1 = document.getElementById("bg1");
        v2 = document.getElementById("bg2");
        v1.classList.add("bg-primary");
        v2.classList.remove("bg-primary");

    }
    function showTwo(){

      let v2 = document.getElementById("2");
      v2.style.display="block";
      v2 = document.getElementById("bg2");
      v2.classList.add("bg-primary");
      let v1 = document.getElementById("1");
      v1.style.display="none";
      v1 = document.getElementById("bg1");
      v1.classList.remove("bg-primary");

    }
  </script>
  <title>Home</title>
</head>

<body>
<div class="container">
  <div class="row edmi-banner shadow p-0 mb-0 bg-white rounded">
    <div class="col-4">
      <div class="container">
        <img src="./img/profile.png" class="container" alt="" />
      </div>
    </div>

    <div class="col">
      <div class="row mt-5">
        <div class="col">
          <h2 class="container p-0">${managerThesis.name} ${managerThesis.surname}</h2>
          <p class="container p-0">Sénégal, DAKAR</p>
        </div>
        <div class="col"></div>
      </div>

      <div class="row mt-5">
        <div class="col container-fluid">
          <button class="btn btn-outline-primary border border-primary float-start">
            <a href="" class="text-dark">Accueil</a>
          </button>
        </div>
        <div class="col container-fluid">
          <button class="btn btn-outline-danger border border-danger float-end">
            <a href="logOutPersonnel" class="text-dark">Deconnexion</a>
          </button>
        </div>
      </div>
    </div>
  </div>
  <div class="row mb-0 px-4">
    <div class="col-3 shadow p-3 mb-5">
      <p class="container contenu">Nom: ${managerThesis.name}</p>
      <hr />
      <p class="container">Prenom: ${managerThesis.surname}</p>
      <hr />
      <p class="container">Email: ${managerThesis.email}</p>
      <hr />
      <h2>Université</h2>
      <br />
      <p class="container">Universite: UCAD</p>
      <hr />
    </div>
    <div class="col">
      <div class="row">
        <div class="col lien px-0 bg-primary" id="bg1" onclick="showOne()">
          <center>
            <a class="text-black-50" >Dossier etudiant:</a>
          </center>
        </div>
        <div class="col lien px-0" id="bg2" onclick="showTwo()">
          <center>
            <a class="text-black-50" >Etudiant Acceptés:</a>
          </center>
        </div>
      </div>
      <br /><br />
      <div class="row shadow table-responsive p-3 mb-5 block" id="1">
        <table class="table">
          <thead>
          <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom:</th>
            <th scope="col">Prenom:</th>
            <th scope="col">Email:</th>
            <th scope="col">CV:</th>
            <th scope="col">diplôme:</th>
            <th scope="col">Convention de cotutelle<br> de theses:</th>
            <th scope="col">Attestation de bourse:</th>
            <th scope="col">Formulaire <br> de Demande<br> d'admission:</th>
            <th>Décision</th>
          </tr>
          </thead>
          <tbody>
          <%
            try {
            List<CandidateIdentifier> candidateIdentifierList= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifierList");
            for (int i=0;i<candidateIdentifierList.size();i++)
            {
            request.setAttribute("candidateIdentifierTemp",candidateIdentifierList.get(i));
            request.setAttribute("count",i+1);
          %>
          <tr>
            <th scope="row">${count}</th>
            <td>${candidateIdentifierTemp.name}</td>
            <td>${candidateIdentifierTemp.surname}</td>
            <td>${candidateIdentifierTemp.email}</td>
            <td><a href="cv?id_candidate=${candidateIdentifierTemp.id}" onclick="window.open('cv?id_candidate=${candidateIdentifierTemp.id}','popup','width=1200,height=800'); return false;">Cv</a></td>
            <td><a href="project?id_candidate=${candidateIdentifierTemp.id}" onclick="window.open('project?id_candidate=${candidateIdentifierTemp.id}','popup','width=1200,height=800'); return false;">diplôme</a></td>
            <td><a href="agreement?id_candidate=${candidateIdentifierTemp.id}" onclick="window.open('agreement?id_candidate=${candidateIdentifierTemp.id}','popup','width=1200,height=800'); return false;">Convention de cotutelle de theses</a></td>
            <td><a href="scholarship?id_candidate=${candidateIdentifierTemp.id}" onclick="window.open('scholarship?id_candidate=${candidateIdentifierTemp.id}','popup','width=1200,height=800'); return false;">Attestation de bourse</a></td>
            <td><a href="formCandidateForPersonnel?id_candidate=${candidateIdentifierTemp.id}" onclick="window.open('formCandidateForPersonnel?id_candidate=${candidateIdentifierTemp.id}','popup','width=1200,height=800'); return false;">Formulaire de demande d'admission</a></td>
            <td>
              <a href="validManagerThesis?id_candidate=${candidateIdentifierTemp.id}"><button class="btn btn-success">Accepter</button></a><br><br>
              <a href="noValidManagerThesis?id_candidate=${candidateIdentifierTemp.id}"><button class="btn btn-danger">Refuser</button></a>
            </td>
          </tr>
          <%

            }
            session.removeAttribute("candidateIdentifierList");
            }catch (Exception e)
            {
              System.err.println(e);
            }
          %>
          </tbody>
        </table>
      </div>
      <div class="row shadow p-3 mb-5" id="2" style="display: none">
        <table class="table">
          <thead>
          <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom:</th>
            <th scope="col">Prenom:</th>
            <th scope="col">Email:</th>
            <th>status</th>
          </tr>
          </thead>
          <tbody>
          <%
            try {
              List<CandidateIdentifier> candidateIdentifierListAccepted= (List<CandidateIdentifier>) session.getAttribute("candidateIdentifierListAccepted");
              for (int i=0;i<candidateIdentifierListAccepted.size();i++)
              {
                request.setAttribute("candidateIdentifierListAccepted",candidateIdentifierListAccepted.get(i));
                request.setAttribute("countAccepted",i+1);
          %>
          <tr>
            <th scope="row">${countAccepted}</th>
            <td>${candidateIdentifierListAccepted.name}</td>
            <td>${candidateIdentifierListAccepted.surname}</td>
            <td>${candidateIdentifierListAccepted.email}</td>
            <td class="text-success">Validé</td>
          </tr>
          <% }
            session.removeAttribute("candidateIdentifierListAccepted");
            }
            catch (Exception e)
            {
              System.out.println(e);
            }

          %>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<!-- Remove the container if you want to extend the Footer to full width. -->
<div class="container my-5">

  <footer class="bg-white text-center text-white">
    <!-- Grid container -->
    <div class="container p-4 pb-0">
      <!-- Section: Social media -->
      <section class="mb-4 h-50">
        <div class="container logo">
          <img src="./img//senegal-ucad.PNG" class="container" alt="">

        </div>
      </section>
    </div>

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color:rgb(36, 127, 194);">
      © 2022 Copyright:
      <a class="text-white" href="http://edmi.ucad.sn">edmi.ucad.sn</a>
    </div>
    <!-- Copyright -->
  </footer>

</div>
<!-- End of .container -->
</body>

</html>
