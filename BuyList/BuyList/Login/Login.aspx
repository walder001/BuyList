<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BuyList.Login.Logi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
    <!-- Bootstrap core CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.11/css/mdb.min.css" rel="stylesheet">

      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <%--Librerias para el toast--%>
    <link href="./Media/css/Grey/ListBox.Grey.css" rel="stylesheet" type="text/css" />
    <link href="./Media/css/WebTrack.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.css"
        rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"
        type="text/javascript"></script>


    <%--Programacion en Javascript para que funcione el toast--%>
    <script type="text/javascript">
        function Notify(msg, title, type, clear, pos, sticky) {
            if (clear == true) {
                toastr.clear();
            }
            if (sticky == true) {
                toastr.tapToDismiss = true;
                toastr.timeOut = 10000;
            }

            //"toast-top-left"; 
            toastr.options.positionClass = pos;
            if (type.toLowerCase() == 'info') {
                toastr.options.timeOut = 1000;
                toastr.tapToDismiss = true;
                toastr.info(msg, title);
            }
            if (type.toLowerCase() == 'success') {
                toastr.options.timeOut = 1500;
                toastr.success(msg, title);
            }
            if (type.toLowerCase() == 'warning') {
                toastr.options.timeOut = 3000;
                toastr.warning(msg, title);
            }
            if (type.toLowerCase() == 'error') {
                toastr.options.timeOut = 10000;
                toastr.error(msg, title);
            }
        }

        function isLetterKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return true;

            return false;
        }
    </script>

    <script type="text/javascript">
        function openModal() {
            $('#ModalEliminar').modal('show');
        }
    </script>

    <style>
        .navbar-inverse {
            background-color: #0094ff
        }

            .navbar-inverse .navbar-nav > .active > a:hover, .navbar-inverse .navbar-nav > li > a:hover, .navbar-inverse .navbar-nav > li > a:focus {
                background-color: #000000
            }

        .dropdown-menu {
            background-color: #00ff90
        }

            .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
                background-color: #00ff90
            }

        .navbar-inverse {
            border-color: #FFFFFF
        }

            .navbar-inverse .navbar-brand {
                color: #000000
            }

                .navbar-inverse .navbar-brand:hover {
                    color: #000000
                }

            .navbar-inverse .navbar-nav > li > a {
                color: #000000
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <br />
        <br />
        <div class="card col-5 container">
          <div class="form-group">
             <label for="usuario">Usuario</label>
              <asp:TextBox ID="UsuarioTextBox" Text="Usuario" CssClass="form-control" runat="server" />
          </div>
           <div class="form-group">
             <label for="clave">Clave</label>
              <asp:TextBox ID="ClaveTextBox" Text="Clave" CssClass="form-control" type="password" runat="server" />
          </div>

            <asp:Button ID="Logear" Text="Logear" runat="server" class="btn btn-primary" OnClick="Logear_Click" />
            <a href="/Login/Usuario.aspx" class="align-content-center">Registrarse</a>
        </div>
    </form>
</body>
</html>
