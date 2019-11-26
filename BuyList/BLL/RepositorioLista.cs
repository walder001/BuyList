using DAL;
using Entity;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class RepositorioLista : RepositorioBase<Listas>
    {
        public RepositorioLista(Contexto contexto) : base(contexto)
        {
        }
        public override Listas Buscar(int id)
        {
            Listas lista = new Listas();
           
            try
            {
                lista = _contexto.Listas.Find(id);
                if (lista != null)
                {
                    lista.DetalleListas.Count();
                }

            }
            catch (Exception)
            {

                throw;
            }
            return lista; 
        }



        
        public override bool Guardar(Listas listas)
        {
            bool paso = false;
            try
            {
                if (_contexto.Listas.Add(listas) != null)
                {
                    foreach (var item in listas.DetalleListas)
                    {
                        //_contexto.Clientes.Find().CantidaLista -= item.MontoPagado;
                    }
                }
                paso = _contexto.SaveChanges() > 0;
                _contexto.Dispose();
            }
            catch (Exception)
            {

                throw;
            }

            return paso;
        }

        public override bool Modificar(Listas lista)
        {
            RepositorioLista repositorioVentas = new RepositorioLista(new Contexto());
            Contexto contextoLista = new Contexto();
            bool pasoLista = false;
            try
            {
                Contexto contexto = new Contexto();
                bool paso = false;
                var anterior = repositorioVentas.Buscar(lista.ListaId);
                foreach (var item in anterior.DetalleListas.ToList())
                {
                    if (!lista.DetalleListas.Exists(e => e.DetalleListaId == item.DetalleListaId))
                    {
                        //contexto.Clientes.Find().Balance += item.MontoPagado;
                        contexto.Entry(item).State = System.Data.Entity.EntityState.Deleted;
                        paso = true;
                    }

                }
                if (paso)
                {
                    contexto.SaveChanges();
                    contexto.Dispose();
                }

                foreach (var item in lista.DetalleListas)
                {
                    var estado = EntityState.Unchanged;
                    if (item.DetalleListaId == 0)
                    {
                        estado = EntityState.Added;
                    }
                    contextoLista.Entry(item).State = estado;
                    //contextoLista.Clientes.Find(item.ClienteId).Balance -= item.MontoPagado;

                }
                contextoLista.Entry(lista).State = EntityState.Modified;
                if (contextoLista.SaveChanges() > 0)
                {
                    pasoLista = true;

                }
            }
            catch (Exception)
            {
                throw;


            }
            return pasoLista;

        }


    }
    }

