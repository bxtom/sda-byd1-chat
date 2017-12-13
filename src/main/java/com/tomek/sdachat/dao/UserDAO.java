package com.tomek.sdachat.dao;

import com.tomek.sdachat.model.User;

public class UserDAO extends GenericDAO<User> {
    public UserDAO() {
        type = User.class;
    }
}
