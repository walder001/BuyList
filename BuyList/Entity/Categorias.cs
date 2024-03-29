﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class Categorias
    {
        [Key]
        public int CategoriaId { get; set; }
        public string Nombre { get; set; }
        public Categorias()
        {
            CategoriaId = 0;
            Nombre = string.Empty;

        }

        public Categorias(int categoriaId, string nombre)
        {
            CategoriaId = categoriaId;
            Nombre = nombre;
        }
    }
}
