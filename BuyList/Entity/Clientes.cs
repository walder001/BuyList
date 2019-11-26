using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable()]
    public class Clientes
    {
        [Key]
        public int ClienteId { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public decimal CantidaArticulo { get; set; }
        public Clientes()
        {
            ClienteId = 0;
            Nombre = string.Empty;
            Email = string.Empty;
            CantidaArticulo = 0;

        }

        public Clientes(int clienteId, string nombre, string email, decimal cantidaArticulo)
        {
            ClienteId = clienteId;
            Nombre = nombre;
            Email = email;
            CantidaArticulo = cantidaArticulo;
        }
    }

}
