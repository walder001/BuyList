using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class DetalleListas
    {
        [Key]
        public int DetalleListaId { get; set; }
        public string Producto { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public decimal Importe { get; set; }
        public decimal Itebis { get; set; }
        public DetalleListas()
        {
            DetalleListaId = 0;
            Producto = string.Empty;
            Cantidad = 0;
            Precio = 0;
            Importe = 0;
            Itebis = 0;

        }

        public DetalleListas(int detalleListaId, string producto, int cantidad, decimal precio, decimal importe, decimal itebis)
        {
            DetalleListaId = detalleListaId;
            Producto = producto;
            Cantidad = cantidad;
            Precio = precio;
            Importe = importe;
            Itebis = itebis;
        }
    }
}
