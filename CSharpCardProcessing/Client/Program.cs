using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Mm.BusinessLayer;
using Mm.DomainModel;
namespace Client
{
    class Program
    {
        static void Main(string[] args)
        {
            BusinessLayer bus = new BusinessLayer();
            Department d = new Department { Name = "CNTT" };
            IList<Department> list = bus.GetAllDepartment();
            if (list != null)
            {
                foreach (Department dep in list)
                {
                    Console.WriteLine("{0} - {1}", dep.DepartmentId, dep.Name);
                }
            }

            bus.AddDepartment(d);

        }
    }
}
