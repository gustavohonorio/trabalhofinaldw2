package livraria.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import livraria.util.ConectaDB;

public class Logon {
	
	private String usuario;
	private String senha;
	private Connection conn;
	
	//gatters and setters
	public void setUsuario(String usuario){
		this.usuario=usuario;
	}
	public String getUsuario() {
		return usuario;
	}
	
	public void setSenha(String senha) {
		this.senha=senha;
	}
	public String getSenha() {
		return senha;
	}
	
	//persist
	public void persist() throws SQLException {
		conn = ConectaDB.getConnection();
		
		String sql = "INSERT INTO logon (usuario,senha) VALUES (?,?)";
		
		PreparedStatement stmt=conn.prepareStatement(sql);
		stmt.setString(1, usuario);
		stmt.setString(2, senha);
		stmt.executeUpdate();
		stmt.close();
		ConectaDB.close(conn);
	}
	
	//busca usuario
	public int busca(String usuario, String senha) throws SQLException {
		conn = ConectaDB.getConnection();
		
		String sql = "SELECT * FROM logon WHERE usuario='"+usuario+"' AND senha='"+senha+"'";
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if(rs.next()) {
			return 1;
		}else
			return 0;
		
		
	}
	
	//permissão
	public int acess(String usuario, String senha) throws SQLException {
		if(busca(usuario,senha)!=1) {
			return 0;
		}else
			return 1;
	}

}
