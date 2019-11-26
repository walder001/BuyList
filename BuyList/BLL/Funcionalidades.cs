using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class Funcionalidades
    {
        public static List<Clientes> FiltrarClientes(int index, string criterio, DateTime desde, DateTime hasta)
        {
            Expression<Func<Clientes, bool>> filtro = p => true;
            RepositorioBase<Clientes> repositorio = new RepositorioBase<Clientes>(new Contexto());
            List<Clientes> list = new List<Clientes>();

            int id = Convert.ToInt32(criterio);
            switch (index)
            {
                //case 0://Todo
                //    break;

                //case 1://Todo por fecha
                //    filtro = p => p.Feh>= desde && p.Fecha <= hasta;
                //    break;

                //case 2://ClienteId
                //    filtro = p => p.ClienteId == id && p.Fecha >= desde && p.Fecha <= hasta;
                //    break;

                //case 3://Nombre
                //    filtro = p => p.Nombres.Contains(criterio) && p.Fecha >= desde && p.Fecha <= hasta;
                //    break;
            }

            list = repositorio.GetList(filtro);

            return list;
        }

        public static int ToInt(string valor)
        {
            int retorno = 0;
            int.TryParse(valor, out retorno);
            return retorno;
            

        }
        public static decimal ToDecimal(string valor)
        {
            decimal retorno = 0;
            decimal.TryParse(valor, out retorno);
            return retorno;

        }
        public static List<Categorias> FitrarCategoria(int index, string criterio)
        {
            List<Categorias> lista = new List<Categorias>();
            Expression<Func<Categorias,bool>> filtro = f => true;
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            int id = ToInt(criterio);
            switch (index)
            {
                //Todo
                case 0: 
                    break;

                //Id
                case 1: filtro = f => f.CategoriaId == id;

                    break;

               //Nombre
                case 2: filtro = f => f.Nombre.Contains(criterio);
                    break;     

            }
            lista = repositorio.GetList(filtro);

            return lista;
        }
        public static List<Productos> FiltrarProducto(int index, string criterio, DateTime desde, DateTime hasta)
        {
            List<Productos> lista = new List<Productos>();
            Expression<Func<Productos, bool>> filtro = f => true;
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
            int id = ToInt(criterio);
            decimal de = ToDecimal(criterio);

            switch (index)
            {
                case 0:
                    break;
                case 1:
                    filtro = p => p.ProductoId == id;
                    break;
                case 2:
                    filtro = p => p.CategoriaId == id;
                    break;
                case 3:
                    filtro = p => p.Descripcion.Contains(criterio);
                    break;
                case 4:
                    filtro = p => p.Costo == de;
                    break;
                case 5:
                    filtro = p => p.Precio == de;
                    break;
                case 6:
                    filtro = p => p.Ganancia == de;
                    break;

            }
            lista = repositorio.GetList(filtro);
            return lista;

        }

        public static List<Listas> FiltrarLista(int index, string criterio)
        {
            List<Listas> listas = new List<Listas>();
            Expression<Func<Listas, bool>> filtro = a => true;
            RepositorioBase<Listas> repositorio = new RepositorioBase<Listas>(new Contexto());
            int id = ToInt(criterio);

            switch (index)
            {
                case 0:
                    break;
                case 1:
                    filtro = a => a.ListaId == id;
                    break;

            }
            listas = repositorio.GetList(filtro);
            return listas;
        }
        

  
        public static List<Categorias> FReporteCategoria()
        {
            List<Categorias> lista = new List<Categorias>();
            Expression<Func<Categorias, bool>> filtro = f => true;
            RepositorioBase<Categorias> repositorio = new RepositorioBase<Categorias>(new Contexto());
            lista = repositorio.GetList(filtro);
            return lista;
        }

        public static List<Productos> FReporteProducto()
        {
            List<Productos> lista = new List<Productos>();
            Expression<Func<Productos, bool>> filtro = f => true;
            RepositorioBase<Productos> repositorio = new RepositorioBase<Productos>(new Contexto());
            lista = repositorio.GetList(filtro);
            return lista;
        }

        public static List<Listas> FReporteLista()
        {
            List<Listas> lista = new List<Listas>();
            Expression<Func<Listas, bool>> filtro = f => true;
            RepositorioBase<Listas> repositorio = new RepositorioBase<Listas>(new Contexto());
            lista = repositorio.GetList(filtro);
            return lista;
        }
    }
}
