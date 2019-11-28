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

namespace BuyList.Login
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FechaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
            if (!Page.IsPostBack)
            {

            }


        }

        private void Limpiar()
        {
            UsuarioTextBox.Text = "0";
            NombreTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
            NivelUsiario.SelectedValue = null;
            UsuarioTextBox.Text = string.Empty;
            ClaveTextBox.Text = string.Empty;
            ConfirmarClaveTextBox.Text = string.Empty;
            FechaTextBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }



        //UsuarioId, Nombres, Email, NivelUsuario, Usuario, Clave, FechaIngreso

        public Usuarios LLenaClase()
        {
            Usuarios us = new Usuarios();
            us.UsuarioId = Utils.ToInt(UsuarioTextBox.Text);
            us.Nombres = NombreTextBox.Text.TrimStart();
            us.Email = EmailTextBox.Text.TrimStart();
            us.NivelUsuario = Utils.ToInt(NivelUsiario.SelectedValue);
            us.Usuario = UsuarioTextBox.Text.TrimStart();
            us.Clave = EnCryptDecrypt.CryptorEngine.Encrypt(ClaveTextBox.Text, true);
            us.FehaIngreso = Utils.ToDateTime(FechaTextBox.Text);
            return us;
        }

        public void LLenaCampo(Usuarios usuarios)
        {
            UsuarioIdIdTextBox.Text = usuarios.UsuarioId.ToString();
            NombreTextBox.Text = usuarios.Nombres;
            EmailTextBox.Text = usuarios.Email;
            NivelUsiario.SelectedValue = usuarios.NivelUsuario.ToString();
            UsuarioTextBox.Text = usuarios.Usuario;
            ClaveTextBox.Text = EnCryptDecrypt.CryptorEngine.Decrypt(usuarios.Clave, true).ToString();
            ConfirmarClaveTextBox.Text = EnCryptDecrypt.CryptorEngine.Decrypt(usuarios.Clave, true).ToString();
            FechaTextBox.Text = usuarios.FehaIngreso.ToString("yyyy-MM-dd");
        }

        public bool Validar()
        {
            bool paso = true;
            if (ClaveTextBox.Text != ConfirmarClaveTextBox.Text)
            {
                Utils.ShowToastr(this, "Clave diferentes", "Error", "error");
                ClaveTextBox.Focus();
                paso = false;
            }
            return paso;
        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            var buscar = repositorio.Buscar(Utils.ToInt(UsuarioIdIdTextBox.Text));

            if (buscar != null)
            {
                Utils.ShowToastr(this, "Busqueda Existosa!!", "Exito", "success");
                Limpiar();
                LLenaCampo(buscar);
            }
            else
            {
                Utils.ShowToastr(this, "No Hay Resultado", "Error", "error");
            }


        }

        protected void Limpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            Usuarios usuarios = new Usuarios();
            bool paso = false;

            if (!Validar())
                return;
            usuarios = LLenaClase();
            if (Utils.ToInt(UsuarioIdIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(usuarios);
            }
            else
            {
                paso = repositorio.Modificar(usuarios);
                Limpiar();
                //RepositorioBase<Usuarios> repositorio1 = new RepositorioBase<Usuarios>(new Contexto());
                //int id = Utils.ToInt(UsuarioTextBox.Text);
                //var buscar = repositorio1.Buscar(id);
                //if (buscar != null)
                //{
                //    Utils.ShowToastr(this, "Modificacion Exitosa!!","Exito","success");
                //    paso = repositorio.Modificar(LLenaClase());
                //}
                //else
                //{
                //    Utils.ShowToastr(this, "Modificacion Erronea!!", "Error", "error");
                //}


            }
            if (paso)
            {
                Utils.ShowToastr(this, "Guardo Exitosamente!!", "Exito", "success");
                Limpiar();
            }
            else
            {
                Utils.ShowToastr(this, "No guardo", "Erro", "error");

            }



        }

        protected void Eliminar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            if (repositorio.Eliminar(Utils.ToInt(UsuarioIdIdTextBox.Text)))
            {

            }
            else
            {

            }

        }
    }
}