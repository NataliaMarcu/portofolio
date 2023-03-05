<%@page import="DAOImpl.AbonatiDaoImpl"%>
<%@page import="DAOImpl.ZiareDaoImpl"%>
<%@page import="pojo.Abonati"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Ziare"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abonamente</title>
<link rel="stylesheet" href="stiluri.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>
	<%
        ZiareDaoImpl ziareDaoImpl = new ZiareDaoImpl();
        AbonatiDaoImpl abonatiDaoImpl = new AbonatiDaoImpl();
        List<Ziare> listaZiare = new ArrayList<Ziare>();
        listaZiare = ziareDaoImpl.afiseazaZiare();
        List<Abonati> listaAbonati = new ArrayList<Abonati>();
        listaAbonati = abonatiDaoImpl.afiseazaAbonati();
        request.setAttribute("listaZiare", listaZiare);
        request.setAttribute("listaAbonati", listaAbonati);
%>
		<h1>Adauga un nou abonament</h1>
		<form action="AbonamenteController" method="GET">
			<div>
				<p>
					<p>Ziar</p>
					<p><select name="idziar">
							<c:forEach items="${listaZiare}" var="ziare">
								<option value="${ziare.idziar}">${ziare.idziar},
									${ziare.nume}, ${ziare.adresa}</option>
							</c:forEach>
					</select></p>
				</p>
				<p>
					<p>Abonat</p>
					<p><select name="idabonat">
							<c:forEach items="${listaAbonati}" var="abonati">
								<option value="${abonati.idabonat}">${abonati.idabonat},
									${abonati.nume}, ${abonati.prenume}, ${abonati.adresa}, ${abonati.datanasterii}</option>
							</c:forEach>
					</select></p>
				</p>
				<p>
					<p>Data Abonamentului</p>
					<p><input type="text" name="dataAbonament"></p>
				</p>
				<p>
					<p>Data Expirarii Abonamentului</p>
					<p><input type="text" name="dataExpirareAbonament"></p>
				</p>
				<p>
					<p>Tipul Abonamentului</p>
					<p><input type="text" name="tipAbonament"></p>
				</p>
				<p>
					<p>Suma</p>
					<p><input type="number" name="suma" required="required"></p>
				</p>
				<p>
					<p><input type="submit" name="adaugaAbonamente"
						value="Adauga"></p>

				</p>
			</div>
		</form>
	</div>

	<form action="AbonamenteController" method="POST">
		<input type="submit" name="afiseazaAbonamente" value="Afiseaza">
		&nbsp; &nbsp;<br>
	</form>
	<br>
	<a href="index.html"><b>Pagina principala</b></a>
</body>
</html>
