<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="model.Manga, model.Autor, model.Editora, javax.servlet.http.HttpSession, java.util.List"%>
<%
	HttpSession sessao = request.getSession();
	sessao.setAttribute("opc", 3);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

<title>Wiki Mang�s</title>
</head>
<body id="body-alterar">
	<jsp:include page="menuAdmin.jsp"></jsp:include>
	<div class="container-fluid" style="margin-top: -200px">
		<h2>
			<b>Alterar Mang�</b>
		</h2>
	</div>
	<%
		List<Manga> list = (List<Manga>) sessao.getAttribute("MANGAS");
		Manga m = null;
		for (Manga ml : list) {
			if ((Integer.parseInt(request.getParameter("id"))) == ml.getId()) {
				m = ml;
			}
		}
		if (sessao.getAttribute("msg") != null) {
	%>
	<div class="col-lg-12">
		<h3 class="alert alert-primary"><%=sessao.getAttribute("msg")%></h3>
	</div>
	<%
		sessao.removeAttribute("msg");
		}
	%>
	<jsp:include page="./MangaController"></jsp:include>
	<form id="form-cadastro" action="./MangaController" method="post">
		<div class="row">
			<div class="container-fluid col-sm-6">
				<div class="form-group ">
					<label for="inputTitulo"><b>ID</b></label> <input name="id"
						type="text" class="form-control" value="<%=m.getId()%>" readonly>
				</div>
				<div class="form-group ">
					<label for="inputTitulo"><b>T�tulo</b></label> <input name="titulo"
						type="text" class="form-control" id="inputTitulo"
						value="<%=m.getTitulo()%>">
				</div>
				<div class="form-group ">
					<label for="inputGenero"><b>G�nero</b></label> <input name="genero"
						type="text" class="form-control" id="inputGenero"
						value="<%=m.getGenero()%>">
				</div>

				<div class="form-group ">
					<label for="inputAutor"><b>Autor</b></label> <select name="autor"
						id="inputAutor" class="form-control">
						<option selected value="<%=m.getAutor().getId()%>"><%=m.getAutor().getNome()%></option>
						<%
							List<Autor> listA = (List<Autor>) sessao.getAttribute("AUTORES");
							for (Autor a : listA) {
						%>
						<option value="<%=a.getId()%>"><%=a.getNome()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="form-group ">
					<label id="campo" for="inputEditora"><b>Editora</b></label> <select
						name="editora" id="inputEditora" class="form-control">
						<option selected value="<%=m.getEditora().getId()%>"><%=m.getEditora().getEditora()%></option>
						<%
							List<Editora> listE = (List<Editora>) sessao.getAttribute("EDITORAS");
							for (Editora e : listE) {
						%>
						<option value="<%=e.getId()%>"><%=e.getEditora()%></option>
						<%
							}
						%>
					</select>
				</div>
				<div class="form-group ">
					<label for="inputVolume"><b>Volume</b></label> <input type="number"
						class="form-control" name="volume" min="1"
						value="<%=m.getVolume()%>">
				</div>
			</div>
			<div class="container-fluid col-sm-6">
				<div class="form-group">
					<label for="inputlancamento"><b>Data de Lan�amento</b></label> <input
						name="data" type="text" class="form-control" id="inputlancamento"
						value="<%=m.getDt_lancamento()%>">
				</div>
				<div class="form-group ">
					<label for="inputState"><b>Status</b></label> <select name="status"
						id="inputStatus" class="form-control">
						<option selected><%=m.getStatus()%></option>
						<option>Em Andamento</option>
						<option>Completo</option>
						<option>Hiatus</option>
						<option>Abandonado</option>
					</select>
				</div>
				<div class="form-group ">
					<label for="inputLink"><b>Link</b></label> <input name="link"
						type="url" class="form-control" id="inputlink"
						value="<%=m.getLink()%>">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary btn-default">Alterar</button>

	</form>

</body>
</html>