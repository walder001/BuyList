<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BuyList.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/Imagenes/la.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Imagenes/chicago.jpg" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="/Imagenes/ny.jpg" class="d-block w-100" alt="...">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

    <nav class="nav #ffd600 yellow accent-4 py-4 container ">
        <div class="row offset-3">
        <a class="nav-link active" href="#">Registra Lista</a>
        <a class="nav-link" href="#">Consulta Lista</a>
        <a class="nav-link" href="#">Catalogo de producto</a>
        <a class="nav-link" href="#">Ofertas</a>
        <a class="nav-link disabled" href="#">Pago OnLine</a>
        </div>
    </nav>
    <div class="container btn-light">
        <div class="row">
                
            </div>

            <div class="col">
                <!-- Example split danger button -->
             
            </div>

        </div>
      
    <div class="container">
        <div class="row">
            <div class="card-group">
                <div class="card">
                    <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Precio</h5>
                        <p class="card-text offset-3">100</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Last updated 3 mins ago</small>
                    </div>
                </div>
                <div class="card">
                    <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Precio</h5>
                        <p class="card-text offset-3">100</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Last updated 3 mins ago</small>
                    </div>
                </div>
                <div class="card">
                    <img src="/Imagenes/2.jpg" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Precio</h5>
                        <p class="card-text offset-3">100</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Last updated 3 mins ago</small>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <hr />
    <hr />

</asp:Content>
