using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ejemplo
{
    class Program
    {
        static void Main(string[] args)
        {
            List<int> numbers = new List<int>() { 5, 4, 1, 3, 9, 8, 6, 7, 2, 0 };

            var nombresAlumnos = numbers.Select(x => true).ToList();
            Console.WriteLine(nombresAlumnos); 



        }
    }
}
