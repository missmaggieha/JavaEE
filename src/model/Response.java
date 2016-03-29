package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
public class Response {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @ManyToOne
    @JoinColumn(nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Test test;

    @Column(nullable = false)
    private int score;
    private Date date_submitted;

    @OneToMany(mappedBy = "response")
    private final List<ResponseDetails> responseDetails = new ArrayList<ResponseDetails>();

    public int getId() {
        return id;
    }

    public User getUser() {
        return user;
    }

    public Test getTest() {
        return test;
    }

    public int getScore() {
        return score;
    }

    public Date getDate_submitted() {
        return date_submitted;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void setDate_submitted(Date date_submitted) {
        this.date_submitted = date_submitted;
    }

    public List<ResponseDetails> getResponseDetails() {
        return responseDetails;
    }
}

