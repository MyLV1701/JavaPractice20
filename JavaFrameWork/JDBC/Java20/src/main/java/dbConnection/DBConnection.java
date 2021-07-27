package dbConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    static String conString = "jdbc:mysql://localhost:3306/java20"
			+ "?useUnicode=true&characterEncoding=UTF-8";
	static final String USER_NAME = "root";
	static final String PASSWORD = "Mydonghung$17";

    private static Connection connection;

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(conString, USER_NAME, PASSWORD);
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
        }

    }

    public static Connection GET_CONNECTION(){

        try {
            if(connection == null || connection.isClosed()){

                connection = DriverManager.getConnection(conString, USER_NAME, PASSWORD);
            }
        } catch (Exception e) {
            //TODO: handle exception
            e.printStackTrace();
        }
        return connection;
    }

    public static void  LOST_CONNECTION(){
        try {
            connection.close();

        } catch (Exception e) {
            //TODO: handle exception

            e.printStackTrace();
        }
    }
}
