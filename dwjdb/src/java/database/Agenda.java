package database;

import java.sql.*; 

public class Agenda { 
    private Connection con;
    private PreparedStatement ps; 
    private ResultSet rs;
    
    public void setConexao(Connection con) { 
        this.con = con; 
    }
    
    public boolean inserir(String nome, char sexo, int dia_niver, int mes_niver, String fone) { 
        try { 
            int id = gerarId(); 
            ps = con.prepareStatement("INSERT INTO agenda VALUES (?, ?, ?, ?, ?, ?)"); 
            ps.setInt(1, id); 
            ps.setString(2, nome); 
            ps.setString(3, String.valueOf(sexo)); 
            ps.setInt(4, dia_niver); 
            ps.setInt(5, mes_niver); 
            ps.setString(6, fone); 
            ps.executeUpdate();
            return true; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    } 
    
    public int gerarId() { 
        String novoId;
        try { 
            ps = con.prepareStatement("SELECT MAX(id) as novoid FROM agenda"); 
            rs = ps.executeQuery(); 
            rs.next();  
            
            novoId = rs.getString("novoid");
            
            if (novoId == null) 
                return 1; 
            else 
                return Integer.parseInt(novoId) + 1; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return 0; 
        }
    } 
    
    public boolean atualizar(int id, String nome, char sexo, int dia_niver, int mes_niver, String fone) {
        try { 
            ps = con.prepareStatement("UPDATE agenda SET nome = ?, sexo = ?,  dia_niver = ?,  mes_niver = ?,  fone = ? WHERE id = ?");
            ps.setString(1, nome); 
            ps.setString(2, String.valueOf(sexo)); 
            ps.setInt(3, dia_niver); 
            ps.setInt(4, mes_niver); 
            ps.setString(5, fone); 
            ps.setInt(6, id); 
            ps.executeUpdate();
            return true; 
        } catch (Exception e) { 
            e.printStackTrace(); 
            return false; 
        } 
    }    
    
    public boolean excluir(int id) { 
        try { 
            ps = con.prepareStatement("DELETE FROM agenda WHERE id = ?"); 
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
            ps = con.prepareStatement("SELECT * FROM agenda"); 
            rs = ps.executeQuery(); 
            return rs;     
        } catch (Exception e) { 
            e.printStackTrace(); 
            return null; 
        } 
    }
} 