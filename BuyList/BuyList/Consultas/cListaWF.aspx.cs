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

namespace BuyList.Consultas
{
    public partial class cListaWF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LlenaReport();


            }
        }

        public void LlenaReport()
        {
            RepositorioBase<Listas> repositorio = new RepositorioBase<Listas>(new Contexto());

            MyReportViewer.ProcessingMode = Microsoft.Reporting.WebForms.ProcessingMode.Local;
            MyReportViewer.Reset();
            MyReportViewer.LocalReport.ReportPath = Server.MapPath(@"~\Reportes\ReporteLista.rdlc");
            MyReportViewer.LocalReport.DataSources.Clear();
            MyReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("Lista", Funcionalidades.FReporteLista()));
            MyReportViewer.LocalReport.Refresh();

        }
        public int ToInt(object valor)
        {
            int retorno = 0;
            int.TryParse(valor.ToString(), out retorno);
            return retorno;

        }
        protected void Buscar_Click(object sender, EventArgs e)
        {
            int id = Utils.ToInt(TextBoxCriterio.Text);
            int index = ToInt(DropDromFiltro.SelectedIndex);
            ListaGridView.DataSource = Funcionalidades.FiltrarLista(index,TextBoxCriterio.Text);
            ListaGridView.DataBind();
        }
    }
}