package com.qst.bean;

import java.util.Date;

public class Message {
    private String email;
    private Date time;
    private String operation;

    public Message() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }

    @Override
    public String toString() {
        return "message{" +
                "email='" + email + '\'' +
                ", time=" + time +
                ", operation='" + operation + '\'' +
                '}';
    }
}
