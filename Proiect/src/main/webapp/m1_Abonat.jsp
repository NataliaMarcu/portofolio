<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifică abonat</title>
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Modifică</h1>
	<br />
	<%
            jb.connect();
            Long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("abonati", "idabonat", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Prenume = rs.getString("prenume");
            String Adresa = rs.getString("adresa");
            String DataNasterii = rs.getString("datanasterii");
            rs.close();
            jb.disconnect();
        %>
	<form action="m2_Abonat.jsp" method="post">
		<div>
			<p>
				<p align="center">Id Abonat:</p>
				<p><input type="text" name="idabonat" size="30"
					value="<%= aux%>" readonly /></p>
			</p>
			<p>
				<p align="center">Nume:</p>
				<p><input type="text" name="nume" size="30" value="<%= Nume%>" /></p>
			</p>
			<p>
				<p align="center">Prenume:</p>
				<p><input type="text" name="prenume" size="30"
					value="<%= Prenume%>" /></p>
			</p>
			<p>
				<p align="center">Adresa:<p>
				<p><input type="text" name="adresa" size="30"
					value="<%= Adresa%>" /></td>
			</p>
			<p>
				<p align="center">Data Nașterii:</p>
				<p><input type="date" name="datanasterii" size="30"
					value="<%= DataNasterii%>" /></p>
			</p>
		</div>
		<p align="center">
			<input type="submit" value="Modifică linia">
		</p>
	</form>
	<p align="center"">
		<a href="index.html"><b>Pagina principală</b></a> <br />
</body>
</html>
