package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

public class TweetDAO {
    private Session session = HibernateUtility.getHibernateSession();

    public Tweet insertTweet(Tweet tweet) {
        try {
            session.beginTransaction();
            session.save(tweet);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return tweet;
    }
}
