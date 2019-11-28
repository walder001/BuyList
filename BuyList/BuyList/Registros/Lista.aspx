<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Lista.aspx.cs" Inherits="BuyList.Registros.Lista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <ul class="nav justify-content-center bg-success">
            <li>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
                <h5 class="text-light">Crea Tu Lista</h5>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true"></a>
            </li>
        </ul>
        <br />
        <div class="form-row">
            <div class="col">
                <label for="ListaId"><strong>Codigo</strong></label>
                <div class="form-row">
                <asp:TextBox ID="ListaIdTextBox" runat="server" Text="0" TextMode="Search" CssClass="form-control col col-9" onKeyPress="return soloNumeros(event)" />
                <asp:LinkButton ID="Buscar" runat="server" CssClass="col col-2 offset-1 " OnClick="Buscar_Click"><i class="fas fa-search fa-2x"></i></asp:LinkButton>
                </div>
    
             </div>
        </div>
<%--        <div class="form-row">
            <div class="col-2 col-lg-1 offset-2">
                <label for="ProductoId"><strong>Codigo</strong></label>
            </div>
            <div class="col-6 col-lg-5">
                <asp:TextBox ID="ListaIdTextBox" runat="server" Text="0" type="number" CssClass="col-sm-12 col-md-12 form-control" onKeyPress="return soloNumeros(event)" />
            </div>
            <div class="col-2 col-lg-3">
                <asp:LinkButton ID="Buscar" runat="server" CssClass="col-md-4 offset-0 " OnClick="Buscar_Click"><i class="fas fa-search fa-2x"></i></asp:LinkButton>
            </div>
        </div>--%>

        <div class="form-row">
           <div class="col">
             <label for="Cliente"><strong>Cliente</strong></label>
            <asp:DropDownList ID="ClienteDropList" runat="server" CssClass="form-control">
            </asp:DropDownList>
           </div>
        </div>

         <div class="form-row">
            <div class="col">
                <label for="NombreLista"><strong>NombreLista</strong></label>
                <asp:TextBox ID="NombreListaTextBox" CssClass="form-control" runat="server" />
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" MaxLength="200"
                    ControlToValidate="NombreListaTextBox"
                    ErrorMessage="Campo Descripcion obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Nombre Lista obligatorio" ValidationGroup="Agregar">Por favor llenar el campo Nombre lista
                </asp:RequiredFieldValidator>
           </div>
        </div>
        
        <div class="form-row">
            <div class="col">
             <label for="Categoria"><strong>Categoria</strong></label>
            <asp:DropDownList ID="CategoriaDropDownList" runat="server" CssClass="form-control">
            </asp:DropDownList>
            </div>

            <div class="col">
             <label for="Productos"><strong>Productos</strong></label>
            <asp:DropDownList ID="ProductoDropDownList" runat="server" CssClass="form-control">
            </asp:DropDownList>

            </div>
            <div class="col-1">
                <br />      
               <asp:LinkButton runat="server" CssClass="col-3" OnClick="Actualizar_Click" ><i class="fas fa-undo-alt fa-2x"></i></asp:LinkButton>    

            </div>
        </div>

         <div class="form-row">   
            <div class="col">
               <label for="Cantidad"><strong>Cantidad</strong></label>
                <asp:TextBox ID="CantidadTextBox" CssClass="form-control" placeholder="Cantidad" runat="server" TextMode="Number" AutoPostBack="true" OnTextChanged="CantidadTextBox_TextChanged" onKeyPress="return soloNumeros(event)"/>
                 <asp:RequiredFieldValidator ID="ValidarCantidad" runat="server" MaxLength="200"
                    ControlToValidate="CantidadTextBox"
                    ErrorMessage="Campo Descripcion obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Cantidad obligatorio" ValidationGroup="Agregar">Por favor llenar el campo Cantidad
                </asp:RequiredFieldValidator>
            </div>

            <div class="col">
               <label for="Precio"><strong>Precio</strong></label>
                <asp:TextBox ID="PrecioTextBox" CssClass="form-control" placeholder="Precio" runat="server"  ReadOnly="true"/>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" MaxLength="200"
                    ControlToValidate="PrecioTextBox"
                    ErrorMessage="Campo Precio obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Precio obligatorio" ValidationGroup="Agregar">Por favor llenar el campo Precio
                </asp:RequiredFieldValidator>
            </div>
             
            <div class="col">
               <label for="Itebis"><strong>Itebis</strong></label>
                <asp:TextBox ID="ItebisTextBox" CssClass="form-control" placeholder="Itebis" runat="server" TextMode="Number" ReadOnly="true" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" MaxLength="200"
                    ControlToValidate="ItebisTextBox"
                    ErrorMessage="Campo Itebis obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Itebis obligatorio" ValidationGroup="Agregar">Por favor llenar el campo Itebis
                </asp:RequiredFieldValidator>
            </div>
            <div class="col">
               <label for="Importe"><strong>Importe</strong></label>
                <asp:TextBox ID="ImporteTextBox" CssClass="form-control" placeholder="Importe" runat="server" ReadOnly="true" AutoPostBack="true"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" MaxLength="200"
                    ControlToValidate="ImporteTextBox"
                    ErrorMessage="Campo Itebis obligatorio" ForeColor="black"
                    Display="Dynamic" SetFocusOnError="True"
                    ToolTip="Campo Importe obligatorio" ValidationGroup="Agregar">Por favor llenar el campo Importe
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-1">
                  <div class="col-1">
                    <br />

                      <asp:LinkButton Text="Agregar" runat="server"  OnClick="Agregar_Click" ValidationGroup="Agregar" ><i class="fas fa-plus-circle fa-3x"></i></asp:LinkButton>    
                </div>
            </div>

         </div>  

        </div>

    <div class="container">
             <hr />
            <p class="text-center">Lista productos</p>
             <hr />

         <div class="row offset-2">
             <div class="col-9">
                 <asp:GridView ID="VentaGridView" class="col" runat="server" DataKeyNames="DetalleListaId" AllowPaging="true" PageSize="10" ShowHeaderWhenEmpty="false" AutoGenerateDeleteButton="true" CellPadding="4" ForeColor="#333333" GridLines="None" Width="767px" AutoGenerateColumns="false" OnRowDeleting="Grid_RowDeleting" OnPageIndexChanging="Lista_PageIndexChanging">
                     <AlternatingRowStyle BackColor="White" />

                     <EditRowStyle BackColor="#2461BF" />
                     <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#EFF3FB" />
                     <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#F5F7FB" />
                     <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                     <SortedDescendingCellStyle BackColor="#E9EBEF" />
                     <SortedDescendingHeaderStyle BackColor="#4870BE" />

                    <Columns>
                        <asp:BoundField DataField="Producto" HeaderText="Producto" /><asp:BoundField />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" /><asp:BoundField />
                         <asp:BoundField DataField="Precio" HeaderText="Precio" /><asp:BoundField />                     
                        <asp:BoundField DataField="Importe" HeaderText="Importe" /><asp:BoundField />

                    </Columns> 
                 </asp:GridView>
                 <hr />
             </div>
             <hr />

             <div class="row">
                 <div class="form-row">
                     <div class="col-12 col-lg-11">
                         <label for="CantidadTotal"><strong>Cantidad Total</strong></label>
                         <asp:TextBox ID="CantidadTotalTextBox" CssClass="form-control" runat="server" ReadOnly="True" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" MaxLength="200"
                             ControlToValidate="CantidadTotalTextBox"
                             ErrorMessage="Campo CantidadTotal obligatorio" ForeColor="black"
                             Display="Dynamic" SetFocusOnError="True"
                             ToolTip="Campo CantidadTotal obligatorio" ValidationGroup="Guardar">Por favor llenar el campo CantidadTotal
                         </asp:RequiredFieldValidator>
                     </div>
                 </div>

                 <div class="form-row">
                     <div class="col-12 col-lg-11">
                         <label for="SubTotal"><strong>SubTotal</strong></label>
                         <asp:TextBox ID="SubTotalTextBox" CssClass="form-control" runat="server" ReadOnly="True" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" MaxLength="200"
                             ControlToValidate="SubTotalTextBox"
                             ErrorMessage="Campo SubTotal obligatorio" ForeColor="black"
                             Display="Dynamic" SetFocusOnError="True"
                             ToolTip="Campo SubTotal obligatorio" ValidationGroup="Guardar">Por favor llenar el campo SubTotal
                         </asp:RequiredFieldValidator>
                     </div>
                 </div>

                 <div class="form-row">
                     <div class="col-12 col-lg-11">
                         <label for="Itebis"><strong>Itebis</strong></label>
                         <asp:TextBox ID="ItebisTotalTextBox" CssClass="form-control" runat="server" ReadOnly="True" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" MaxLength="200"
                             ControlToValidate="ItebisTotalTextBox"
                             ErrorMessage="Campo ItebisTotal obligatorio" ForeColor="black"
                             Display="Dynamic" SetFocusOnError="True"
                             ToolTip="Campo ItebisTotal obligatorio" ValidationGroup="Guardar">Por favor llenar el campo ItebisTotal
                         </asp:RequiredFieldValidator>
                     </div>
                 </div>
                 <div class="form-row">
                     <div class="col-12 col-lg-11">
                         <label for="Total"><strong>Total</strong></label>
                         <asp:TextBox ID="TotalTextBox" CssClass="form-control col" runat="server" ReadOnly="True" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" MaxLength="200"
                             ControlToValidate="TotalTextBox"
                             ErrorMessage="Campo CantidadTotal obligatorio" ForeColor="black"
                             Display="Dynamic" SetFocusOnError="True"
                             ToolTip="Campo Total obligatorio" ValidationGroup="Guardar">Por favor llenar el campo Total
                         </asp:RequiredFieldValidator>
                     </div>
                 </div>
             </div>
         </div>

          <hr />
        <div class="col offset-3">
            <asp:LinkButton ID="Limpiara" runat="server" CssClass=" btn btn-primary col-6 col-sm-2" OnClick="Limpiar_Click"><i class="fas fa-broom"></i>  Limpiar</asp:LinkButton>
            <asp:LinkButton ID="Guarda" runat="server" CssClass=" btn btn-success col-6 col-sm-2" OnClick="Guardar_Click"  ValidationGroup="Guardar"><i class="fas fa-save"></i>  Guardar</asp:LinkButton>
            <asp:LinkButton ID="Elimina" runat="server" CssClass="btn btn-danger col-6 col-sm-2 " OnClick="Eliminar_Click"><i class="fas fa-trash-alt"></i>  Eliminar</asp:LinkButton>
        </div>
    </div>
</asp:Content>
