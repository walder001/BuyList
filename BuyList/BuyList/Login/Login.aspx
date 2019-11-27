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
        </div>
    </form>
</body>
</html>
