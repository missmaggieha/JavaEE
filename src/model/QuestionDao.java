package model;

import com.mysql.jdbc.Statement;
import jdbc.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class QuestionDao {
	
	private Connection conn;
	public QuestionDao(){
		
		conn = DBConnection.getConnection();
	}

	public int addQuestion(Question question){
		try {
			String sql = "INSERT INTO QUESTION(DIFFICULTY, EXPLANATION, QUESTION, TYPE, TEST_ID)" + "VALUES(?,?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1,question.getDifficulty());
			ps.setString(2,question.getExplanation());
			ps.setString(3,question.getQuestion());
			ps.setInt(4, question.getType());
			ps.setInt(5, 0);

			ps.executeUpdate();
			int id = -1;
			ResultSet rs = ps.getGeneratedKeys();
			if (rs != null && rs.next()) {
				id = rs.getInt(1);
			}
			return id;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public void removeQuestion(int questionId){
		try {

			String sql = "DELETE FROM QUESTION WHERE ID = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, questionId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editQuestion(Question question){
		try {

			String sql = "UPDATE QUESTION SET DIFFICULTY = ?, EXPLANATION = ?, QUESTION = ?, TYPE = ?, TEST_ID = ? where id = ?;";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, question.getDifficulty());
			ps.setString(2, question.getExplanation());
			ps.setString(3, question.getQuestion());
			ps.setInt(4, question.getType());
			ps.setInt(5, question.getTest().getId());
			ps.setInt(6, question.getId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List getAllQuestions(){

		List questions = new ArrayList();
		try {
			String sql = "SELECT * FROM QUESTION";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				Question question = new Question();

				question.setDifficulty(rs.getInt("difficulty"));
				question.setExplanation(rs.getString("explanation"));
				question.setQuestion(rs.getString("question"));
				question.setId(rs.getInt("ID"));
				question.setType(rs.getInt("type"));

				question.setTest(new Test());
				question.getTest().setId(rs.getInt("test_id"));

				questions.add(question);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}

	public Question getQuestionById(int questionId){

		Question question = new Question();
		try {
			String sql = "SELECT * FROM QUESTION WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, questionId);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				question.setDifficulty(rs.getInt("difficulty"));
				question.setExplanation(rs.getString("explanation"));
				question.setQuestion(rs.getString("question"));
				question.setId(rs.getInt("ID"));
				question.setType(rs.getInt("type"));

				question.setTest(new Test());
				question.getTest().setId(rs.getInt("test_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return question;
	}

	public List getQuestionsByTestId(int testId){

		List questions = new ArrayList();
		try {
			String sql = "SELECT * FROM QUESTION WHERE ID IN (SELECT QUESTION_ID FROM TEST_QUESTION WHERE TEST_ID = ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, testId);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				Question question = new Question();

				question.setDifficulty(rs.getInt("difficulty"));
				question.setExplanation(rs.getString("explanation"));
				question.setQuestion(rs.getString("question"));
				question.setId(rs.getInt("ID"));
				question.setType(rs.getInt("type"));

				question.setTest(new Test());
				question.getTest().setId(rs.getInt("test_id"));

				questions.add(question);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questions;
	}
}