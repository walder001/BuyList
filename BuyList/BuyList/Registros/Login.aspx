<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BuyList.Registros.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="row">
        <div class="col-sm-6 offset-3">
            <div class="card">
                <div class="card-body">
                    <!-- Default form login -->
                <div class="text-center border border-light p-5">

                  <p class="h4 mb-4">Sign in</p>

                  <!-- Email -->
                  <input type="email" id="defaultLoginFormEmail" class="form-control mb-4" placeholder="E-mail">

                  <!-- Password -->
                  <input type="password" id="defaultLoginFormPassword" class="form-control mb-4" placeholder="Password">


                  <!-- Sign in button -->
                  <button mdbBtn color="info" block="true" class="my-4" type="submit">Sign in</button>

                  <!-- Register -->
                  <p>Nu eres miebro?
                    <a href="">Register</a>
                  </p>

                  <!-- Social login -->
                  <p>or sign in with:</p>

                  <a type="button" class="light-blue-text mx-2">
                    <mdb-icon fab icon="facebook"></mdb-icon>
                  </a>
                  <a type="button" class="light-blue-text mx-2">
                    <mdb-icon fab icon="twitter"></mdb-icon>
                  </a>
                  <a type="button" class="light-blue-text mx-2">
                    <mdb-icon fab icon="linkedin"></mdb-icon>
                  </a>
                  <a type="button" class="light-blue-text mx-2">
                    <mdb-icon fab icon="github"></mdb-icon>
                  </a>

                </div>
<!-- Default form login -->
                </div>
            </div>
        </div>
    </div>

</asp:Content>
