<%@page import="DAOImpl.AbonatiDaoImpl"%>
<%@page import="DAOImpl.ZiareDaoImpl"%>
<%@page import="pojo.Ziare"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.Abonati"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abonamente</title>
<link rel="stylesheet" href="stiluri.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
            $(document).ready(function () {
                $("#stergeAbonamente").hide();
                $("#modificaAbonamente").hide();

                $("#update").click(function () {
                    $("#modificaAbonamente").show();
                    $("#stergeAbonamente").hide();
                });
                $("#delete").click(function () {
                    $("#stergeAbonamente").show();
                    $("#modificaAbonamente").hide();
                });
            });
        </script>

</head>
<body>
	<%
            ZiareDaoImpl ziareDaoImpl = new ZiareDaoImpl();
            AbonatiDaoImpl abonatiDaoImpl = new AbonatiDaoImpl();
            List<Ziare> listaZiare = new ArrayList();
            listaZiare = ziareDaoImpl.afiseazaZiare();
            List<Abonati> listaAbonati = new ArrayList();
            listaAbonati = abonatiDaoImpl.afiseazaAbonati();
            request.setAttribute("listaAbonati", listaAbonati);
            request.setAttribute("listaZiare", listaZiare);
        %>
	<h1 align="center">Abonamente</h1>
	<table border="1" align="center">
		<tr>
			<td><b>Id Abonament</b></td>
			<td><b>Id Ziar</b></td>
			<td><b>Nume</b></td>
			<td><b>Adresa</b></td>
			<td><b>IAbonat</b></td>
			<td><b>Nume</b></td>
			<td><b>Prenume</b></td>
			<td><b>Adresa</b></td>
			<td><b>Data Nasterii</b></td>
			<td><b>Data Abonament</b></td>
			<td><b>Data Expirare Abonament</b></td>
			<td><b>Tip Abonament</b></td>
			<td><b>Suma</b></td>
		</tr>
		<c:forEach var="abonamente" items="${listaAbonamente}">
			<tr>
				<td>${abonamente.idabonament}</td>
				<td>${abonamente.ziare.idziar}</td>
				<td>${abonamente.ziare.nume}</td>
				<td>${abonamente.ziare.adresa}</td>
				<td>${abonamente.abonati.idabonat}</td>
				<td>${abonamente.abonati.nume}</td>
				<td>${abonamente.abonati.prenume}</td>
				<td>${abonamente.abonati.adresa}</td>
				<td>${abonamente.abonati.datanasterii}</td>
				<td>${abonamente.dataAbonament}</td>
				<td>${abonamente.dataExpirareAbonament}</td>
				<td>${abonamente.tipAbonament}</td>
				<td>${abonamente.suma}</td>
			</tr>
		</c:forEach>
	</table>
	<form action="AbonamenteController" method="POST">
		<p align="center">
			Modifica: <input type="checkbox" id="update"> Sterge: <input
				type="checkbox" id="delete"
				onclick="document.getElementById('idziar').disabled = this.checked;
                        document.getElementById('idabonat').disabled = this.checked;
                        document.getElementById('dataAbonament').disabled = this.checked;
                        document.getElementById('dataExpirareAbonament').disabled = this.checked;
                        document.getElementById('tipAbonament').disabled = this.checked;
                        document.getElementById('suma').disabled = this.checked;"><br>
			<br> Id abonament <select name="idabonament">
				<c:forEach items="${listaAbonamente}" var="abonamente">
					<option value="${abonamente.idabonament}">${abonamente.idabonament}</option>
				</c:forEach>
			</select> <br>
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
			<button type="submit" id="modificaAbonamente"
				name="modificaAbonamente">Modifica</button>
			<br> <br>
			<button type="submit" id="stergeAbonamente" name="stergeAbonamente">
				Sterge</button>
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Home</b></a>
	</p>
</body>
</html>
