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
    public partial class CheckList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LLenaConbox();
                ViewState["Listas"] = new Listas();
            }

        }

        public void LLenaConbox()
        {
            RepositorioBase<Listas> repositorio = new RepositorioBase<Listas>(new Contexto());
            ListaDropDownList.DataSource = repositorio.GetList(L => true);
            ListaDropDownList.DataValueField = "ListaId";
            //ListaDropDownList.DataTextField = "Clientes";
            ListaDropDownList.DataBind();
        }

        protected void BindGrid()
        {
            if (ViewState["Listas"] != null)
            {
                ListaGridView.DataSource = ((Listas)ViewState["Listas"]).DetalleListas;
                ListaGridView.DataBind();
            }
        }
        public void LLenaCampo(Listas listas)
        {
            ((Listas)ViewState["Listas"]).DetalleListas = listas.DetalleListas;
            CheckListIdTextBox.Text = listas.ListaId.ToString();
            SubTotalTextBox.Text = listas.SubTotalLista.ToString();
            ItebisTotalTextBox.Text = listas.ItebisTotalLista.ToString();
            TotalTextBox.Text = listas.TotalLista.ToString();
            this.BindGrid();
        }


        protected void Limpiar_Click(object sender, EventArgs e)
        {

        }

        protected void Guardar_Click(object sender, EventArgs e)
        {

        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {

        }

        protected void Buscar_Click(object sender, EventArgs e)
        {

        }

        protected void Actualizar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Listas> repositorio = new RepositorioBase<Listas>(new Contexto());
            var buscar = repositorio.Buscar(Utils.ToInt(ListaDropDownList.SelectedValue));
            if (buscar != null)
            {
                LLenaCampo(buscar);

            }

        }

        protected void Grid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void ListaGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in ListaGridView.Rows)
            {
                for (int i = 0; i < ListaGridView.Columns.Count; i++)
                {
                    String header = ListaGridView.Columns[i].HeaderText;
                    String cellText = row.Cells[i].Text;
                }
            }

        }
    }
}