package com.tomek.sdachat.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "tweets")
public class Tweet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    private long timestamp;
    private String message;
    @ManyToOne(cascade = CascadeType.ALL)
    private User user;

    public Tweet(long timestamp, String message, User user) {
        this.timestamp = timestamp;
        this.message = message;
        this.user = user;
    }
}
