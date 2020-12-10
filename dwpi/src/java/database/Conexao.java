package database;

import java.sql.*;
import java.sql.DriverManager;

public class Conexao {
    Connection con;
    
    public boolean conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/db_dados","root","root");
            return true;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        } 
    }
    
    public void fechar() {
        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public Connection getConexao() {
        return con;
    }
}