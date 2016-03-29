package model;

import com.mysql.jdbc.*;
import jdbc.DBConnection;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
	
	private Connection conn;
	public UserDao(){
		
		conn = DBConnection.getConnection();
	}

	public void addUser(User user){
		try {
			String sql = "INSERT INTO USER(EMAIL,PASSWORD, NAME, ROLE)" + "VALUES(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1,user.getEmail());
			ps.setString(2,user.getPassword());
			ps.setString(3,user.getName());
			ps.setInt(4, user.getRole());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void removeUser(int userId){
		try {

			String sql = "DELETE FROM USER WHERE ID = ?";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setInt(1, userId);

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editUser(User user){
		try {

			String sql = "UPDATE USER SET email = ?, name = ?, role = ? where id = ?;";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ps.setString(2, user.getName());
			ps.setInt(3, user.getRole());
			ps.setInt(4, user.getId());

			ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List getAllUsers(){

		List users = new ArrayList();
		try {
			String sql = "SELECT * FROM USER";

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while(rs.next()){

				User user = new User();
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setRole(rs.getInt("role"));
				user.setId(rs.getInt("ID"));

				users.add(user);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

	public User getUserById(int userId){

		User user = new User();
		try {
			String sql = "SELECT * FROM USER WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setRole(rs.getInt("role"));
				user.setId(rs.getInt("ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

    public boolean CkeckUser(User user) throws SQLException {
		boolean ok = false;

		try {
			String sql = "SELECT * FROM USER WHERE email = ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getEmail());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if (rs.getString("password").equals(user.getPassword())) {
					user.setName(rs.getString("name"));
					user.setRole(rs.getInt("role"));
					user.setId(rs.getInt("ID"));

					ok = true;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

    	return ok;
    }
}