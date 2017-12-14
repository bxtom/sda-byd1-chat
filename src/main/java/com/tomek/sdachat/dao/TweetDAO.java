package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.List;

public class TweetDAO extends GenericDAO<Tweet> {
    public TweetDAO() {
        type = Tweet.class;
    }

    public List<Tweet> getAllTweetsNewestFirst() {
        Session session = HibernateUtility.getHibernateSession();
        List tweets = null;

        try {
            session.beginTransaction();
            tweets = session.createQuery("from Tweet order by timestamp desc").list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }

            e.printStackTrace();
        }

        return tweets;
    }
}
