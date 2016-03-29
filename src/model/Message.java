package model;

import javax.persistence.*;

@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Test test;

    private int min;
    private int max;
    private String message;

    public void setMessage(String message) {
        this.message = message;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public String getMessage() {
        return message;
    }

    public int getId() {
        return id;
    }

    public Test getTest() {
        return test;
    }

    public int getMin() {
        return min;
    }

    public int getMax() {
        return max;
    }
}
