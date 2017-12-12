package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.Tweet;
import com.tomek.sdachat.utility.HibernateUtility;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import java.util.List;

public class TweetDAO {
    public void addTweet(Tweet tweet) {
        Session session = HibernateUtility.getHibernateSession();

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

    public Tweet getTweet(int id) {
        Session session = HibernateUtility.getHibernateSession();
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
        Session session = HibernateUtility.getHibernateSession();

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
        Session session = HibernateUtility.getHibernateSession();

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

    public List<Tweet> getAllTweets() {
        Session session = HibernateUtility.getHibernateSession();
        List tweets = null;

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
