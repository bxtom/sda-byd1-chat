package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.List;

public class TweetDAO {
    private Session session = HibernateUtility.getHibernateSession();

    public void createTweet(Tweet tweet) {
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
    }

    public Tweet readTweet(int id) {
        Tweet result = null;

        try {
            session.beginTransaction();
            result = session.get(Tweet.class, id);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
        return result;
    }

    public void updateTweet(Tweet tweet) {
        try {
            session.beginTransaction();
            session.update(tweet);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

    public void deleteTweet(Tweet tweet) {
        try {
            session.beginTransaction();
            session.remove(tweet);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        }
    }

    public List<Tweet> getTweetList() {
        List<Tweet> tweets = null;

        try {
            session.beginTransaction();
            tweets = session.createQuery("FROM Tweet").list();
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
