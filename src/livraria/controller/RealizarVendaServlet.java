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

import livraria.model.NotaFiscal;
import livraria.util.ConectaDB;

@WebServlet(name = "venda", urlPatterns = "/venda")
public class RealizarVendaServlet extends HttpServlet {
	NotaFiscal nf = new NotaFiscal();
	Connection conn;
	String sql;
	Statement stmt;
	ResultSet rs;
	PreparedStatement pstm;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nome = req.getParameter("nome");
		String endereco = req.getParameter("endereco");
		String livro = req.getParameter("livro");
		int quantidade = Integer.parseInt(req.getParameter("quantidade"));
		String pagamento = req.getParameter("pagamento");
		String preco = "00.00";
		int nroNF = nf.nroNF();
		int nroFatura = nf.nroFatura();

		// Validando o valor da nota
		conn = ConectaDB.getConnection();

		sql = "SELECT preco FROM livro WHERE nome='" + livro + "'";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				preco = rs.getString("preco");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		double valornota = nf.valorNota(quantidade, preco);

		// Inserindo o cliente na base
		sql = "INSERT INTO cliente (nome,endereco) VALUES" + "(?,?)";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nome);
			pstm.setString(2, endereco);
			pstm.executeUpdate();
			pstm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Pegando o id FK do cliente
		int fk_cliente = 0;
		sql = "SELECT id FROM cliente WHERE nome='" + nome + "'";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				fk_cliente = rs.getInt("id");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Inserindo nota fiscal na base
		sql = "INSERT INTO notafiscal (cliente,numerofatura,numeronf,qntlivros,valornota) VALUES" + "(?,?,?,?,?)";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, fk_cliente);
			pstm.setInt(2, nroFatura);
			pstm.setInt(3, nroNF);
			pstm.setInt(4, quantidade);
			pstm.setString(5, Double.toString(valornota));
			pstm.executeUpdate();
			pstm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Atualizando a base do cliente com as FKs
		int fk_nf = 0;
		sql = "SELECT id FROM notafiscal WHERE numeronf='" + nroNF + "'";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				fk_nf = rs.getInt("id");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		// Inserindo nota fiscal na base e redirecionando o usuario
		sql = "UPDATE cliente SET nfs = '" + fk_nf + "' WHERE id='" + fk_cliente + "'";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.executeUpdate();
			pstm.close();
			resp.sendRedirect("/trabalhofinaldw2-livraria/index.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
