package livraria.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livraria.util.ConectaDB;

@WebServlet(name = "editora", urlPatterns = "/editora")
public class EditoraServlet extends HttpServlet {

	private Connection conn;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String endereco = req.getParameter("endereco");

		conn = ConectaDB.getConnection();

		String sql = "INSERT INTO editora (nome,endereco) VALUES (?,?)";

		PreparedStatement stmt;

		try {
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, nome);
			stmt.setString(2, endereco);
			stmt.executeUpdate();
			stmt.close();
			resp.sendRedirect("/trabalhofinaldw2-livraria/index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ConectaDB.close(conn);
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");

		conn = ConectaDB.getConnection();
		String sql = "DELETE FROM editora WHERE nome='" + nome + "'";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.execute();
			stmt.close();
			resp.sendRedirect("/trabalhofinaldw2-livraria/index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

		ConectaDB.close(conn);
	}
}
