﻿using BLL;
using BuyList.Utilitario;
using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuyList.Registros
{
    public partial class Lista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) 
            {
                LLenarCategoria();
                base.ViewState["Listas"] = new Listas();
                ViewState["Detalle"] = new Listas().DetalleListas;

                this.BindGrid();
            }

        }
        public void Limpiar()
        {
            ListaIdTextBox.Text = "0";
            ClienteDropList.SelectedValue = null;
            NombreListaTextBox.Text = string.Empty;
            CategoriaDropDownList.SelectedValue = null;
            ProductoDropDownList.SelectedValue = null;
            CantidadTextBox.Text = string.Empty;
            PrecioTextBox.Text = string.Empty;
            ItebisTextBox.Text = string.Empty;
            ImporteTextBox.Text = string.Empty;
            CantidadTotalTextBox.Text = string.Empty;
            SubTotalTextBox.Text = string.Empty;
            ItebisTotalTextBox.Text = string.Empty;
            TotalTextBox.Text = string.Empty;
            base.ViewState["Listas"] = new Listas();
            this.BindGrid();

        }
        public Listas LLenaClase()
        {
            Listas listas = new Listas();
            listas = (Listas)ViewState["Listas"];
            listas.ListaId = Utils.ToInt(ListaIdTextBox.Text);
            listas.ClienteId = Utils.ToInt(ClienteDropList.SelectedValue);
            listas.NombreLista = NombreListaTextBox.Text;
            listas.CantidadTotal = Utils.ToInt(CantidadTotalTextBox.Text);
            listas.SubTotalLista = Utils.ToDecimal(SubTotalTextBox.Text);
            listas.ItebisTotalLista = Utils.ToDecimal(ItebisTotalTextBox.Text);
            listas.TotalLista = Utils.ToDecimal(TotalTextBox.Text);
            this.BindGrid();
            return listas;
        }
        
        public void LLenaCampo(Listas listas)
        {
            Limpiar();
            ((Listas)ViewState["Listas"]).DetalleListas = listas.DetalleListas;
            ListaIdTextBox.Text = listas.ListaId.ToString();
            ClienteDropList.SelectedValue = listas.ClienteId.ToString();
            NombreListaTextBox.Text = listas.NombreLista.ToString();
            CantidadTotalTextBox.Text = listas.CantidadTotal.ToString();
            SubTotalTextBox.Text = listas.SubTotalLista.ToString();
            ItebisTotalTextBox.Text = listas.ItebisTotalLista.ToString();
            TotalTextBox.Text = listas.TotalLista.ToString();
            this.BindGrid();
        }
        protected void BindGrid()
        {
            if (ViewState["Listas"] != null)
            {
                VentaGridView.DataSource = ((Listas)ViewState["Listas"]).DetalleListas;
                VentaGridView.DataBind();
            }

        }

        public void LLenarProducto()
        {
            RepositorioBase<Productos> producto = new RepositorioBase<Productos>(new Contexto());
            int categoriaId = Utils.ToInt(CategoriaDropDownList.SelectedValue);

            ProductoDropDownList.DataSource = producto.GetList(a => a.CategoriaId == categoriaId);
            ProductoDropDownList.DataValueField = "ProductoId";
            ProductoDropDownList.DataTextField = "Descripcion";
            ProductoDropDownList.DataBind();

        }
        public void LLenarCategoria()
        {
            RepositorioBase<Categorias> categoria = new RepositorioBase<Categorias>(new Contexto());
            CategoriaDropDownList.DataSource = categoria.GetList(a => true);
            CategoriaDropDownList.DataValueField = "CategoriaId";
            CategoriaDropDownList.DataTextField = "Nombre";
            CategoriaDropDownList.DataBind();


            RepositorioBase<Clientes> clientes = new RepositorioBase<Clientes>(new Contexto());
            ClienteDropList.DataSource = clientes.GetList(a => true);
            ClienteDropList.DataValueField = "ClienteId";
            ClienteDropList.DataTextField = "Nombre";
            ClienteDropList.DataBind();
        }

        public void CalcularImporte()
        {
            decimal cantidad, precio, itebis = 0, importe;
            cantidad = Utils.ToInt(CantidadTextBox.Text);
            precio = Utils.ToDecimal(PrecioTextBox.Text);
            itebis = Utils.ToDecimal(ItebisTextBox.Text);
            importe = precio * cantidad;
            ImporteTextBox.Text = importe.ToString();
        }

        public void Calcular()
        {
            List<DetalleListas> detalles = new List<DetalleListas>();
            decimal subtotal = 0, itebisVenta = 0, total = 0, importe = 0, totalG = 0, valor = 0, cantidad = 0, cantidadTotal = 0, cant = 0;
            cantidad = Utils.ToInt(CantidadTextBox.Text);
            cantidadTotal = Utils.ToInt(CantidadTotalTextBox.Text);
            importe = Utils.ToDecimal(ImporteTextBox.Text);
            totalG = Utils.ToDecimal(TotalTextBox.Text);


            itebisVenta = importe * (decimal)0.10;
            subtotal = importe - itebisVenta;
            total = subtotal + itebisVenta;
            valor = total + totalG;
            cant = cantidad + cantidadTotal;

            CantidadTotalTextBox.Text = cant.ToString();
            SubTotalTextBox.Text = subtotal.ToString();
            ItebisTotalTextBox.Text = itebisVenta.ToString();
            TotalTextBox.Text = valor.ToString();
        }
        public void LlenarTotal()
        {
            RepositorioBase<DetalleListas> repositorio = new RepositorioBase<DetalleListas>(new Contexto());
            decimal puntos = 0;
            int listar = Utils.ToInt(ListaIdTextBox.Text);
            List<DetalleListas> lista = repositorio.GetList(e => e.DetalleListaId == listar);
            foreach (var item in lista)
            {
                puntos += item.Importe;
            }
            TotalTextBox.Text = puntos.ToString();

        }
        public void LlenarPrecio()
        {
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
            int id = Utils.ToInt(ProductoDropDownList.SelectedValue);
            List<Productos> productos = repositorio.GetList(p => p.ProductoId == id);
            foreach (var item in productos)
            {
                ItebisTextBox.Text = "0.10";
                PrecioTextBox.Text = item.Precio.ToString();
            }
        }
        public void LLenarValor()
        {
            List<DetalleListas> detalles = new List<DetalleListas>();
            if (VentaGridView.DataSource != null)
            {
                detalles = (List<DetalleListas>)VentaGridView.DataSource;
            }
        }

        public bool Validar()
        {
            bool paso = false;
            return paso;
        }

        protected void Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
            Utils.ShowToastr(this, "Limpieza Exitosa!!", "Exito");

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            RepositorioLista repositorio = new RepositorioLista(new Contexto());
            Listas lista = new Listas();
            bool paso = false;
            if (Validar())
                return;
            lista = LLenaClase();
            if (Utils.ToInt(ListaIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(lista);

            }
            else
            {
                if (repositorio.Buscar(Utils.ToInt(ListaIdTextBox.Text)) != null)
                {
                    paso = repositorio.Modificar(lista);
                    Utils.ShowToastr(this, "Modificacion Exitosa!!", "Exito", "success");

                }
                else
                {
                    Utils.ShowToastr(this, "Error al modificar!!", "Error", "error");

                }
            }
            if (paso)
            {
                Limpiar();
                Utils.ShowToastr(this, "Guardar Exitosa!!", "Exito", "success");
            }
            else
            {
                Utils.ShowToastr(this, "Error al Guardar!!", "Error", "error");

            }

        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
           RepositorioLista repositorio = new RepositorioLista(new Contexto());

            var buscar = repositorio.Buscar(Utils.ToInt(ListaIdTextBox.Text));
            if (buscar != null)
            {
                Limpiar();
                LLenaCampo(buscar);
                Utils.ShowToastr(this, "Busqueda Exitosa!!", "Exito", "success");

            }
            else
            {
                Utils.ShowToastr(this, "No encostrado!!", "Error", "error");

            }

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            RepositorioLista repositorio = new RepositorioLista(new Contexto());

            if (repositorio.Eliminar(Utils.ToInt(ListaIdTextBox.Text)))
            {
                Utils.ShowToastr(this, "Eliminacion Exitosa!!", "Exito", "success");

            }
            else
            {
                Utils.ShowToastr(this, "Erro al eliminar!!", "Error", "error");

            }
        }

        protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //decimal total = 0, resta = 0;
            //total = Utils.ToDecimal(TotalTextBox.Text);
            //Evaluaciones evaluaciones = new Evaluaciones();
            //evaluaciones = (Evaluaciones)ViewState["Evaluaciones"];
            //ViewState["Detalle"] = evaluaciones.Detalles;
            //int Fila = e.RowIndex;
            //evaluaciones.Detalles.RemoveAt(Fila);
            //this.BindGrid();
            //RepositorioBase<DetalleEvaluaciones> repositorio = new RepositorioBase<DetalleEvaluaciones>(new Contexto());
            //int evaluar = Utils.ToInt(EvaluacionTextBox.Text);
            //var op = repositorio.GetList(x => x.EvaluacionId == evaluar);
            //List<DetalleEvaluaciones> lista = repositorio.GetList(a => a.EvaluacionId == evaluar);
            //lista = op;

            //foreach (var item in evaluaciones.Detalles)
            //{
            //    resta += item.Perdido;
            //}

            //decimal p, pro = Utils.ToInt(TotalTextBox.Text);
            //p = resta - pro;
            //TotalTextBox.Text = p.ToString();


        }

        protected void CantidadTextBox_TextChanged(object sender, EventArgs e)
        {
            CalcularImporte();
            LlenarPrecio();

        }

        protected void Agregar_Click(object sender, EventArgs e)
        {
            Calcular();
            CalcularImporte();

            Listas lista = new Listas();
            lista = (Listas)base.ViewState["Listas"];
            lista.AgregarLista(0,Utils.ToInt(ListaIdTextBox.Text),Utils.ToInt(ClienteDropList.SelectedValue), ProductoDropDownList.Text, Utils.ToInt(CantidadTextBox.Text), Utils.ToDecimal(PrecioTextBox.Text), Utils.ToDecimal(ImporteTextBox.Text), Utils.ToDecimal(ItebisTextBox.Text));
            ViewState["Listas"] = lista;
            this.BindGrid();
            LLenarValor();

        }


        protected void Actualizar_Click(object sender, EventArgs e)
        {
            LLenarProducto();
            LlenarPrecio();
        }

        protected void Lista_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gv = (GridView)sender;
            gv.PageIndex = e.NewPageIndex;
            this.BindGrid();
        }
    }
}