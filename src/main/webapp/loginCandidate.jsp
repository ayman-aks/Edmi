<%@page pageEncoding="UTF-8" language="java" contentType="text/html" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="bootstrap.css">
        <title>Se connecter</title>
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
                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-3 mt-4">ÉCOLE DOCTORALE DE
                                            MATHÉMATIQUE ET D'INFORMATIQUE</p>

                                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Se Connecter</p>

                                        <form class="mx-1 mx-md-4" action="loginCandidateForm" method="POST"
                                            enctype="multipart/form-data">






                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example3c">EMAIL:</label>

                                                    <input type="email" id="form3Example3c" name="email"
                                                        class="form-control" style="text-align:center"
                                                        placeholder="user@mail.com" value="" required />
                                                </div>
                                            </div>


                                            <div class="d-flex flex-row align-items-center mb-4">
                                                <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
                                                <div class="form-outline flex-fill mb-0">
                                                    <label class="form-label" for="form3Example3c">MOT DE PASSE:</label>

                                                    <input type="password" id="form3Example3c" name="password"
                                                        class="form-control" style="text-align:center"
                                                        placeholder="mot de passe" value="" required />
                                                </div>
                                            </div>


                                            <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                                                <input type="submit" value="Se connecter"
                                                    class="btn btn-primary btn-lg">
                                            </div>
                                            


                                        </form>
                                        <div class="inscription-link">Je n'ai pas de compte,<a
                                                href="signUp.jsp">je
                                                m'inscris</a></div>

                                    </div>
                                    <div
                                        class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

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