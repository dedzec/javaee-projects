package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Usuario {
    private Connection con;
    private PreparedStatement ps; 
    private ResultSet rs;
    private String nome;
    
    public void setConexao(Connection con) { 
        this.con = con; 
    }
    
    public boolean adicionar(String nome, String senha) { 
        try { 
            ps = con.prepareStatement("INSERT INTO usuario(nome, senha) VALUES (?, ?)"); 
            ps.setString(1, nome); 
            ps.setString(2, senha); 
            ps.executeUpdate();
            return true;
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }
    
    public ResultSet listar() { 
        try { 
            ps = con.prepareStatement("SELECT * FROM usuario"); 
            rs = ps.executeQuery(); 
            return rs;     
        } catch (Exception e) { 
            e.printStackTrace(); 
            return null; 
        } 
    }
    
    public int autenticar(String nome, String senha) {
        int qtde;      
        try {       
            ps = con.prepareStatement("SELECT nome, COUNT(*) as qtde FROM usuario " +              
                                      "WHERE nome = ? and senha = ?");   
            ps.setString(1, nome);   
            ps.setString(2, senha);   
            rs = ps.executeQuery();   
            rs.next();    
            
            qtde = rs.getInt("qtde");   
            
            if (qtde == 1) {      
                this.nome = rs.getString("nome");
            }  
            
            return qtde;      
        } catch (Exception e) {       
            e.printStackTrace();       
            return -1;      
        }   
    }
    
    public String getNome() {     
        return nome;    
    }
}
