<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abonati</title>
<link rel="stylesheet" href="stiluri.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
            $(document).ready(function () {
                $("#stergeAbonati").hide();
                $("#modificaAbonati").hide();

                $("#update").click(function () {
                    $("#modificaAbonati").show();
                    $("#stergeAbonati").hide();
                });
                $("#delete").click(function () {
                    $("#stergeAbonati").show();
                    $("#modificaAbonati").hide();
                });
            });
        </script>

</head>
<body>
	<h1 align="center">Abonati</h1>
	<table border="1" align="center">
		<tr>
			<td><b>Id Abonat</b></td>
			<td><b>Nume</b></td>
			<td><b>Prenume</b></td>
			<td><b>Adresa</b></td>
			<td><b>Data nasterii</b></td>
		</tr>
		<c:forEach var="abonati" items="${listaAbonati}">
			<tr>
				<td>${abonati.idabonat}</td>
				<td>${abonati.nume}</td>
				<td>${abonati.prenume}</td>
				<td>${abonati.adresa}</td>
				<td>${abonati.datanasterii}</td>

			</tr>
		</c:forEach>
	</table>
	<form action="AbonatiController" method="POST">
		<p align="center">
			Modifica: <input type="checkbox" id="update"> Sterge: <input
				type="checkbox" id="delete"
				onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('adresa').disabled = this.checked;
                        document.getElementById('datanasterii').disabled = this.checked;"><br>
			<br> <select name="idabonat">
				<c:forEach items="${listaAbonati}" var="abonati">
					<option value="${abonati.idabonat}">${abonati.idabonat}</option>
				</c:forEach>
			</select> <br>
			<div>
			<p>
				<p align="center">Nume</p>
				<p><input type="text" name="nume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Prenume</p>
				<p><input type="text" name="prenume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Adresa</p>
				<p><input type="text" name="adresa" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Data Nasterii</p>
				<p><input type="date" name="datanasterii" required="required" size="30" /></p>
			</p>
			</div>
			<button type="submit" id="modificaAbonati" name="modificaAbonati">
				Modifica</button>
			<br> <br>
			<button type="submit" id="stergeAbonati" name="stergeAbonati">
				Sterge</button>
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Pagina principala</b></a>
	</p>
</body>
</html>
