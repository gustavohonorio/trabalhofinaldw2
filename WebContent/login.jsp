<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="livraria.model.Logon" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Trabalho final de DW2">
<meta name="author"
	content="Gustavo Honorio, Fernando Henrique, Vinicius Dourado">

<title>Livraria L�A� - Seja bem vindo</title>

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
	<!-- LOGIN -->
<br><br>	
<div class="container">	

	<form method="POST" action=logon>
		<div class="form-group">
			<label>Logon</label>
			<input type="text" class="form-control" placeholder="Entre com seu usuario" name="usuario"> 
		</div>
		<div class="form-group">
			<label>Senha</label>
			<input type="password" class="form-control" placeholder="Entre com sua senha" name="senha"> <small
				class="form-text text-muted">Caso tenha esquecido seu logon / senha, entre 
				em contato com o administrador do sistema.</small>
		</div>
		<div class="form-group form-check">
			<input type="checkbox" class="form-check-input" id="exampleCheck1">
			<label class="form-check-label" for="exampleCheck1">Lembre-me</label>
		</div>
		<div class="form-group">
			<div class="modal-footer">
				<button type="reset" class="btn btn-secondary">Redefinir</button>				
				<button type="submit" class="btn btn-warning">Entrar</a>
			</div>
		</div>
	</form>
</div>

</body>
</html>