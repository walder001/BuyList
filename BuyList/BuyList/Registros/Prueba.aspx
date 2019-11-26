<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prueba.aspx.cs" Inherits="BuyList.Registros.Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.11/css/mdb.min.css" rel="stylesheet">
 
    <title></title>
    <style>
        .container-fluid{
            height:250px;
        }
        .sticky-top-2 {
        position: -webkit-sticky;
        position: sticky;
        top: 56px;
        z-index: 1020;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid bg-success">
            </div>
            <!-- As a link -->
            <nav class="navbar navbar-light bg-primary  sticky-top">
                <a class="navbar-brand" href="#">Navbar</a>
            </nav>
            <div class="container-fluid bg-light">
            </div>

            <!-- As a heading -->
            <nav class="navbar navbar-light bg-danger sticky-top-2">
                <span class="navbar-brand mb-0 h1">Navbar</span>
            </nav>
            <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>

            <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>

                        <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>

            <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>            <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>

            <div class="container-fluid bg-success">
            </div>
            <div class="container-fluid bg-danger">
            </div>
        </div>

        <!-- Grid row -->
<div class="row">

  <!-- Grid column -->
  <div class="col-md-12 mb-4">

    <a type="button" class="btn-floating deep-purple"><i class="fab fa-youtube" aria-hidden="true"></i></a>
    <a type="button" class="btn-floating indigo"><i class="fab fa-google-wallet" aria-hidden="true"></i></a>
    <a type="button" class="btn-floating light-blue"><i class="fab fa-envira" aria-hidden="true"></i></a>Basic example
    <a type="button" class="btn-floating cyan"><i class="fab fa-apple" aria-hidden="true"></i></a>
    <a type="button" class="btn-floating teal"><i class="fas fa-arrows-alt" aria-hidden="true"></i></a>
    <a type="button" class="btn-floating light-green"><i class="far fa-hand-point-right" aria-hidden="true"></i></a>

  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="col-md-12 mb-4">

    <button type="button" class="btn btn-rounded btn-amber"><i class="fas fa-th-list pr-2" aria-hidden="true"></i>List</button>
    <button type="button" class="btn btn-rounded btn-brown"><i class="fas fa-redo pr-2" aria-hidden="true"></i>Rotate</button>
    <button type="button" class="btn btn-rounded btn-blue-grey"><i class="far fa-save pr-2" aria-hidden="true"></i>Floppy</button>
    <button type="button" class="btn btn-rounded btn-primary"><i class="fab fa-bitcoin pr-2" aria-hidden="true"></i>Bitcoin</button>

  </div>
  <!-- Grid column -->

  <!-- Grid column -->
  <div class="col-md-12">

    <button type="button" class="btn btn-outline-success btn-rounded waves-effect"><i class="fas fa-cogs pr-2"
        aria-hidden="true"></i>Success</button>
    <button type="button" class="btn btn-outline-info btn-rounded waves-effect"><i class="fas fa-wheelchair pr-2"
        aria-hidden="true"></i>Info</button>
    <button type="button" class="btn btn-outline-warning btn-rounded waves-effect"><i class="fas fa-car pr-2"
        aria-hidden="true"></i>Warning</button>
    <button type="button" class="btn btn-outline-danger btn-rounded waves-effect"><i class="fas fa-train pr-2"
        aria-hidden="true"></i>Danger</button>

      <asp:LinkButton ID="SubmitBtn" runat="server" CssClass="btn btn-small btn-primary"><i class="fas fa-train pr-2"
        aria-hidden="true"></i>&nbsp;Submit</asp:LinkButton>
  </div>
  <!-- Grid column -->

</div>
<!-- Grid row -->


        <!-- Material form login -->
<div class="card">

  <h5 class="card-header info-color white-text text-center py-4">
    <strong>Sign in</strong>
  </h5>

  <!--Card content-->
  <div class="card-body px-lg-5 pt-0">

    <!-- Form -->
    <form class="text-center" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="email" id="materialLoginFormEmail" class="form-control">
        <label for="materialLoginFormEmail">E-mail</label>
      </div>

      <!-- Password -->
      <div class="md-form">
        <input type="password" id="materialLoginFormPassword" class="form-control">
        <label for="materialLoginFormPassword">Password</label>
      </div>

      <div class="d-flex justify-content-around">
        <div>
          <!-- Remember me -->
          <div class="form-check">
            <input type="checkbox" class="form-check-input" id="materialLoginFormRemember">
            <label class="form-check-label" for="materialLoginFormRemember">Remember me</label>
          </div>
        </div>
        <div>
          <!-- Forgot password -->
          <a href="">Forgot password?</a>
        </div>
      </div>

      <!-- Sign in button -->
      <button class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" type="submit">Sign in</button>

      <!-- Register -->
      <p>Not a member?
        <a href="">Register</a>
      </p>

      <!-- Social login -->
      <p>or sign in with:</p>
      <a type="button" class="btn-floating btn-fb btn-sm">
        <i class="fab fa-facebook-f"></i>
      </a>
      <a type="button" class="btn-floating btn-tw btn-sm">
        <i class="fab fa-twitter"></i>
      </a>
      <a type="button" class="btn-floating btn-li btn-sm">
        <i class="fab fa-linkedin-in"></i>
      </a>
      <a type="button" class="btn-floating btn-git btn-sm">
        <i class="fab fa-github"></i>
      </a>

    </form>
    <!-- Form -->

  </div>

</div>
<!-- Material form login -->


    </form>

     <br />
    <br />
    <br />

    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="container">
                    <ul class="nav justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Cantidad</a>
                            <asp:Label Text="0" runat="server" CssClass="offset-5" />
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">SubTotal</a>
                            <asp:Label Text="0" runat="server" CssClass="offset-5" />

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Itebis</a>
                            <asp:Label Text="0" runat="server" CssClass="offset-5" />

                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Total</a>
                            <asp:Label Text="0" runat="server" CssClass="offset-5" />

                        </li>
                    </ul>

                </div>
                <div class="container">
                    <hr />
                    <p class="text-center">Hogar</p>
                    <hr />
                    <div class="row">
                        <div class="card-group">
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <asp:Label ID="TextBox" Text="Precio: 100" CssClass="offset-1" runat="server" />
                                    <asp:CheckBox Text="Agregar" CssClass="offset-5" runat="server" />
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <asp:Label ID="Label1" Text="Precio: 100" CssClass="offset-1" runat="server" />
                                    <asp:CheckBox Text="Agregar" CssClass="offset-5" runat="server" />
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <asp:Label ID="Label2" Text="Precio: 100" CssClass="offset-1" runat="server" />
                                    <asp:CheckBox Text="Agregar" CssClass="offset-5" runat="server" />
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                        </div>

                    </div>
                    <hr />
                    <p class="text-center">Comida</p>
                    <hr />
                    <div class="row">
                        <div class="card-group">
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <p class="card-text">Precio: 100</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <p class="card-text">Precio: 100</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                                <div class="card-body">
                                    <h5 class="card-title">Carro</h5>
                                    <p class="card-text">Precio: 100</p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Last updated 3 mins ago</small>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>

    </div>

    <!-- Footer -->

    <!-- JQuery -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.11/js/mdb.min.js"></script>

</body>
</html>
