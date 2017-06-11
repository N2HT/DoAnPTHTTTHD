using System;
using System.Collections.Generic;
using System.Linq.Expressions;

namespace Mm.DataAccessLayer.Interface
{
	public interface IGenericDataRepository<T> where T : class
	{
		IList<T> GetAll(params Expression<Func<T, object>>[] navigationproperties);
        IList<T> GetAllWithPaging(int limit, int upset, params Expression<Func<T, object>>[] navigationproperties);
        IList<T> GetList(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties);
		T GetSingle(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties);
		T Add(params T[] items);
		void Update(params T[] items);
		void Remove(params T[] items);
	}
}
