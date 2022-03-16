<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="bootstrap.css" />
  <style>
    @media screen and (min-width: 464px) {

      .roww {
        height: 55em;
        width: 55%;
        border-end-end-radius: 255%;
        background: rgb(36, 127, 194);
        display: flex;
        flex-direction: column;
      }

      .center-margin {
        margin-top: -2em;
      }

    }

    @media screen and (max-width: 464px) {

      .roww {
        height: 10em;
        width: 55%;
        border-end-end-radius: 255%;
        border-end-start-radius: 255%;
        background: rgb(36, 127, 194);
        display: flex;
        flex-direction: column;
      }

      .person {
        height: 2em;
        display: none
      }

    }





    a {
      text-decoration: none;
    }

    .logo {
      width: 15em;
      height: 12em;
    }
  </style>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js">

  </script>
  <script src="jquery.js"></script>

  <title>Connexion</title>
</head>

<body>
  <div class="container-fluid">
    <div class="row">
      <div class="col roww text-white">

      </div>
      <div class="col">
        <center>
          <h1 class="container">
            École Doctorale de Mathematiques et d'Informatique
          </h1>
          <br />
          <div class="container logo">
            <img src="./img/senegal-ucad.PNG" class="container" alt="" srcset="" />
          </div>
        </center>


        <section class="h-50" style="background-color: white; ">
          <form method="POST" action="loginManagerThesisForm"  class="form mx-1 mx-md-4">
            <center>
              <h2>Page de connexion</h2>
              <br /><br />
              <div class="tab">
                <div class="d-flex flex-row align-items-center mb-0">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0 input-group mb-3">
                    <div class="input-group-prepend">
                      <span class="input-group-text" aria-label="arobase">@</span>
                    </div>
                    <input type="email" id="form3Example1c" class="form-control rounded-top-bottom" name="email"
                      style="text-align: center" placeholder="user@email" value="" required />
                  </div>
                </div>
              </div>
              <div class="d-flex flex-row align-items-center mb-4">
                <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                <div class="form-outline flex-fill mb-0">
                  <select name=""  id="selection" class="form-control rounded-top-bottom">
                    <option  value="Directeur de thèse">Directeur de thèse</option>
                    <option value="Directeur de laboratoire">Directeur de laboratoire</option>
                    <option value="Responsable de doctorat">Responsable de doctorat</option>
                    <option value="Directeur école doctorale">Directeur école doctorale</option>
                    <option value="Chef établissement de ratachement">Chef établissement de ratachement</option>

                  </select>
                </div>
              </div>


                <div class="d-flex flex-row align-items-center mb-4">
                  <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                  <div class="form-outline flex-fill mb-0">
                    <input type="password" id="form3Example1c" name="password" class="form-control rounded-top-bottom"
                      style="text-align: center" placeholder="mot de passe" value="" required />
                  </div>

                </div>
                <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4 ml-3">
                  <input type="submit" id="sub" onclick="actionChange()" value="se connecter" class="btn btn-lg  text-white btn-outline-primary" id="btn"
                    style="background: rgb(36, 127, 194)" />
                </div>
                <a href="" id="oublie">mot de passe oublié?</a>
            </center>
          </form>
        </section>
      </div>
    </div>
  </div>
  <script>
    $("#sub").click(function(){
      if($("#selection").val()=="Directeur de thèse"){
        $("form").attr("action","/loginManagerThesisForm");
      }
      if($("#selection").val()=="Directeur de laboratoire"){
        $("form").attr("action","/loginManagerLaboratory");
      }
      if($("#selection").val()=="Responsable de doctorat"){
        $("form").attr("action","/loginManagerPhdForm");

      }
      if($("#selection").val()=="Directeur école doctorale"){
        $("form").attr("action","/loginDirectorEdmiForm");

      }
      if($("#selection").val()=="Chef établissement de ratachement"){
        $("form").attr("action","/loginHeadInstitutionForm");

      }

      

    })
    /*function actionChange(){
      
    if(document.getElementById("selection").value=="Directeur de thèse"){
        document.getElementByTagName("form").action="/abc";

    }
   if(document.getElementById("selection").value=="Directeur de laboratoire"){
      document.myform.action="/a";

    }
    if(document.getElementById("selection").value=="Responsable du doctorat"){
      document.getElementByTagName("form").action="/b";

    }
    if(document.getElementById("selection").value=="Directeur école doctorale"){
      document.getElementByTagName("form").action="/c";

    }
    if(document.getElementById("selection").value=="Chef établissement de ratachement"){
      document.getElementByTagName("form").action="/d";

    }
  }*/
    function advertisered() {
      swal("ERREUR!", "informations incorrectes", "error");


    }
    function advertisered() {
      swal("ERREUR!", "informations incorrectes", "warning");

    }
    advertisered();



  </script>
</body>

</html>
