using BLL;
using BuyList.Utilitario;
using DAL;
using Entity;
using Microsoft.Reporting.WinForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuyList.Consultas
{
    public partial class cCategoriaWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenaReport();
            }
        }
        private int ToInt(object valor)
        {
            int retorno = 0;
            int.TryParse(valor.ToString(), out retorno);

            return retorno;
        }
        public void LlenaReport()
        {

            MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
            MyReportViewer.Reset();
            MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\ReporteCategoria.rdlc");
            MyReportViewer.LocalReport.DataSources.Clear();
            MyReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Categoria",Funcionalidades.FReporteCategoria()));
            MyReportViewer.LocalReport.Refresh();

        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            int id = Utils.ToInt(TextBoxCriterio.Text);
            int index = ToInt(DropDromFiltro.SelectedIndex);
            CategoriaGridView.DataSource = Funcionalidades.FitrarCategoria(index,TextBoxCriterio.Text);
            CategoriaGridView.DataBind();
        }

        protected void Imprimir_Click(object sender, EventArgs e)
        {

        }
    }
}