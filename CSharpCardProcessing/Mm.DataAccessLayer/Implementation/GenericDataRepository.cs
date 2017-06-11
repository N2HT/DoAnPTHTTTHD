using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using Mm.DataAccessLayer.Interface;

namespace Mm.DataAccessLayer.Implementation
{
    public class GenericDataRepository<T> : IGenericDataRepository<T> where T : class
    {
        public IList<T> GetAll(params Expression<Func<T, object>>[] navigationproperties)
        {
            List<T> list;
            using (var context = new CardProcessingEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;
                IQueryable<T> dbquery = context.Set<T>();
                // eager loading
                foreach (Expression<Func<T, object>> navigationProperty in navigationproperties)
                {
                    dbquery = dbquery.Include(navigationProperty);
                }
                list = dbquery.AsNoTracking().ToList();
            }
            return list;
        }

        public IList<T> GetList(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties)
        {
            List<T> list;
            using (var context = new CardProcessingEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;
                IQueryable<T> dbquery = context.Set<T>();
                // eager loading
                foreach (Expression<Func<T, object>> navigationProperty in navigationproperties)
                {
                    dbquery = dbquery.Include(navigationProperty);
                }
                list = dbquery.AsNoTracking().Where(where).ToList();
            }
            return list;
        }



        public T GetSingle(Func<T, bool> where, params Expression<Func<T, object>>[] navigationproperties)
        {
            T item;
            using (var context = new CardProcessingEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;
                IQueryable<T> dbquery = context.Set<T>();
                // eager loading
                foreach (Expression<Func<T, object>> navigationProperty in navigationproperties)
                {
                    dbquery = dbquery.Include(navigationProperty);
                }
                item = dbquery.AsNoTracking().SingleOrDefault(where);
            }
            return item;
        }

        public T Add(params T[] items)
        {
            using (var context = new CardProcessingEntities())
            {
                T rs = null;
                foreach (T item in items)
                {
                    context.Entry(item).State = System.Data.EntityState.Added;
                    rs = item;
                }
                context.SaveChanges();

                return rs;
            }
        }

        public void Update(params T[] items)
        {
            using (var context = new CardProcessingEntities())
            {
                foreach (T item in items)
                {
                    context.Entry(item).State = System.Data.EntityState.Modified;
                }
                context.SaveChanges();
            }

        }

        public void Remove(params T[] items)
        {
            using (var context = new CardProcessingEntities())
            {
                foreach (T item in items)
                {
                    context.Entry(item).State = System.Data.EntityState.Deleted;
                }
                context.SaveChanges();
            }
        }

        public IList<T> GetAllWithPaging(int limit, int upset, params Expression<Func<T, object>>[] navigationproperties)
        {
            List<T> list;
            using (var context = new CardProcessingEntities())
            {
                context.Configuration.LazyLoadingEnabled = false;
                context.Configuration.ProxyCreationEnabled = false;
                IQueryable<T> dbquery = context.Set<T>();
                // eager loading
                foreach (Expression<Func<T, object>> navigationProperty in navigationproperties)
                {
                    dbquery = dbquery.Include(navigationProperty);
                }
                list = dbquery.AsNoTracking().ToList().Skip(limit * upset).Take(limit).ToList();
            }
            return list;
        }
    }
}
