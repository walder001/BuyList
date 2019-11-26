<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rUsuarioWF.aspx.cs" Inherits="BuyList.Registros.rUsuarioWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            <div class="col">
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
            <div class="col-2 col-lg-1 offset-2">
                <label for="UsiarioId"><strong>Codigo</strong></label>
            </div>
            <div class="col-6 col-lg-5">
                <asp:TextBox ID="UsuarioIdIdTextBox" runat="server" Text="0" TextMode="Search" CssClass="col-sm-12 col-md-12 form-control" onKeyPress="return soloNumeros(event)" />
            </div>
            <div class="col-2 col-lg-3">
                <asp:LinkButton ID="Buscar" runat="server" CssClass="col-md-4 offset-0 " OnClick="Buscar_Click"><i class="fas fa-search fa-2x"></i></asp:LinkButton>
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
                <asp:TextBox ID="ClaveTextBox" CssClass="form-control" placeholder="Usuario" TextMode="Password" runat="server"/>
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
                <asp:TextBox ID="ConfirmarClaveTextBox" CssClass="form-control" placeholder="Usuario" TextMode="Password" runat="server" OnClick="comprobarClave()"/>
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

</asp:Content>
