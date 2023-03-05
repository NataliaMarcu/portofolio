<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ziare</title>
<link rel="stylesheet" href="stiluri.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
            $(document).ready(function () {
                $("#stergeZiare").hide();
                $("#modificaZiare").hide();

                $("#update").click(function () {
                    $("#modificaZiare").show();
                    $("#stergeZiare").hide();
                });
                $("#delete").click(function () {
                    $("#stergeZiare").show();
                    $("#modificaZiare").hide();
                });
            });
        </script>

</head>
<body>
 <br />
	<h1 align="center">Ziare</h1>
	 <br />
	  <br />
	<table border="1" align="center">
		<tr>
			<td><b>Id</b></td>
			<td><b>Nume</b></td>
			<td><b>Adresa</b></td>
		</tr>
		<c:forEach var="ziare" items="${listaZiare}">
			<tr>
				<td>${ziare.idziar}</td>
				<td>${ziare.nume}</td>
				<td>${ziare.adresa}</td>

			</tr>
		</c:forEach>
	</table>
	<form action="ZiareController" method="POST">
		<p align="center">
			Modifica: <input type="checkbox" id="update"> Sterge: <input
				type="checkbox" id="delete"
				onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('adreasa').disabled = this.checked;"><br>
			<br> <select name="idziar">
				<c:forEach items="${listaZiare}" var="ziare">
					<option value="${ziare.idziar}">${ziare.idziar}</option>
				</c:forEach>
			</select> <br>
			<div>
			<p>
				<p align="center">Nume:</p>
				<p><input type="text" name="nume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Adresa:</p>
				<p><input type="text" name="adresa" required="required" size="40" /></p>
			</p>
		</div>
			<button type="submit" id="modificaZiare" name="modificaZiare">
				Modifica</button>
			<br> <br>
			<button type="submit" id="stergeZiare" name="stergeZiare">
				Sterge</button>
		</p>
	</form>
	<p align="center">
		<a href="index.html"><b>Pagina principala</b></a>
	</p>
</body>
</html>
