using NutritionData.Repositories.Interface;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace NutritionData.Repositories
{
    public class Repository<T> : IDisposable,IRepository<T> where T : class, new()
    {
        private NutritionDatabaseEntities _entities;
        public Repository()
        {
            _entities = new NutritionDatabaseEntities();
        }

        public virtual IEnumerable<T> All()
        {
            IEnumerable<T> query = _entities.Set<T>();
            return query.ToList();
        }

        public IEnumerable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {
            IEnumerable<T> query = _entities.Set<T>().Where(predicate);
            return query.ToList();
        }

        public virtual void Add(T entity)
        {
            _entities.Set<T>().Add(entity);
            try
            {
                _entities.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                var objContext = ((IObjectContextAdapter)_entities).ObjectContext;
                objContext.Refresh(RefreshMode.ClientWins, entity);
                objContext.SaveChanges();
            }
        }

        public virtual void AddRange(IEnumerable<T> entities)
        {
            foreach (var entity in entities)
            {
                _entities.Set<T>().Add(entity);
            }
            try
            {
                _entities.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                var objContext = ((IObjectContextAdapter)_entities).ObjectContext;
                objContext.Refresh(RefreshMode.ClientWins, entities);
                objContext.SaveChanges();
            }
        }

        public virtual void Delete(T entity)
        {
            _entities.Set<T>().Remove(entity);
            _entities.Entry(entity).State = EntityState.Deleted;
            try
            {
                _entities.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                var objContext = ((IObjectContextAdapter)_entities).ObjectContext;
                objContext.Refresh(RefreshMode.ClientWins, entity);
                objContext.SaveChanges();
            }
        }

        public virtual void DeleteRange(IEnumerable<T> entities)
        {
            _entities.Set<T>().RemoveRange(entities);
            try
            {
                _entities.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                var objContext = ((IObjectContextAdapter)_entities).ObjectContext;
                objContext.Refresh(RefreshMode.ClientWins, entities);
                objContext.SaveChanges();
            }
        }

        public virtual T First(Expression<Func<T, bool>> predicate)
        {
            return _entities.Set<T>().First(predicate);
        }

        public virtual T FirstOrDefault(Expression<Func<T, bool>> predicate)
        {
            return _entities.Set<T>().FirstOrDefault(predicate);
        }

        public virtual T Single(Expression<Func<T, bool>> predicate)
        {
            return _entities.Set<T>().Single(predicate);
        }

        public virtual T SingleOrDefault(Expression<Func<T, bool>> predicate)
        {
            return _entities.Set<T>().SingleOrDefault(predicate);
        }

        public virtual T LastOrDefault(Expression<Func<T, bool>> predicate)
        {
            return _entities.Set<T>().LastOrDefault(predicate);
        }

        public void DeleteByPredicate(Expression<Func<T, bool>> predicate)
        {
            _entities.Set<T>().Where(predicate).ForEachAsync(x => Delete(x));
        }

        public void Dispose()
        {
            _entities.Dispose();
        }
    }
}
