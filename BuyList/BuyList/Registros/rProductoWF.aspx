<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="rProductoWF.aspx.cs" Inherits="BuyList.Registros.rProductoWF" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <ul class="nav justify-content-center bg-success">
            <li>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
                <h5 class="text-light">Registro Productos</h5>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
            </li>
        </ul>
        <br />
            <div class="form-row">
            <div class="col-2 col-lg-1 offset-2">
                <label for="ProductoId"><strong>Codigo</strong></label>
            </div>
            <div class="col-6 col-lg-5">
                <asp:TextBox ID="ProductoIdTextBox" runat="server" Text="0" TextMode="Search" CssClass="col-sm-12 col-md-12 form-control" onKeyPress="return soloNumeros(event)" />
            </div>
            <div class="col-2 col-lg-3">
                <asp:LinkButton ID="Buscar" runat="server" CssClass="col-md-4 offset-0 " OnClick="Buscar_Click"><i class="fas fa-search fa-2x"></i></asp:LinkButton>
            </div>

        </div>

        <div class="form-row">
            <div class="col">
             <label for="Categoria"><strong>Categoria</strong></label>
            <asp:DropDownList ID="CategoriaDropDownList" runat="server" CssClass="form-control">
            </asp:DropDownList>
            </div>

        </div>

         <div class="form-row">
            <div class="col">
                <label for="Descripcion"><strong>Descripcion</strong></label>
                <asp:TextBox ID="DescripcionTextBox" CssClass="form-control" placeholder="Descripcion" runat="server" onKetPress="return soloLetras(event)" />
                <asp:RequiredFieldValidator ID="ValidadarDescripcion" runat="server" MaxLength="200"
                    ControlToValidate="DescripcionTextBox"
                    ErrorMessage="Campo Descripcion obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Descripcion obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Descripcion
                </asp:RequiredFieldValidator>
           </div>
        </div>

         <div class="form-row">   
            <div class="col">
               <label for="Cantidad"><strong>Cantidad</strong></label>
                <asp:TextBox ID="CantidadTextBox" CssClass="form-control validar" placeholder="Cantidad" runat="server" TextMode="Number" AutoPostBack="true" OnTextChanged="CantidadTextBox_TextChanged"  onKeyPress="return soloNumeros(event)"/>
                 <asp:RequiredFieldValidator ID="ValidarCantidad" runat="server" MaxLength="200"
                    ControlToValidate="CantidadTextBox"
                    ErrorMessage="Campo Descripcion obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Cantidad obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Cantidad
                </asp:RequiredFieldValidator>

            </div>
         </div>  
  

       <div class="form-row">   
            <div class="col">
               <label for="Costo"><strong>Costo</strong></label>
                <asp:TextBox ID="CostoTextBox" CssClass="form-control" placeholder="Costo" runat="server" OnTextChanged="CostoTextBox_TextChanged" AutoPostBack="true" onKeyPress="return NumCheck(event, this)" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" MaxLength="200"
                    ControlToValidate="CostoTextBox"
                    ErrorMessage="Campo Costo obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Costo obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Costo
                </asp:RequiredFieldValidator>                
            </div>
         </div>

          <div class="form-row">   
            <div class="col">
               <label for="Precio"><strong>Precio</strong></label>
                <asp:TextBox ID="PrecioTextBox" CssClass="form-control" placeholder="Precio" runat="server" AutoPostBack="true"  OnTextChanged="PrecioTextBox_TextChanged" onKeyPress="return NumCheck(event, this)" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" MaxLength="200"
                    ControlToValidate="PrecioTextBox"
                    ErrorMessage="Campo Precio obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Precio obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Precio
                </asp:RequiredFieldValidator>   
            </div>
         </div>     
        
        <div class="form-row">   
            <div class="col">
               <label for="Ganancia"><strong>Ganancia</strong></label>
                <asp:TextBox ID="GananciaTextBox" CssClass="form-control" placeholder="Ganancia" runat="server" ReadOnly="true" onKeyPress="return NumCheck(event, this)"  />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" MaxLength="200"
                    ControlToValidate="GananciaTextBox"
                    ErrorMessage="Campo Ganancia obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Ganancia obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Ganancia
                </asp:RequiredFieldValidator> 
            </div>
         </div> 
          <hr />
        <div class="col offset-3">
            <asp:LinkButton ID="Limpiara" runat="server" CssClass=" btn btn-primary col-6 col-sm-2" OnClick="Limpiar_Click"><i class="fas fa-broom"></i>  Limpiar</asp:LinkButton>
            <asp:LinkButton ID="Guarda" runat="server" CssClass=" btn btn-success col-6 col-sm-2" OnClick="Guardar_Click" ValidationGroup="Guardar"><i class="fas fa-save"></i>  Guardar</asp:LinkButton>
            <asp:LinkButton ID="Elimina" runat="server" CssClass="btn btn-danger col-6 col-sm-2 " OnClick="Eliminar_Click"><i class="fas fa-trash-alt"></i>  Eliminar</asp:LinkButton>
        </div>
       
    </div>
</asp:Content>
