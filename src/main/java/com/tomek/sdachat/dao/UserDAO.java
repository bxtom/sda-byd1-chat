package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.User;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

public class UserDAO {
    private Session session = HibernateUtility.getHibernateSession();

    public User getUser(int id) {
        User result = null;

        try {
            session.beginTransaction();
            result = session.get(User.class, id);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return result;
    }
}
