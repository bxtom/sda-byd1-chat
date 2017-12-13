package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.Tweet;

public class TweetDAO extends GenericDAO<Tweet> {
    public TweetDAO() {
        type = Tweet.class;
    }
}
