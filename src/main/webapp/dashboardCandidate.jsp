<%@ page import="com.edmi.project.myclass.ManagerThesis" %>
    <%@ page import="java.util.List" %>
        <%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0" />
                <link rel="stylesheet" href="bootstrap.css" />
                <link rel="stylesheet" href="css/styleAlert.css">
                <script src="alert.js"></script>
                <script>
                    function showOne() {
                        try {
                            let v1 = document.getElementById("1");
                            let v3 = document.getElementById("3");
                            v1.style.display = "block";
                            v3.style.display = "none";
                            v1 = document.getElementById("bg1");
                            v3 = document.getElementById("bg3");
                            v1.classList.add("bg-primary");
                            v3.classList.remove("bg-primary");
                        } catch (e) {
                            let v1 = document.getElementById("1");
                            v1.style.display = "block";
                            v1 = document.getElementById("bg1");
                            v1.classList.add("bg-primary");
                        }

                    }

                    function showTwo() {

                        let v2 = document.getElementById("2");
                        v2.style.display = "block";
                        v2 = document.getElementById("bg2");
                        v2.classList.add("bg-primary");

                    }

                    function showThree() {
                        try {
                            let v1 = document.getElementById("1");
                            let v3 = document.getElementById("3");
                            v1.style.display = "none";
                            v3.style.display = "block";
                            v1 = document.getElementById("bg1");
                            v3 = document.getElementById("bg3");
                            v3.classList.add("bg-primary");
                            v1.classList.remove("bg-primary");
                        } catch (e) {
                            let v3 = document.getElementById("3");
                            v3.style.display = "block";
                            v3 = document.getElementById("bg3");
                            v3.classList.add("bg-primary");
                        }

                    }
                </script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js">
                </script>
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
                        cursor: pointer;
                    }
                    
                    a {
                        text-decoration: none;
                    }
                    
                    a:hover {
                        color: aqua;
                    }
                    
                    #2 {
                        display: none;
                    }
                    
                    #3 {
                        display: none;
                    }
                    
                    select {
                        padding: 10px;
                        width: 100%;
                        font-size: 17px;
                        font-family: Raleway;
                        border: 1px solid #aaaaaa;
                        font-family: Arial, Helvetica, sans-serif;
                    }
                </style>
                <title>Home</title>
            </head>

            <body>
                <div class="container ">
                    <div class="row edmi-banner shadow p-3 mb-0 bg-white rounded">
                        <div class="col-4">
                            <div class="container">
                                <img src="img/profile.png" class="container " alt="Profile Picture" />
                            </div>
                        </div>

                        <div class="col">
                            <div class="row mt-5">
                                <div class="col">
                                    <h2 class="container p-0">${candidateIdentifierForm.surname} ${candidateIdentifierForm.name}</h2>
                                    <p class="container p-0">Sénégal, ${candidateIdentifierForm.homeAddress}</p>
                                </div>
                                <%
              try{
                String checkUpload=session.getAttribute("fileStatus").toString();
                String checkSubmit=session.getAttribute("candidateSubmit").toString();
                if(checkUpload.equals("valid"))  {
                  if (checkSubmit.equals("no valid")){
            %>
                                    <div class="col container-fluid">
                                        <button class="btn btn-outline-success border border-success float-end " onclick="openForm()">Soumettre</button>
                                    </div>

                                    <div class="modal" id="popupForm">
                                        <p class="message">Cette opération est irréversible</p>
                                        <div class="options">
                                            <a href="submitCandidate" class="text-dark"><button class="btn btn-outline-success border border-success">Valider</button></a>
                                            <button class="btn btn-outline-danger border border-danger" onclick="closeForm()">Annuler</button>
                                        </div>
                                    </div>
                                    <%
            }}
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>
                            </div>

                            <div class="row mt-5">
                                <div class="col container-fluid ">
                                    <button class="btn btn-outline-primary border border-primary float-start "><a href="/" class="text-dark">Accueil</a></button>
                                </div>
                                <div class="col container-fluid">
                                    <a href="logOut" class="text-dark"><button class="btn  btn-outline-danger border border-danger  float-end">
                Deconnexion
              </button>
              </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row mb-0 px-4">
                        <div class="col-4 shadow p-3 mb-5">
                            <p class="container contenu">Nom: ${candidateIdentifierForm.name}</p>
                            <hr />
                            <p class="container">Prenom: ${candidateIdentifierForm.surname}</p>
                            <hr />
                            <p class="container">Email: ${candidateIdentifierForm.email}</p>
                            <hr />
                            <p class="container">Numéro de téléphone: ${candidateIdentifierForm.phoneNumber}</p>
                            <hr />
                            <p class="container">Adresse: ${candidateIdentifierForm.homeAddress}</p>
                            <hr />
                            <h2>Cursus</h2><br>
                            <p class="container">Universite: ${candidateUniversityCurriculumForm.university}</p>
                            <hr />
                            <p class="container">diplome: ${candidateUniversityCurriculumForm.accessDiploma}</p>
                            <hr />

                        </div>
                        <div class="col">
                            <div class="row">
                                <%
              try{
                String check=session.getAttribute("candidateSubmit").toString();
                if(check.equals("valid"))  {
            %>
                                    <div class="col lien px-0 bg-primary" id="bg1" onclick="showOne()">
                                        <center>Suivi de mon dossier</center>
                                    </div>
                                    <%
                }
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>

                                        <%
              try{
                String check=session.getAttribute("candidateSubmit").toString();
                if(check.equals("no valid"))  {
            %>
                                            <div class="col  lien px-0" id="bg2" onclick="showTwo()">
                                                <center>j'insère mes documents</center>
                                            </div>
                                            <%
                }
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>

                                                <%
              try{
                String check=session.getAttribute("candidateSubmit").toString();
                String checkExistManager=session.getAttribute("managerExist").toString();
                if(check.equals("valid") && checkExistManager.equals("no valid"))  {
            %>
                                                    <div class="col  lien px-0 " id="bg3" onclick="showThree()">
                                                        <center>Directeur de these</center>
                                                    </div>
                                                    <%
                }
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>
                                                        <div class="col  lien px-0 ">
                                                            <center>Paramètres</center>
                                                        </div>



                            </div><br><br>
                            <%
              try{
                String check=session.getAttribute("candidateSubmit").toString();
                if(check.equals("valid"))  {
            %>
                                <div class="row shadow p-3 mb-5  block" id="1">
                                    <div class="col  px-0 bg-p">
                                        <p class="text-success">Dossier en cours de traitement </p>

                                    </div>
                                </div>
                                <%
                }
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>

                                    <div class="row shadow p-3 mb-5  block" style="display: none" id="2">
                                        <div class="col  px-0 bg-p">
                                            <center>
                                                <p class="text-dark">J'insère mes documents</p>
                                                <form action="uploadFileForm" method="POST" enctype="multipart/form-data">
                                                    <p>Entrer votre CV:</p>
                                                    <input type="file" name="cv" required accept="application/pdf"><br>
                                                    <p for="thesisProject">Entrer vos chartes de theses:</p>
                                                    <input type="file" name="project" required accept="application/pdf">
                                                    <p>Convention de cotutelle:</p>
                                                    <input type="file" name="agreement" required accept="application/pdf">
                                                    <p>Attestation de bourse:</p>
                                                    <input type="file" name="scholarship" required accept="application/pdf"><br><br>
                                                    <input type="submit" value="valider" class="btn btn-primary">

                                                </form>
                                            </center>
                                        </div>

                                    </div>
                                    <%
              try{
                String check=session.getAttribute("candidateSubmit").toString();
                String checkExistManager=session.getAttribute("managerExist").toString();
                if(check.equals("valid") && checkExistManager.equals("no valid"))  {
            %>
                                        <div class="row shadow p-3 mb-5  block" style="display: none" id="3">
                                            <form method="post" action="formManagerOfCandidate">
                                                <div class="col  px-0 bg-p">
                                                    <center>
                                                        <p class="text-success">Choisir le directeur de thèse: </p>
                                                        <select name="managerThesis">
                      <%
                        List<ManagerThesis> listManagerThesis= (List<ManagerThesis>) session.getAttribute("listManagerThesis");
                        for (int i=0;i<listManagerThesis.size();i++)
                        {
                          session.setAttribute("listManagerThesis",listManagerThesis.get(i).getName()+" "+listManagerThesis.get(i).getSurname());
                          session.setAttribute("managerId",listManagerThesis.get(i).getId());
                      %>
                        <option value="${managerId}" selected="selected">${listManagerThesis}</option>
                      <%

                          }
                        session.removeAttribute("listManagerThesis");
                        session.removeAttribute("managerId");
                      %>
                      <input type="submit" value="valider" class="btn btn-primary" onclick="openForm2(); return false;">
                      <div class="modal" id="popupForm2">
                        <p class="message">Cette opération est irréversible</p>
                        <div class="options">
                            <input type="submit" value="valider" class="btn btn-outline-success border border-success">
                            <button class="btn btn-outline-danger border border-danger" onclick="closeForm2(); return false;">Annuler</button>
                        </div>
                    </div>
                    </center>

                  </div>
            </form>
          </div>
            <%
                }
              }
              catch (NullPointerException e) {
                System.err.println("Caught IOException: " + e.getMessage());}
            %>
          <script>
            <%
              try{
              String check= session.getAttribute("Status").toString();
              if(check.equals("Votre Demande sera traité."))
              {
              %>
          function advertisesuccess() {
          swal("Demande Envoyé", "Merci de vous connecter souvent pour voir l'évolution de votre dossier.", "success");
          }
          advertisesuccess();
          <%
              session.removeAttribute("Status");}
              }
              catch (Exception e){
              System.err.println(e);
              }
              %>
          </script>
  </body>

</html>