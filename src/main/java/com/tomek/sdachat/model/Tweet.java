package com.tomek.sdachat.model;

import lombok.AllArgsConstructor;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@Entity
@Table(name = "tweets")
public class Tweet {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column
    private int id;
    @Column(name = "user_id")
    private int userId;
    private long timestamp;
    private String message;
}
