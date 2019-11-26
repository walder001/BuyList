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
    public partial class rCategoriaWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void Limpia()
        {
            CategoriaIdTextBox.Text = "0";
            NombreTextBox.Text = string.Empty;
        }
        public Categorias LLenaClase()
        {
            Categorias categorias = new Categorias();
            categorias.CategoriaId = Utils.ToInt(CategoriaIdTextBox.Text);
            categorias.Nombre = NombreTextBox.Text;
            return categorias;

        }
        public void LLenaCampo(Categorias categorias)
        {
            CategoriaIdTextBox.Text = categorias.CategoriaId.ToString();
            NombreTextBox.Text = categorias.Nombre.ToString();

        }

        public bool Validar()
        {
            bool paso = false;

            return paso;
        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            var buscar = repositorio.Buscar(Utils.ToInt(CategoriaIdTextBox.Text));
            if (buscar != null)
            {
                LLenaCampo(buscar);

            }
            else
            {

            }


        }

        protected void Limpiar_Click(object sender, EventArgs e)
        {
            Limpia();
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            Categorias categorias = new Categorias();
            bool paso = false;

            if (Validar())
                return;
            categorias = LLenaClase();
            if (Utils.ToInt(CategoriaIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(categorias);
            }
            else
            {
                    paso = repositorio.Modificar(LLenaClase());

            }
            if (paso)
            {
                Limpia();
            }
            else
            {

            }



        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            if (repositorio.Eliminar(Utils.ToInt(CategoriaIdTextBox.Text)))
            {

            }
            else
            {

            }

        }
    }
}