using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class Listas
    {
        [Key]
        public int ListaId { get; set; }
        public int ClienteId { get; set; }
        public string NombreLista { get; set; }
        public decimal SubTotalLista { get; set; }
        public decimal ItebisTotalLista { get; set; }
        public decimal TotalLista { get; set; }
        public int CantidadTotal { get; set; }

        public virtual List<DetalleListas> DetalleListas { get; set; }
         public Listas()
        {
            ListaId = 0;
            ClienteId = 0;
            NombreLista = string.Empty;
            SubTotalLista = 0;
            ItebisTotalLista = 0;
            TotalLista = 0;
            CantidadTotal = 0;
            this.DetalleListas = new List<DetalleListas>();

        }

        public Listas(int listaId, int clienteId, string nombreLista, decimal subTotalLista, decimal itebisTotalLista, decimal totalLista, int cantidadTotal)
        {
            ListaId = listaId;
            ClienteId = clienteId;
            NombreLista = nombreLista;
            SubTotalLista = subTotalLista;
            ItebisTotalLista = itebisTotalLista;
            TotalLista = totalLista;
            CantidadTotal = cantidadTotal;
            this.DetalleListas = new List<DetalleListas>();

        }
        public void AgregarLista(int detalleListaId,int listaid, int clienteId, string producto, int cantidad, decimal precio, decimal importe, decimal itebis)
        {
           this.DetalleListas.Add(new DetalleListas(detalleListaId,listaid,clienteId, producto,cantidad,precio,importe, itebis));
        }
    }
}
