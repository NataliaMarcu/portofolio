<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abonamente</title>
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center"><strong><em><font size ="10" >Abonamente</font></em></strong></h1>
	<br />
	<form action="sterge_Abonament.jsp" method="post">
		<table border="1" align="center">
			<tr>
				<td><b>Selectează</b></td>
				<td><b>Id Abonament</b></td>
				<td><b>Id Ziar</b></td>
				<td><b>Nume Ziar</b></td>
				<td><b>Adresa Ziar</b></td>
				<td><b>Id Abonat</b></td>
				<td><b>Nume Abonat</b></td>
				<td><b>Prenume Abonat</b></td>
				<td><b>Adresa Abonat</b></td>
				<td><b>Data Nașterii</b></td>
				<td><b>Data Abonament</b></td>
				<td><b>Data Expirare Abonament</b></td>
				<td><b>Tip Abonament</b></td>
				<td><b>Suma</b></td>
			</tr>
			<%
                    jb.connect();
                    ResultSet rs = jb.vedeAbonament();
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idabonament");
                %>
			<tr>
				<td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
				<td><%= x%></td>
				<td><%= rs.getLong("idziar")%></td>
				<td><%= rs.getString("NumeZiar")%></td>
				<td><%= rs.getString("AdresaZiar")%></td>
				<td><%= rs.getInt("idabonat")%></td>
				<td><%= rs.getString("NumeAbonat")%></td>
				<td><%= rs.getString("PrenumeAbonat")%></td>
				<td><%= rs.getString("AdresaAbonat")%></td>
				<td><%= rs.getString("datanasterii")%></td>
				<td><%= rs.getDate("data_abonament")%></td>
				<td><%= rs.getDate("data_expirare_abonament")%></td>
				<td><%= rs.getString("tip_abonament")%></td>
				<td><%= rs.getString("suma")%></td>
				<%
                        }
                    %>
			</tr>
		</table>
		<br />
		<p align="center">
			<input type="submit" value="Șterge liniile marcate">
		</p>
	</form>
	<%
            rs.close();
            jb.disconnect();
        %>
	<br />
	        <p align="center"><a href="nou_Abonament.jsp"><b>Adaugă</b></a> </p>
            <p align="center"><a href="modifica_Abonament.jsp"><b>Modifică</b></a>
            <br/>
        </p>
        <p align="center">
            <a href="index.html"><b>Pagina principală</b></a>
            <br/>
        </p>
</body>
</html>
