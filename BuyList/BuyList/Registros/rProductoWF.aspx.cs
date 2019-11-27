using BLL;
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
    public partial class rProductoWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LLenarComboBox();
            }

        }
        public void Limpia()
        {
            ProductoIdTextBox.Text = string.Empty;
            DescripcionTextBox.Text = string.Empty;
            CantidadTextBox.Text = "0";
            CostoTextBox.Text = "0";
            PrecioTextBox.Text = "0";
            GananciaTextBox.Text = "0";
        }
        public Productos LLenaClase()
        {
            Productos productos = new Productos();
            productos.ProductoId = Utils.ToInt(ProductoIdTextBox.Text);
            productos.CategoriaId = Utils.ToInt(CategoriaDropDownList.SelectedValue);
            productos.Descripcion = DescripcionTextBox.Text;
            productos.Cantidad = Utils.ToInt(CantidadTextBox.Text);
            productos.Precio = Utils.ToDecimal(PrecioTextBox.Text);
            productos.Costo = Utils.ToDecimal(CostoTextBox.Text);
            productos.Ganancia = Utils.ToDecimal(GananciaTextBox.Text);

            return productos;
        }
        public void LLenaCampo(Productos productos)
        {
            ProductoIdTextBox.Text = productos.ProductoId.ToString();
            CategoriaDropDownList.SelectedValue = productos.CategoriaId.ToString();
            DescripcionTextBox.Text = productos.Descripcion.ToString();
            CantidadTextBox.Text = productos.Cantidad.ToString();
            PrecioTextBox.Text = Convert.ToString(productos.Precio);
            CostoTextBox.Text = productos.Costo.ToString();
            GananciaTextBox.Text = productos.Ganancia.ToString();
        }

        protected bool Validar()
        {
            bool paso = true;
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
            Contexto contexto = new Contexto();

            var buscar = contexto.Productos.FirstOrDefault(p => p.Descripcion == DescripcionTextBox.Text);
            if (buscar != null)
            {
                Utils.ShowToastr(this, "El producto ya existe", "Error", "error");
                paso = false;

            }


            return paso;
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            if (ProductoIdTextBox.Text != "")
            {
                RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
                RepositorioBase<Categorias> categoria = new RepositorioBase<Categorias>(new Contexto());
                var buscar = repositorio.Buscar(Utils.ToInt(ProductoIdTextBox.Text));
                if (buscar != null)
                {
                    LLenaCampo(buscar);
                    Utils.ShowToastr(this, "Busqueda Exitosa!!", "Exito", "success");
                }
                else
                {
                    Utils.ShowToastr(this, "Error al Buscar!!", "Error", "error");

                }

            }
            else
            {
                Utils.ShowToastr(this, "Error al Buscar!!", "Error", "error");


            }
        }

        protected void Limpiar_Click(object sender, EventArgs e)
        {
            Limpia();

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {

            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
            Productos productos = new Productos();
            bool paso = false;
            if (!Validar())
                return;
            productos = LLenaClase();
            if (Utils.ToInt(ProductoIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(productos);
            }
            else
            {
                RepositorioBase<Productos> repositorio1 = new RepositorioBase<Productos>(new Contexto());
                var buscar = repositorio1.Buscar(Utils.ToInt(ProductoIdTextBox.Text));
                if (buscar != null)
                {
                    paso = repositorio.Modificar(productos);
                    Utils.ShowToastr(this, "Modificacion Exitosa!!","Exito","success");
                }
                else
                {
                    Utils.ShowToastr(this, "Modificacion Erronea!!", "Error", "error");

                }

            }
            if (paso)
            {
                Limpia();
                Utils.ShowToastr(this, "Guardo Exitosamente!!", "Exito", "success");

            }
            else
            {
                Utils.ShowToastr(this, "Error al guardar", "Error", "error");

            }

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());

            if (repositorio.Eliminar((Utils.ToInt(ProductoIdTextBox.Text))))
            {
                Utils.ShowToastr(this, "Eliminacoin Exitosa!!", "Exito", "success");

            }
            else
            {
                Utils.ShowToastr(this, "Error al eliminar!!", "Error", "error");

            }

        }

        protected void CostoTextBox_TextChanged(object sender, EventArgs e)
        {
            CalcularGanancia();
        }

        protected void PrecioTextBox_TextChanged(object sender, EventArgs e)
        {
            CalcularGanancia();

        }
        public void CalcularGanancia()
        {
            decimal precio, costo, ganancia, margen;
            int cantidad;
            cantidad = Utils.ToInt(CantidadTextBox.Text);
            precio = Utils.ToInt(PrecioTextBox.Text);
            costo = Utils.ToInt(CostoTextBox.Text);

            margen =  precio - costo;

            ganancia = margen * cantidad;

            GananciaTextBox.Text = ganancia.ToString();
        }

        public void LLenarComboBox()
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            CategoriaDropDownList.DataSource = repositorio.GetList(a => true);
            CategoriaDropDownList.DataValueField = "CategoriaId";
            CategoriaDropDownList.DataTextField = "Nombre"; 
            CategoriaDropDownList.DataBind();
        }

        protected void CantidadTextBox_TextChanged(object sender, EventArgs e)
        {
            CalcularGanancia();
        }
    }
}