using Microsoft.VisualStudio.TestTools.UnitTesting;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BLL;
using DAL;

namespace Entity.Tests
{
    [TestClass()]
    public class ClientesTests
    {
        [TestMethod()]
        public void Guardar()
        {
            RepositorioBase<Clientes> repositorio;
            repositorio = new RepositorioBase<Clientes>(new Contexto());
            Assert.IsTrue(repositorio.Guardar(new Clientes()));
        }

        [TestMethod()]
        public void GetList()
        {
            RepositorioBase<Clientes> repositorio;
            repositorio = new RepositorioBase<Clientes>(new Contexto());
            Assert.IsNotNull(repositorio.GetList(a => true));
        }

        [TestMethod()]
        public void Buscar()
        {
            RepositorioBase<Clientes> repositorio;
            repositorio = new RepositorioBase<Clientes>(new Contexto());
            Assert.IsNotNull(repositorio.Buscar(1));
        }


        [TestMethod()]
        public void Modificar()
        {
            RepositorioBase<Clientes> repositorio;
            repositorio = new RepositorioBase<Clientes>(new Contexto());
            Clientes clientes = new Clientes();
            clientes.ClienteId = 1;
            clientes.Nombre = "Walder";
            clientes.CantidaArticulo = 100;

            Assert.IsTrue(repositorio.Modificar(clientes));
        }

        [TestMethod()]
        public void Eliminar()
        {
            RepositorioBase<Clientes> repositorio;
            repositorio = new RepositorioBase<Clientes>(new Contexto());
            Assert.IsNotNull(repositorio.Eliminar(1));
        }
    }
}