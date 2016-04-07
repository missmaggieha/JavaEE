package model;

import jdbc.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class TestDao {
	
	private Connection conn;
	public TestDao(){
		
		conn = DBConnection.getConnection();
	}

	public void addTest(Test test){
		try {
			String sql = "INSERT INTO TEST(DESCRIPTION, NAME)" + "VALUES(?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,test.getDescription());
			ps.setString(2,test.getName());

			ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();

			if(rs.next()){
				int testId = rs.getInt(1);
				// different difficulty types
				int[] difficulties = {1,2,3};
				// 5 easy, 3 medium and 2 hard questions in each test
				int[] numOfQuestions = {5,3,2};

				for(int i = 0; i < 3; i++) {

					sql = "SELECT ID FROM QUESTION WHERE DIFFICULTY = " + difficulties[i] + " ORDER BY RAND() LIMIT " + numOfQuestions[i];
					ps = conn.prepareStatement(sql);
					rs = ps.executeQuery();

					while(rs.next()){

						sql = "INSERT INTO TEST_QUESTION(TEST_ID, QUESTION_ID)" + "VALUES(?,?)";

						ps = conn.prepareStatement(sql);

						ps.setInt(1,testId);
						ps.setInt(2,rs.getInt(1));

						ps.executeUpdate();
					}
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void removeTest(int testId){
		try {

			String sql = "DELETE FROM TEST WHERE ID = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, testId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editTest(Test test){
		try {

			String sql = "UPDATE TEST SET description = ?, name = ? where id = ?;";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, test.getDescription());
			ps.setString(2, test.getName());
			ps.setInt(3, test.getId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List getAllTests(){

		List tests = new ArrayList();
		try {
			String sql = "SELECT * FROM TEST";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				Test test = new Test();
				test.setDescription(rs.getString("description"));
				test.setName(rs.getString("name"));
				test.setId(rs.getInt("ID"));

				tests.add(test);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tests;
	}

	public Test getTestById(int testId){

		Test test = new Test();
		try {
			String sql = "SELECT * FROM TEST WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, testId);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				test.setDescription(rs.getString("description"));
				test.setName(rs.getString("name"));
				test.setId(rs.getInt("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return test;
	}

	public void saveTestResult(int testId, int userId, int score){
		try {
			String sql = "INSERT INTO RESPONSE(DATE_SUBMITTED, SCORE, TEST_ID, USER_ID)" + "VALUES(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setDate(1, new java.sql.Date(Calendar.getInstance().getTime().getTime()));
			ps.setInt(2, score);
			ps.setInt(3, testId);
			ps.setInt(4, userId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int getTestResult(int userId, int testId) {
		int testResult = -1;

		try {
			//String sql = "INSERT INTO RESPONSE(DATE_SUBMITTED, SCORE, TEST_ID, USER_ID)" + "VALUES(?,?,?,?)";
			String sql = "SELECT SCORE FROM RESPONSE WHERE USER_ID = ? AND TEST_ID = ? LIMIT 1";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, userId);
			ps.setInt(2, testId);

			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				testResult = rs.getInt("score");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return testResult;
	}
}