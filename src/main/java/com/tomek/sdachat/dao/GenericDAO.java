package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.ModelEntity;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.List;

public abstract class GenericDAO<T extends ModelEntity> {
    Class<T> type;

    public void create(T entity) {
        Session session = HibernateUtility.getHibernateSession();

        try {
            session.beginTransaction();
            session.save(entity);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }
    }

    public T read(Integer id) {
        Session session = HibernateUtility.getHibernateSession();
        T entity = null;

        try {
            session.beginTransaction();
            entity = session.get(type, id);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }
        return entity;
    }

    public void update(T entity) {
        Session session = HibernateUtility.getHibernateSession();

        try {
            session.beginTransaction();
            session.update(entity);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }
    }

    public void delete(T entity) {
        Session session = HibernateUtility.getHibernateSession();

        try {
            session.beginTransaction();
            session.remove(entity);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }
    }

    public List<T> getAll() {
        Session session = HibernateUtility.getHibernateSession();
        List entities = null;

        try {
            session.beginTransaction();
            entities = session.createQuery("FROM " + type.getSimpleName()).list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }

        return entities;
    }
}
