<%@ page import="java.io.IOException" %>
<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap.css">
    <title>Demande d'admision</title>
</head>
<body class="bg-light">

<section class="vh-50" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-lg-12 col-xl-11">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
              <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-3 mt-4">ÉCOLE DOCTORALE DE MATHÉMATIQUE ET D'INFORMATIQUE</p>

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Demande D'admission</p>

                <%
                  try{
                  String check=session.getAttribute("verifiyEmailCandidate").toString();
                  if(check.equals("emailError"))  {
                %>
                <div> <center><p class="text-danger">Email Existant!!</p></center></div>
                <%
                  } else {
                %>
                <div class="err"><center><p class="text-success">inscrit avec succes</p></center></div>
                <%
                  }}catch (NullPointerException e) {
                  System.err.println("Caught IOException: " + e.getMessage());}
                %>

                <form class="mx-1 mx-md-4" action="signUpForm" method="POST" enctype="multipart/form-data">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                    <label class="form-label" for="form3Example1c">NOM:</label>

                      <input type="text" id="form3Example1c" class="form-control" name="name" style="text-align:center" placeholder="nom" value="" required/>
                    </div>
                  </div>
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                    <label class="form-label" for="form3Example1c" >PRENOM:</label>
                      <input type="text" id="form3Example1c" name="surname" class="form-control" style="text-align:center" placeholder="prenom" value="" required/>
                    </div>
                  </div>
                  
                 
               
                
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                    <label class="form-label" for="form3Example3c">EMAIL:</label>

                      <input type="email" id="form3Example3c" name="email" class="form-control" style="text-align:center" placeholder="user@mail.com" value=""  required/>
                    </div>
                  </div>
                 

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                    <label class="form-label" for="form3Example3c">MOT DE PASSE:</label>

                      <input type="password" id="form3Example3c" name="password" class="form-control" style="text-align:center" placeholder="mot de passe" value=""  required/>
                    </div>
                  </div>
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                    <label class="form-label" for="form3Example3c">CONFIRMER MOT DE PASSE:</label>

                      <input type="password" id="form3Example3c" name="" class="form-control" style="text-align:center" placeholder="mot de passe" value=""  required/>
                    </div>
                  </div>

                  <div class="form-check d-flex justify-content-center mb-5">
                    <input
                      class="form-check-input me-2"
                      type="checkbox"
                      value=""
                      id="form2Example3c"
                    />
                    <label class="form-check-label" for="form2Example3">
                      j'accept la  <a href="#!">Politique de confidentialité</a>
                    </label>
                  </div>

                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <input  type="submit" value="s'inscrire" class="btn btn-primary btn-lg">
                  </div>

                </form>

              </div>
              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                
                <img src="img/ucadd.jpg" class="img-fluid w-80 " alt="Sample image">

              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>