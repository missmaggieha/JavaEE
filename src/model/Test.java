package model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Test {
    @Id
    @GeneratedValue(strategy = GenerationType.TABLE)
    private int id;

    @Column(nullable = false)
    private String name;
    private String description;

    @OneToMany(mappedBy = "test")
    private final List<Question> questions = new ArrayList<Question>();

    @OneToMany(mappedBy = "test")
    private final List<Response> responses = new ArrayList<Response>();

    @OneToMany(mappedBy = "test")
    private final List<Message> messages = new ArrayList<Message>();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public List<Response> getResponses() {
        return responses;
    }

    public List<Message> getMessages() {
        return messages;
    }
}
