package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Livro {
    private Connection con;
    private PreparedStatement ps; 
    private ResultSet rs;
    
    public void setConexao(Connection con) { 
        this.con = con; 
    }
    
    public boolean adicionar(String titulo, String autor, int ano, float preco, int idEditora) {
        try { 
            ps = con.prepareStatement("INSERT INTO livro(titulo, autor, ano, preco, idEditora) VALUES (?, ?, ?, ?, ?)"); 
            ps.setString(1, titulo); 
            ps.setString(2, autor); 
            ps.setInt(3, ano); 
            ps.setFloat(4, preco); 
            ps.setInt(5, idEditora); 
            ps.executeUpdate();
            return true;
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }
    
    public boolean alterar(int id, String titulo, String autor, int ano, float preco, int idEditora) {
        try { 
            ps = con.prepareStatement("UPDATE livro SET titulo = ?, autor = ?, ano = ?, preco = ?, idEditora = ? WHERE id = ?");
            ps.setString(1, titulo); 
            ps.setString(2, autor); 
            ps.setInt(3, ano); 
            ps.setFloat(4, preco); 
            ps.setInt(5, idEditora); 
            ps.setInt(6, id); 
            ps.executeUpdate();
            return true; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }
    
    public boolean alterar_foto(int id, String path) {
        System.out.println(id);
        System.out.println(path);
        try { 
            ps = con.prepareStatement("UPDATE livro SET foto = ? WHERE id = ?");
            ps.setString(1, path); 
            ps.setInt(2, id); 
            ps.executeUpdate();
            return true; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }
    
    public boolean excluir(int id) { 
        try { 
            ps = con.prepareStatement("DELETE FROM livro WHERE id = ?"); 
            ps.setInt(1, id); 
            ps.executeUpdate();
            return true; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }
    
    public ResultSet listar() { 
        try { 
            ps = con.prepareStatement("SELECT a.*, b.nome, b.cidade FROM livro AS a INNER JOIN editora AS b ON a.idEditora = b.id"); 
            rs = ps.executeQuery(); 
            return rs;     
        } catch (Exception e) { 
            e.printStackTrace(); 
            return null; 
        } 
    }
    
    public ResultSet pesquisar(String titulo) { 
        try { 
            ps = con.prepareStatement("SELECT a.*, b.nome, b.cidade FROM livro AS a INNER JOIN editora AS b ON a.idEditora = b.id WHERE a.titulo LIKE ?"); 
            ps.setString(1, "%" + titulo + "%");
            rs = ps.executeQuery(); 
            return rs;     
        } catch (Exception e) { 
            e.printStackTrace(); 
            return null; 
        }
    }
}
