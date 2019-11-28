<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuario.aspx.cs" Inherits="BuyList.Login.Usuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
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

         <div class="container">
        <ul class="nav justify-content-center bg-success">
            <li>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
                <h5 class="text-light">Registro Usuario</h5>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
            </li>
        </ul>
        <br />
        <div class="form-row">
            <div class="col col-4 offset-8">
                <label for="Fecha"><strong>Fecha</strong></label>
                <asp:TextBox ID="FechaTextBox" CssClass="form-control" TextMode="Date" runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" MaxLength="200"
                    ControlToValidate="FechaTextBox"
                    ErrorMessage="Campo Fecha obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Fecha obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Fecha
                </asp:RequiredFieldValidator>
           </div>
        </div>
        
        <div class="form-row">
            <div class="col">
                <label for="UsiarioId"><strong>Codigo</strong></label>
                <div class="form-row">
                <asp:TextBox ID="UsuarioIdIdTextBox" runat="server" Text="0" TextMode="Search" CssClass="form-control col col-9" onKeyPress="return soloNumeros(event)" />
                <asp:LinkButton ID="Buscar" runat="server" CssClass="col col-2 offset-1 " OnClick="Buscar_Click"><i class="fas fa-search fa-2x"></i></asp:LinkButton>
                </div>
    
             </div>
        </div>

         <div class="form-row">
            <div class="col">
                <label for="Nombre"><strong>Nombre</strong></label>
                <asp:TextBox ID="NombreTextBox" CssClass="form-control" placeholder="Nombre" runat="server" onKeyPress="return soloLetras(event)" />
                <asp:RequiredFieldValidator ID="DescripcionID" runat="server" MaxLength="200"
                    ControlToValidate="NombreTextBox"
                    ErrorMessage="Campo Nombre obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Nombre obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Nombre
                </asp:RequiredFieldValidator>
           </div>
        </div>

       <div class="form-row">
            <div class="col">
                <label for="Email"><strong>Email</strong></label>
                <asp:TextBox ID="EmailTextBox" CssClass="form-control" placeholder="Nombre" runat="server" TextMode="Email"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" MaxLength="200"
                    ControlToValidate="EmailTextBox"
                    ErrorMessage="Campo Email obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Email obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Email
                </asp:RequiredFieldValidator>
           </div>
        </div>
        <div class="form-row">
            <div class="col">
                <label for="Nivel"><strong>Nivel Usuario</strong></label>
                <asp:DropDownList ID="NivelUsiario" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Administrado" />
                    <asp:ListItem Text="Almacen" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" MaxLength="200"
                    ControlToValidate="NivelUsiario"
                    ErrorMessage="Campo NivelUsiario obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo NivelUsiario obligatorio" ValidationGroup="Guardar">Por favor llenar el campo NivelUsiario
                </asp:RequiredFieldValidator>
           </div>
        </div>
        
         <div class="form-row">
            <div class="col">
                <label for="Usuario"><strong>Usuario</strong></label>
                <asp:TextBox ID="UsuarioTextBox" CssClass="form-control" placeholder="Usuario" runat="server" onKeyPress="return soloLetras(event)" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" MaxLength="200"
                    ControlToValidate="UsuarioTextBox"
                    ErrorMessage="Campo Usuario obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Usuario obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Usuario
                </asp:RequiredFieldValidator>
           </div>
        </div>



        <div class="form-row">
            <div class="col">
                <label for="Clave"><strong>Clave</strong></label>
                <asp:TextBox ID="ClaveTextBox" CssClass="form-control" runat="server"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" MaxLength="200"
                    ControlToValidate="ClaveTextBox"
                    ErrorMessage="Campo Clave obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Clave obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Clave
                </asp:RequiredFieldValidator>
           </div>
        </div>

        <div class="form-row">
            <div class="col">
                <label for="ConfirmarClave"><strong>Confirmar</strong></label>
                <asp:TextBox ID="ConfirmarClaveTextBox" CssClass="form-control" runat="server" OnClick="comprobarClave()"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" MaxLength="200"
                    ControlToValidate="ClaveTextBox"
                    ErrorMessage="Campo Clave obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo ConfirmarClave obligatorio" ValidationGroup="Guardar">Por favor llenar el campo ConfirmarClave
                </asp:RequiredFieldValidator>
           </div>
        </div>

          <hr />
        <div class="col offset-3">
            <asp:LinkButton ID="Limpiara" runat="server" CssClass=" btn btn-primary col-sm-2" OnClick="Limpiar_Click"><i class="fas fa-broom"></i>  Limpiar</asp:LinkButton>
            <asp:LinkButton ID="Guarda" runat="server" CssClass=" btn btn-success col-sm-2" OnClick="Guardar_Click" ValidationGroup="Guardar"><i class="fas fa-save"></i>  Guardar</asp:LinkButton>
            <asp:LinkButton ID="Elimina" runat="server" CssClass="btn btn-danger col-sm-2 " OnClick="Eliminar_Click"><i class="fas fa-trash-alt"></i>  Eliminar</asp:LinkButton>
        </div>       
    </div>

        
    </form>
</body>
</html>

