package jdbc;

/**
 * Created by david on 24/03/16.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnection {
    private static Connection conn = null;
    public static Connection getConnection(){
        if(conn != null){
            return conn;
        }
        else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                //String dbURL = "jdbc:sqlite::resource:res/communUrbaine1.sqlite";
                String url = "jdbc:mysql://zenit.senecac.on.ca/dps904_161a20";
                String user = "dps904_161a20";
                String passwd = "ksLW8525";

                conn = DriverManager.getConnection(url,user,passwd);

            } catch (ClassNotFoundException cne) {
                System.out.println("***Driver***");
                cne.printStackTrace();
            } catch (SQLException e) {
                System.out.println("***SQLException***");
                System.out.println(e);
            }

            return conn;
        }
    }
}
