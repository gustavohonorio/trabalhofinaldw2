<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@	page import="java.sql.Connection"%>
<%@	page import="java.sql.ResultSet"%>
<%@	page import="java.sql.SQLException"%>
<%@	page import="java.sql.Statement"%>
<%@ page import="livraria.util.ConectaDB"%>
<%@ page import="livraria.controller.LivroServlet"%>

<%
	Connection conn;
	String sql;
	Statement stmt;
	ResultSet rs;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Trabalho final de DW2">
<meta name="author"
	content="Gustavo Honorio, Fernando Henrique, Vinicius Dourado">

<title>Livraria LêAí - Seja bem vindo</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="dist/css/sist-livraria.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="vendor/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

</head>
<body>

	<div class="container">


		<br>
		<div class="form-group">
			<label for="exampleInputEmail1">Seja bem vindo ao sistema</label><br>
			<small id="emailHelp" class="form-text text-muted">Selecione
				uma opção abaixo</small>
		</div>
		<button class="btn btn-primary" data-toggle="modal"
			data-target="#cadastrarLivro">Cadastrar Livros</button>
		<button class="btn btn-primary" data-toggle="modal"
			data-target="#listarLivro">Listar Livros</button>
		<button class="btn btn-primary" data-toggle="modal"
			data-target="#removerLivro">Remover Livros</button>
		<br> <br>
		<button class="btn btn-success" data-toggle="modal"
			data-target="#cadastrarAutor">Cadastrar Autores</button>
		<button class="btn btn-success" data-toggle="modal"
			data-target="#listarAutor">Listar Autores</button>
		<button class="btn btn-success" data-toggle="modal"
			data-target="#removerAutor">Remover Autores</button>
		<br> <br>
		<button class="btn btn-warning" data-toggle="modal"
			data-target="#cadastrarEditora">Cadastrar Editoras</button>
		<button class="btn btn-warning" data-toggle="modal"
			data-target="#listarEditora">Listar Editoras</button>
		<button class="btn btn-warning" data-toggle="modal"
			data-target="#removerEditora">Remover Editoras</button>
		<br> <br>
		<button class="btn btn-danger" data-toggle="modal"
			data-target="#realizarVenda">Realizar Vendas</button>

	</div>

	<!-- MODAL REALIZAR VENDA -->
	<div class="modal fade" id="realizarVenda" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Realizar venda</h5>

				</div>
				<div class="modal-body">
					<form method="POST" action=venda>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome do cliente</label> <input
										class="form-control" name="nome" type="text"
										required="required">
								</div>
								<div class="col-md-6">
									<label for="endereco">Endereço do cliente</label> <input
										class="form-control" name="endereco" type="text">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-3">
									<label for="livro">Livro</label> <select class="form-control"
										required="required" name="livro">
										<option selected="selected"></option>
										<%
											String pesqLivro;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM livro";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												pesqLivro = rs.getString("nome");
										%>
										<option><%=pesqLivro%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
								<!-- <div class="col-md-3">
									<label for="autor">Autor</label> <input class="form-control"
										name="Autor" type="text" disabled>
								</div>

								<div class="col-md-6">
									<label for="editora">Editora</label> <input
										class="form-control" name="editora" type="text" disabled>
								</div> -->
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="preco">Preço</label> <input class="form-control"
										name="preco" type="text" placeholder="R$" disabled>
								</div>
								<div class="form-group col-md-6">
									<label for="quantidade">Quantidade</label> <select
										class="form-control" required="required" name="quantidade">
										<option>1</option>
										<option>2</option>
										<option>3</option>
									</select>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="formaPagamento">Forma de pagamento</label> <select
										class="form-control" required="required" name="pagamento">
										<option>A vista</option>
										<option>2x sem juros</option>
										<option>3x sem juros</option>
									</select>
								</div>
								<!-- <div class="form-group col-md-6">
									<label for="quantidade">Situação</label><input type="text"
										class="form-control" id="" placeholder="LIVRO EM ESTOQUE"
										name="disponivel" disabled>
								</div> -->
							</div>
						</div>
						<br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-warning">Cadastrar
									venda</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>


	<!-- LIVROS -->
	<!-- MODAL CADASTRAR LIVRO -->
	<div class="modal fade" id="cadastrarLivro" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cadastrar livro</h5>

				</div>
				<div class="modal-body">
					<form method="POST" action=livro>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <input class="form-control"
										name="nome" type="text" required="required">
								</div>
								<div class="col-md-6">
									<label for="endereco">Autor</label><select class="form-control"
										required="required" name="autor">
										<option selected="selected"></option>
										<%
											String autor;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM autor";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												autor = rs.getString("nome");
										%>
										<option><%=autor%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-3">
									<label for="idade">Editora</label> <select class="form-control"
										required="required" name="editora">
										<option selected="selected"></option>
										<%
											String editora;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM editora";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												editora = rs.getString("nome");
										%>
										<option><%=editora%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
								<div class="col-md-3">
									<label for="autor">Area</label> <select class="form-control"
										required="required" name="area">
										<option selected="selected"></option>
										<%
											String area;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM area";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												area = rs.getString("nome");
										%>
										<option><%=area%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>

								<div class="col-md-6">
									<label for="editora">Quantidade</label> <input
										class="form-control" name="quantidade" type="number">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="preco">Preço</label> <input class="form-control"
										name="preco" type="text" placeholder="R$">
								</div>

							</div>
						</div>
						<br> <br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-warning">Cadastrar
									livro</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL LISTAR LIVRO -->
	<div class="modal fade" id="listarLivro" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Listar livro</h5>

				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nome</th>
								<th scope="col">Autor</th>
								<th scope="col">Editora</th>
								<th scope="col">Area</th>
								<th scope="col">Preco</th>
								<th scope="col">Quantidade</th>
							</tr>
						</thead>
						<tbody>
							<%
								int idLivro;
								String nomeLivro;
								int autorLivroFK;
								/* String autorLivroNome; */
								int editoraLivroFK;
								int areaLivroFK;
								String precoLivro;
								int quantidadeLivro;
								LivroServlet l = new LivroServlet();

								conn = ConectaDB.getConnection();

								sql = "SELECT * FROM livro";

								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
									idLivro = rs.getInt("id");
									nomeLivro = rs.getString("nome");
									autorLivroFK = rs.getInt("autor");
									editoraLivroFK = rs.getInt("editora");
									areaLivroFK = rs.getInt("area");
									precoLivro = rs.getString("preco");
									quantidadeLivro = rs.getInt("quantidade");
							%>
							<tr>
								<th scope="row"><%=idLivro%></th>
								<td><%=nomeLivro%></td>
								<td><%=autorLivroFK%></td>
								<td><%=editoraLivroFK%></td>
								<td><%=areaLivroFK%></td>
								<td><%=precoLivro%></td>
								<td><%=quantidadeLivro%></td>
							</tr>
							<%
								}
								stmt.close();
								rs.close();
								ConectaDB.close(conn);
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL REMOVER LIVRO -->
	<div class="modal fade" id="removerLivro" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Remover livro</h5>

				</div>
				<div class="modal-body">
					<form method="GET" action="livro">
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <select class="form-control"
										required="required" name="nome">
										<option selected="selected"></option>
										<%
											String livroRemover;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM livro";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												livroRemover = rs.getString("nome");
										%>
										<option><%=livroRemover%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
							</div>
						</div>
						<br>
						<!-- <div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="preco">Preço</label> <input class="form-control"
										name="preco" type="text" placeholder="R$" disabled>
								</div>
								<br>
								<div class="form-group col-md-6">
									<label for="quantidade">Quantidade</label> <select
										class="form-control" required="required" name="quantidade"
										disabled>
										<option>1</option>
										<option>2</option>
										<option>3</option>
									</select>
								</div>
							</div>
						</div> -->
						<br> <br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Voltar</button>
								<button type="submit" class="btn btn-warning">Remover</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>


	<!-- AUTORES -->
	<!-- MODAL CADASTRAR AUTOR -->
	<div class="modal fade" id="cadastrarAutor" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cadastrar autor</h5>

				</div>
				<div class="modal-body">
					<form method="POST" action=autor>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <input class="form-control"
										name="nome" type="text" required="required">
								</div>
								<div class="col-md-6">
									<label for="endereco">Endereco</label><input
										class="form-control" name="endereco" type="text"
										required="required">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-3">
									<label for="idade">Livros</label> <select class="form-control"
										required="required" name="livro" disabled>
										<option selected></option>
										<option>Livro 1</option>
										<option>Livro 2</option>
										<option>Livro 3</option>
										<option>. . .</option>
									</select>
								</div>
							</div>
						</div>
						<br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-warning">Cadastrar
									Autor</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL LISTAR AUTOR -->
	<div class="modal fade" id="listarAutor" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Listar livro</h5>

				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nome</th>
								<th scope="col">Endereco</th>
							</tr>
						</thead>
						<tbody>
							<%
								int idAutor;
								String nomeAutor;
								String enderecoAutor;

								conn = ConectaDB.getConnection();

								sql = "SELECT * FROM autor";

								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
									idAutor = rs.getInt("id");
									nomeAutor = rs.getString("nome");
									enderecoAutor = rs.getString("endereco");
							%>
							<tr>
								<th scope="row"><%=idAutor%></th>
								<td><%=nomeAutor%></td>
								<td><%=enderecoAutor%></td>
							</tr>
							<%
								}
								stmt.close();
								rs.close();
								ConectaDB.close(conn);
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL REMOVER AUTOR-->
	<div class="modal fade" id="removerAutor" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Remover autor</h5>

				</div>
				<div class="modal-body">
					<form method="GET" action="autor">
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <select class="form-control"
										required="required" name="nome">
										<option selected="selected"></option>
										<%
											String autorRemover;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM autor";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												autorRemover = rs.getString("nome");
										%>
										<option><%=autorRemover%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Voltar</button>
								<button type="submit" class="btn btn-warning">Remover</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>


	<!-- EDITORAS -->
	<!-- MODAL CADASTRAR EDITORA -->
	<div class="modal fade" id="cadastrarEditora" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Cadastrar
						Editora</h5>

				</div>
				<div class="modal-body">
					<form method="POST" action=editora>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <input class="form-control"
										name="nome" type="text" required="required">
								</div>
								<div class="col-md-6">
									<label for="endereco">Endereco</label><input
										class="form-control" name="endereco" type="text"
										required="required">
								</div>
							</div>
						</div>
						<br>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-3">
									<label for="livros">Livros</label> <select class="form-control"
										required="required" name="livro" disabled>
										<option selected></option>
										<option>Livro 1</option>
										<option>Livro 2</option>
										<option>Livro 3</option>
										<option>. . .</option>
									</select>
								</div>
							</div>
						</div>
						<br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancelar</button>
								<button type="submit" class="btn btn-warning">Cadastrar
									Editora</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL LISTAR EDITORA -->
	<div class="modal fade" id="listarEditora" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Listar Editora</h5>

				</div>
				<div class="modal-body">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nome</th>
								<th scope="col">Endereco</th>
							</tr>
						</thead>
						<tbody>
							<%
								int idEditora;
								String nomeEditora;
								String enderecoEditora;

								conn = ConectaDB.getConnection();

								sql = "SELECT * FROM editora";

								stmt = conn.createStatement();
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
									idEditora = rs.getInt("id");
									nomeEditora = rs.getString("nome");
									enderecoEditora = rs.getString("endereco");
							%>
							<tr>
								<th scope="row"><%=idEditora%></th>
								<td><%=nomeEditora%></td>
								<td><%=enderecoEditora%></td>
							</tr>
							<%
								}
								stmt.close();
								rs.close();
								ConectaDB.close(conn);
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>

	<!-- MODAL REMOVER EDITORA-->
	<div class="modal fade" id="removerEditora" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Remover editora</h5>

				</div>
				<div class="modal-body">
					<form method="GET" action=editora>
						<div class="form-group">
							<div class="form-row">
								<div class="col-md-6">
									<label for="nome">Nome</label> <select class="form-control"
										required="required" name="nome">
										<option selected="selected"></option>
										<%
											String editoraRemover;

											conn = ConectaDB.getConnection();

											sql = "SELECT nome FROM editora";

											stmt = conn.createStatement();
											rs = stmt.executeQuery(sql);
											while (rs.next()) {
												editoraRemover = rs.getString("nome");
										%>
										<option><%=editoraRemover%></option>
										<%
											}
											rs.close();
											stmt.close();
											ConectaDB.close(conn);
										%>
									</select>
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>

						<div class="form-group">
							<div class="modal-footer">
								<button type="reset" class="btn btn-secondary">Redefinir</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Voltar</button>
								<button type="submit" class="btn btn-warning">Remover</button>
							</div>
						</div>

					</form>
				</div>
			</div>
		</div>

	</div>


	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>