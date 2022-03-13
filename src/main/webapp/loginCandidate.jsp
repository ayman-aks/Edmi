<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <link rel="stylesheet" href="bootstrap.css" />
    <style>
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

      a {
        text-decoration: none;
      }
      .logo {
        width: 15em;
        height: 12em;
      }
    </style>
    <title>Connexion</title>
  </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col roww text-white">
          <img
            src="./img/animation_500_l0mnmeh0.gif"
            class="container img mb-2 w-50 h-30"
            alt=""
          />

          <center>
            <div class="container-fluid center-margin">
              <h2 class="text-white">C'est votre première fois ici ?</h2>
              <p class="text-white">Cliquez sur le bouton pour s'inscrire</p>
              <button
                class="btn btn-outline-primary border-white text-white rounded-top-bottom"
              >
                <a href="newinscription.html" Class="text-white">S'INSCRIRE</a>
              </button>
            </div>
          </center>
        </div>
        <div class="col">
          <center>
            <h1 class="container">
              École Doctorale de Mathematiques et d'Informatique
            </h1>
            <br />
            <div class="container logo">
              <img
                src="./img/senegal-ucad.PNG"
                class="container"
                alt=""
                srcset=""
              />
            </div>
          </center>
          <%
            try{
              String check= session.getAttribute("errorStatus").toString();
              if(check.equals("Compte non retrouvé"))  {
          %>
          <div class="container err1 bg-danger text-white" style="text-align: center;">informations incorrectes!!</div><br>
          <%
          } else {
          %>
          <div class="container err1 bg-warning text-white" style="text-align: center;">Compte non autorisé!!</div><br>
          <%
              }
            session.removeAttribute("errorStatus");
            }catch (NullPointerException e) {
              System.err.println("Caught IOException: " + e.getMessage());}
          %>


          <section class="h-50" style="background-color: white; ">
            <form
              method="POST"
              action="loginCandidateForm"
              class="form mx-1 mx-md-4"
            >
              <center>
                <h2>Page de connexion</h2>
                <br /><br />
                <div class="tab">
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0 input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text" aria-label="arobase"
                          >@</span
                        >
                      </div>
                      <input
                        type="email"
                        id="form3Example1c"
                        class="form-control rounded-top-bottom"
                        name="email"
                        style="text-align: center"
                        placeholder="user@email"
                        value=""
                        required
                      />
                    </div>
                  </div>
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input
                        type="password"
                        id="form3Example1c"
                        name="password"
                        class="form-control rounded-top-bottom"
                        style="text-align: center"
                        placeholder="mot de passe"
                        value=""
                        required
                      />
                    </div>
                  </div>
                  <div
                    class="d-flex justify-content-center mx-4 mb-3 mb-lg-4 ml-3"
                  >
                    <input
                      type="submit"
                      value="se connecter"
                      class="btn btn-lg text-white btn-outline-primary"
                      style="background: rgb(36, 127, 194)"
                    />
                  </div>
                </div>
                <a href="">mot de passe oublié?</a>
              </center>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
