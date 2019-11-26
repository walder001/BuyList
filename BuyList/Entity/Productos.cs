using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class Productos
    {
        [Key]
        public int ProductoId { get; set; }
        public int CategoriaId { get; set; }
        public string Descripcion { get; set; }
        public int Cantidad { get; set; }
        public decimal Precio { get; set; }
        public decimal Costo { get; set; }
        public decimal Ganancia { get; set; }


        public Productos()
        {
            ProductoId = 0;
            CategoriaId = 0;
            Cantidad = 0;
            Descripcion = string.Empty;
            Precio = 0;
            Costo = 0;
            Ganancia = 0;
        }

        public Productos(int productoId, int categoriaId,int cantidad, string descripcion, decimal precio, decimal costo, decimal ganacia)
        {
            ProductoId = productoId;
            CategoriaId = categoriaId;
            Cantidad = cantidad;
            Descripcion = descripcion;
            Precio = precio;
            Costo = costo;
            Ganancia = ganacia;
        }
    }
}
