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
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Selectează un ziar:</h1>
	<br />
	<form action="m1_Ziar.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Selectează</b></td>
				<td><b>Id</b></td>
				<td><b>Nume</b></td>
				<td><b>Adresa</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("ziare");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idziar");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getString("nume")%></td>
				<td><%= rs.getString("adresa")%></td>
				<%
                    }
				%>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Modifică linia">
		</p>
	</form>
	<%
    jb.disconnect();
 %>
	
	<br />
	<p align="center">
		<a href="index.html"><b>Pagina principală</b></a> <br />
	</p>
</body>
</html>
