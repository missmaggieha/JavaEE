package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Question {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @JoinColumn(nullable = false)
    @ManyToOne
    private Test test;

    // Difficulties:
    // 1 - easy
    // 2 - medium
    // 3 - hard
    private int difficulty;

    @Column(nullable = false)
    // Types:
    // 1 - multiple choice multiple answer
    // 2 - multiple choice one answer
    // 3 - true or false
    // 4 - drop down question
    private int type;

    @Column(nullable = false)
    private String question;
    private String explanation;

    @OneToMany(mappedBy = "question")
    private final List<Answer> answers = new ArrayList<Answer>();

    @OneToMany(mappedBy = "question")
    private final List<ResponseDetails> responseDetails = new ArrayList<ResponseDetails>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @ManyToOne
    public Test getTest() {
        return test;
    }

    public void setTest(Test test) {
        this.test = test;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public int getType() {
        return type;
    }

    public String getQuestion() {
        return question;
    }

    public String getExplanation() {
        return explanation;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }

    public void setType(int type) {
        this.type = type;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setExplanation(String explanation) {
        this.explanation = explanation;
    }

    public List<Answer> getAnswers() {
        return answers;
    }

    public List<ResponseDetails> getResponseDetails() {
        return responseDetails;
    }
}

