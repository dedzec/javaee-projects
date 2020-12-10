package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
        
public class conecta {
    
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //Class.forName("org.gjt.mm.mysql.Driver");
            return DriverManager.getConnection("jdbc:mysql://localhost:3306/db_dados","root","root");   
        } catch(ClassNotFoundException e) {
            //throw new SQLException(e.getException());
            throw new SQLException(e.getMessage());
        }
    }
}
