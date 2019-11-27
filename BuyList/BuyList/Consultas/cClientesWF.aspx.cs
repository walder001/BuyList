using BLL;
using BuyList.Utilitario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BuyList.Consultas
{
    public partial class cClientesWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private int ToInt(object valor)
        {
            int retorno = 0;
            int.TryParse(valor.ToString(), out retorno);

            return retorno;
        }
        public void LlenaReport(int index, string criterio)
        {

            MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
            MyReportViewer.Reset();
            MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\ReporteCliente.rdlc");
            MyReportViewer.LocalReport.DataSources.Clear();
            MyReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Cliente", Funcionalidades.FitrarCliente(index, criterio)));
            MyReportViewer.LocalReport.Refresh();

        }

        protected void Buscar_Click(object sender, EventArgs e)
        {
            int id = Utils.ToInt(TextBoxCriterio.Text);
            int index = ToInt(DropDromFiltro.SelectedIndex);
            ClienteGridView.DataSource = Funcionalidades.FitrarCliente(index, TextBoxCriterio.Text);
            ClienteGridView.DataBind();
            LlenaReport(index, TextBoxCriterio.Text);
        }
    }
}