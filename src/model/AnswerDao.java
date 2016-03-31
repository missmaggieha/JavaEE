package model;

import jdbc.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AnswerDao {

    private Connection conn;
    public AnswerDao(){

        conn = DBConnection.getConnection();
    }

    public void addAnswer(Answer answer){
        try {
            String sql = "INSERT INTO ANSWER(IS_CORRECT, TEXT, QUESTION_ID)" + "VALUES(?,?,?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setBoolean(1,answer.getIs_correct());
            ps.setString(2,answer.getText());
            ps.setInt(3,answer.getQuestion().getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeAnswer(int answerId){
        try {

            String sql = "DELETE FROM ANSWER WHERE ID = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, answerId);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void removeAnswerByQuestionID(int questionId){
        try {

            String sql = "DELETE FROM ANSWER WHERE QUESTION_ID = ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, questionId);

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void editAnswer(Answer answer){
        try {

            String sql = "UPDATE ANSWER SET IS_CORRECT = ?, TEXT = ?, QUESTION_ID = ? where id = ?;";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setBoolean(1,answer.getIs_correct());
            ps.setString(2,answer.getText());
            ps.setInt(3,answer.getQuestion().getId());
            ps.setInt(4, answer.getId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List getAllAnswers(){

        List answers = new ArrayList();
        try {
            String sql = "SELECT * FROM ANSWER";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Answer answer = new Answer();

                answer.setIs_correct(rs.getBoolean("is_correct"));
                answer.setText(rs.getString("text"));
                answer.setId(rs.getInt("ID"));

                answer.setQuestion(new Question());
                answer.getQuestion().setId(rs.getInt("question_id"));

                answers.add(answer);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
    }

    public Answer getAnswerById(int answerId){

        Answer answer = new Answer();
        try {
            String sql = "SELECT * FROM ANSWER WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, answerId);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                answer.setIs_correct(rs.getBoolean("is_correct"));
                answer.setText(rs.getString("text"));
                answer.setId(rs.getInt("ID"));

                answer.setQuestion(new Question());
                answer.getQuestion().setId(rs.getInt("question_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answer;
    }

    public ArrayList<Answer> getAnswerByQuestionId(int questionId){
        ArrayList<Answer> answers = new ArrayList<Answer>();
        Answer answer = new Answer();
        try {
            String sql = "SELECT * FROM ANSWER WHERE QUESTION_ID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, questionId);
            ResultSet rs = ps.executeQuery();


            if(rs.next()){
                answer.setIs_correct(rs.getBoolean("is_correct"));
                answer.setText(rs.getString("text"));
                answer.setId(rs.getInt("ID"));

                answer.setQuestion(new Question());
                answer.getQuestion().setId(questionId);

                answers.add(answer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return answers;
    }
}