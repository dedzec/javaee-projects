package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Editora {
    private Connection con;
    private PreparedStatement ps; 
    private ResultSet rs;
    
    public void setConexao(Connection con) { 
        this.con = con; 
    }
    
    public boolean adicionar(String nome, String cidade) { 
        try { 
            ps = con.prepareStatement("INSERT INTO editora(nome, cidade) VALUES (?, ?)"); 
            ps.setString(1, nome); 
            ps.setString(2, cidade); 
            ps.executeUpdate();
            return true;
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    } 
    
    public ResultSet listar() { 
        try { 
            ps = con.prepareStatement("SELECT * FROM editora"); 
            rs = ps.executeQuery(); 
            return rs;     
        } catch (Exception e) { 
            e.printStackTrace(); 
            return null; 
        } 
    }
}