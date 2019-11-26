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
    public partial class rUsuarioWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void Limpiar()
        {
            UsuarioTextBox.Text = "0";
            NombreTextBox.Text = string.Empty;
            EmailTextBox.Text = string.Empty;
           // Nivel.Text = null;
            UsuarioTextBox.Text = string.Empty;
            ClaveTextBox.Text = string.Empty;
            ConfirmarClaveTextBox.Text = string.Empty;
            FechaTextBox.Text = DateTime.Now.ToString("dd-MM-yyy");
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
            ClaveTextBox.Text = EnCryptDecrypt.CryptorEngine.Decrypt(usuarios.Clave, true);
            ConfirmarClaveTextBox.Text = EnCryptDecrypt.CryptorEngine.Decrypt(usuarios.Clave, true); ;
            FechaTextBox.Text = DateTime.Now.ToString("dd-MM-yyyy");
        }

        public bool Validar()
        {
            bool paso = false;
            if (ClaveTextBox.Text != ConfirmarClaveTextBox.Text)
            {
                ClaveTextBox.Focus();
                paso = true;
            }
            return paso;
        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            var buscar = repositorio.Buscar(Utils.ToInt(UsuarioIdIdTextBox.Text));
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
            Limpiar();
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            RepositorioBase<Usuarios> repositorio = new RepositorioBase<Usuarios>(new Contexto());
            Usuarios usuarios = new Usuarios();
            bool paso = false;

            if (Validar())
                return;
            usuarios = LLenaClase();
            if (Utils.ToInt(UsuarioIdIdTextBox.Text) == 0)
            {
                paso = repositorio.Guardar(usuarios);
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