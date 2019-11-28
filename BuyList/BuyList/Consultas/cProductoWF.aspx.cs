using BLL;
using BuyList.Utilitario;
using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuyList.Consultas
{
    public partial class cProductoWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int index = ToInt(DropDrom.SelectedItem);
                LlenaReport(index, TextBoxCriterio.Text);
            }

        }
        public void LlenaReport(int index, string criterio)
        {
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());

            MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
            MyReportViewer.Reset();
            MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\ReporteProducto.rdlc");
            MyReportViewer.LocalReport.DataSources.Clear();
            MyReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Producto", Funcionalidades.FiltrarProducto(index,criterio)));
            MyReportViewer.LocalReport.Refresh();

        }

        private int ToInt(object valor)
        {
            int retorno = 0;
            int.TryParse(valor.ToString(), out retorno);
            return retorno;

        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            int id = Utils.ToInt(TextBoxCriterio.Text);
            int index = ToInt(DropDrom.SelectedIndex);

            DateTime desde = Utils.ToDateTime(FechaIncio.Text);
            DateTime hasta = Utils.ToDateTime(FechaFin.Text);

            DatosGridView.DataSource = Funcionalidades.FiltrarProducto(id, TextBoxCriterio.Text);
            DatosGridView.DataBind();
            LlenaReport(index, TextBoxCriterio.Text);
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }
    }
}