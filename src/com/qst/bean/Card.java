package com.qst.bean;

public class Card {
    private Integer card_id;
    private String email;
    private Integer money;

    public Card() {
    }

    public Card(Integer money) {
        this.money = money;
    }

    public Card(Integer card_id, String email, Integer money) {
        this.card_id = card_id;
        this.email = email;
        this.money = money;
    }

    public Integer getCard_id() {
        return card_id;
    }

    public void setCard_id(Integer card_id) {
        this.card_id = card_id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    @Override
    public String toString() {
        return "Card{" +
                "card_id='" + card_id + '\'' +
                ", email='" + email + '\'' +
                ", money='" + money + '\'' +
                '}';
    }
}
