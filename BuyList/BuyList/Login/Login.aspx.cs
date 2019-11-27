using BLL;
using BuyList.Utilitario;
using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuyList.Login
{
    public partial class Logi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Logear_Click(object sender, EventArgs e)
        {
            Expression<Func<Usuarios, bool>> filtrar = x => true;
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            Usuarios Usuario = new Usuarios();

            filtrar = t => t.Usuario.Equals(UsuarioTextBox.Text) && t.Clave.Equals(ClaveTextBox.Text);

            if (repositorio.GetList(filtrar).Count() != 0)
            {
                FormsAuthentication.RedirectFromLoginPage(Usuario.Usuario, true);
            }
            else
            {
                Utils.ShowToastr(this, "Usuario no enciatrado", "Error", "error");

            }
        }
    }
}