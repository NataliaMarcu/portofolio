<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifică ziar</title>
<link rel="stylesheet" href="stil.css">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Modifică</h1>
	<br />
	<%
            jb.connect();
            Long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceLinieDupaId("ziare", "idziar", aux);
            rs.first();
            String Nume = rs.getString("nume");
            String Adresa = rs.getString("adresa");
            rs.close();
            jb.disconnect();
        %>
	<form action="m2_Ziar.jsp" method="post">
		<div>
			<p>
				<p align="center">Id:</p>
				<p><input type="text" name="idziar" size="40"
					value="<%= aux%>" readonly /></p>
			</p>
			<p>
				<p align="center">Nume:</p>
				<p><input type="text" name="nume" size="40" value="<%= Nume%>" /></p>
			</p>
			<p>
				<p align="center">Adresa:</p>
				<p><input type="text" name="adresa" size="40"
					value="<%= Adresa%>" /></p>
			</p>
		</div>
		<p align="center">
			<input type="submit" value="Modifică linia">
		</p>
	</form>
	   <br />
             <br />
	<p align="center">
		<a href="index.html"><b>Pagina principală</b></a> <br />
</body>
</html>
