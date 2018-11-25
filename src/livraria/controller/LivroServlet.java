package livraria.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livraria.util.ConectaDB;

@WebServlet(name = "livro", urlPatterns = "/livro")
public class LivroServlet extends HttpServlet {

	private Connection conn;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String autor = req.getParameter("autor");
		String editora = req.getParameter("editora");
		String area = req.getParameter("area");
		int quantidade = Integer.parseInt(req.getParameter("quantidade"));
		String preco = req.getParameter("preco");

				
		conn = ConectaDB.getConnection();
		String sql = "INSERT INTO livro (nome,autor,editora,area,quantidade,preco) VALUES (?,?,?,?,?,?)";

		PreparedStatement stmt;
		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, nome);
			stmt.setInt(2, buscaAutorFK(autor));
			stmt.setInt(3, buscaEditoraFK(editora));
			stmt.setInt(4, buscaAreaFK(area));
			stmt.setInt(5, quantidade);
			stmt.setString(6, preco);
			stmt.executeUpdate();
			stmt.close();
			resp.sendRedirect("/trabalhofinaldw2-livraria/index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ConectaDB.close(conn);
	}

	//retorna o id correspondente ao autor selecionado
	protected int buscaAutorFK(String nomeAutor) throws SQLException {
		conn = ConectaDB.getConnection();
		
		int autorFK;
		
		String sql = "SELECT id FROM autor WHERE nome='" + nomeAutor + "'";

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {
			return autorFK = rs.getInt("id");
		} else
			return 0;
	}
	
	//retorna o id correspondente ao editora selecionado
		protected int buscaEditoraFK(String nomeEditora) throws SQLException {
			conn = ConectaDB.getConnection();
			
			int editoraFK;
			
			String sql = "SELECT id FROM editora WHERE nome='" + nomeEditora + "'";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return editoraFK = rs.getInt("id");
			} else
				return 0;
		}
		
		//retorna o id correspondente ao area selecionado
		protected int buscaAreaFK(String nomeArea) throws SQLException {
			conn = ConectaDB.getConnection();
			
			int areaFK;
			
			String sql = "SELECT id FROM area WHERE nome='" + nomeArea + "'";

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return areaFK = rs.getInt("id");
			} else
				return 0;
		}

}
