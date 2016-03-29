package model;

import jdbc.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
}