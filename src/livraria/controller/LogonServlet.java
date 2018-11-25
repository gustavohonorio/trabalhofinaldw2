package livraria.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livraria.model.Logon;

@WebServlet(name="logon", urlPatterns="/logon")
public class LogonServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String usuario = req.getParameter("usuario");
		String senha = req.getParameter("senha");
		
		Logon logon = new Logon();
		
		try {
			int retorno = logon.acess(usuario, senha);
			if(retorno!=1) {
				resp.sendRedirect("/trabalhofinaldw2-livraria/login.jsp");
			}else {
				resp.sendRedirect("/trabalhofinaldw2-livraria/index.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
