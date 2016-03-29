package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Answer {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Question question;

    private String text;
    private Boolean is_correct;

    @OneToMany(mappedBy = "answer")
    private final List<ResponseDetails> responseDetails = new ArrayList<ResponseDetails>();

    public void setId(int id) {
        this.id = id;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setIs_correct(Boolean is_correct) {
        this.is_correct = is_correct;
    }

    public int getId() {
        return id;
    }

    public Question getQuestion() {
        return question;
    }

    public String getText() {
        return text;
    }

    public Boolean getIs_correct() {
        return is_correct;
    }

    public List<ResponseDetails> getResponseDetails() {
        return responseDetails;
    }
}
