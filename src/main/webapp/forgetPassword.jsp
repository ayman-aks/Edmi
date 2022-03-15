<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
              <h2 class="text-white">Vous avez déjà un compte ?</h2>
              <p class="text-white">Cliquez sur le bouton pour se connecter</p>
              <button
                class="btn btn-outline-primary border-white text-white rounded-top-bottom"
              >
                <a href="loginCandidate" Class="text-white">SE CONNECTER</a>
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
          <section class="h-50" style="background-color: white">
            <form
              method="POST"
              action="forgetPasswordConfirm"
              class="form mx-1 mx-md-4"
            >
              <center>
                <h2>mot de passe oublié</h2>
                <br /><br />
                <div class="tab">
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0 input-group mb-3">
                      <input
                        type="password"
                        id="form3Example1c"
                        class="form-control rounded-top-bottom"
                        name="password"
                        style="text-align: center"
                        placeholder="mot de passe"
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
                        name="passwordConfirm"
                        class="form-control rounded-top-bottom"
                        style="text-align: center"
                        placeholder="Confirmer mot de passe"
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
                      value="valider"
                      class="btn btn-lg text-white btn-outline-primary"
                      style="background: rgb(36, 127, 194)"
                    />
                  </div>
                </div>
              </center>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>
