using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Mm.DataAccessLayer
{
    public interface IGenericDataRepository <T> where T:class
    {
        IList<T> GetAll(params Expression<Func<T, object>>[] navigationproperties);
        IList<T> GetList(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties);
        T GetSingle(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties);
        void Add(params T[] items);
        void Update(params T[] items);
        void Remove(params T[] items);
    }
}
