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
    public partial class rClienteWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Limpiar()
        {
            ClienteIdTextBox.Text = "0";
            NombreTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            CantidadTextBox.Text = string.Empty;
        }
        public Clientes LLenaClase()
        {
            Clientes clientes = new Clientes();
            clientes.ClienteId = Utils.ToInt(ClienteIdTextBox.Text);
            clientes.Nombre = NombreTextBox.Text;
            clientes.Email = EmailTextBox.Text;
            clientes.CantidaArticulo = Utils.ToInt(CantidadTextBox.Text);
            return clientes;
        }

        public void LLenaCampo(Clientes clientes)
        {
            ClienteIdTextBox.Text = clientes.ClienteId.ToString();
            NombreTextBox.Text = clientes.Nombre.ToString();
            EmailTextBox.Text = clientes.Email.ToString();
            CantidadTextBox.Text = clientes.CantidaArticulo.ToString();

        }
        public bool Validar()
        {
            bool paso = false;
            return paso;

        }
        protected void Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Clientes> repositorio = new RepositorioBase<Clientes>(new Contexto());
            Clientes clientes = new Clientes();
            bool paso = false;

            if (Validar())
                return;
            clientes = LLenaClase();
            if (Utils.ToInt(ClienteIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(clientes);
            }
            else
            {
                paso = repositorio.Modificar(LLenaClase());

            }
            if (paso)
            {
                Limpiar();
            }
            else
            {

            }



        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Clientes> repositorio = new RepositorioBase<Clientes>(new Contexto());
            if (repositorio.Eliminar(Utils.ToInt(ClienteIdTextBox.Text)))
            {

            }
            else
            {

            }

        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Clientes> repositorio = new RepositorioBase<Clientes>(new Contexto());
            var buscar = repositorio.Buscar(Utils.ToInt(ClienteIdTextBox.Text));
            if (buscar != null)
            {
                LLenaCampo(buscar);

            }
            else
            {

            }


        }

    }
}