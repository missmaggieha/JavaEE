package model;

import javax.persistence.*;

@Entity(name="RESPONSE_DETAILS")
public class ResponseDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Response response;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Question question;

    @ManyToOne
    @JoinColumn(nullable = false)
    private Answer answer;

    @ManyToOne
    public Answer getAnswer() {
        return answer;
    }

    public int getId() {
        return id;
    }

    @ManyToOne
    public Response getResponse() {
        return response;
    }

    @ManyToOne
    public Question getQuestion() {
        return question;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setResponse(Response response) {
        this.response = response;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public void setAnswer(Answer answer) {
        this.answer = answer;
    }
}