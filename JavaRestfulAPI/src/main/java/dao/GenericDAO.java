package dao;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import utils.HibernateUtil;

import java.util.List;

public class GenericDAO<T> implements IGenericDAO<T> {

    private SessionFactory sessionFactory;
    private Session session;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    protected Session getSession() {
        return HibernateUtil.getSessionFactory().getCurrentSession();
    }

    @Override
    public void create(T t) throws Exception {
        try {
            getSession().beginTransaction();
            getSession().save(t);
            getSession().getTransaction().commit();
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean update(T t) throws Exception {
        try {
            getSession().beginTransaction();
            getSession().update(t);
            getSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(int id, Class<T> t) throws Exception {
        try {
            getSession().beginTransaction();
            getSession().delete(getSession().get(t, id));
            getSession().getTransaction().commit();
            return true;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public T get(int id, Class<T> t) throws Exception {
        T t1;
        try {
            getSession().beginTransaction();
            t1 = (T) getSession().get(t, id);
            getSession().getTransaction().commit();
        } catch (Exception e) {
            throw e;
        }
        return t1;
    }

    @Override
    public List<T> getall(Class<T> t) throws Exception {
        List<T> list = null;
        Criteria crit = null;
        try {
            getSession().beginTransaction();
            list = getSession().createCriteria(t).list();
            getSession().getTransaction().commit();
        } catch (Exception e) {
            throw e;
        }
        return list;
    }

    public List<T> getByHQL(String hql, Class<T> t) throws Exception {
        List list = null;
        try {
            getSession().beginTransaction();
//            String sql = "from ReportMaster where saleAmount > 1";
            Query query = getSession().createQuery(hql);
//            query.setParameter("value", 1);
            list = query.list();
            getSession().getTransaction().commit();

        } catch (Exception e) {
            throw e;
        }
        return list;
    }
}
