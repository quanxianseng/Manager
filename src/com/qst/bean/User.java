package com.qst.bean;

/**
 * 用户实体类
 */
public class User {
    private Integer user_id;
    private String email;
    private String password;

    public User() {
    }

    public User(Integer users_id, String email, String password) {
        this.user_id = users_id;
        this.email = email;
        this.password = password;
    }

    public User(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer users_id) {
        this.user_id = users_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "User{" +
                "users_id=" + user_id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
