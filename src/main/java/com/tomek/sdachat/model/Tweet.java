package com.tomek.sdachat.model;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Tweet {
    private int id;
    private int userId;
    private long timestamp;
    private String message;
}
