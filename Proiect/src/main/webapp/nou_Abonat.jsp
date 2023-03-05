<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adaugă abonat</title>
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
            String Nume = request.getParameter("nume");
            String Prenume = request.getParameter("prenume");
            String Adresa = request.getParameter("adresa");
            String DataNasterii = request.getParameter("datanasterii");
            if (Nume != null) {
                jb.connect();
                jb.adaugaAbonat(Nume, Prenume, Adresa, DataNasterii);
                jb.disconnect();
        %>
		<h1 align="center"><em>Datele au fost adăugate cu succes!</em></h1>
	<p align = "center"><strong><em><font size ="5" >Alege ce vrei să faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Abonati.jsp"><b>Mergi la tabela abonați</b></a>
	</p>	
	<p align="center">
		<a href="sterge_Abonat.jsp"><b>Șterge un abonat</b></a>	
	</p>	
	<%
        } else {
        %>
	<h1>Adaugă un nou abonat</h1>
	<form action="nou_Abonat.jsp" method="post">
		<div>
			<p>
				<p align="center">Nume:</p>
				<p><input type="text" name="nume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Prenume:</p>
				<p><input type="text" name="prenume" required="required" size="30" /></p>
			</p>
			<p>
				<p align="center">Adresa:</p>
				<p><input type="text" name="adresa" required="required" size="30" /></p>
			</p>
			<p>
				<p align="center">Data Nașterii:</p>
				<p><input type="date" name="datanasterii" required="required" size="30" /></p>
			</p>
		</div>
		<input type="submit" value="Adaugă" />
	</form>
	<%
            }
        %>
	<br />
	<a href="index.html"><b>Pagina principală</b></a>
	<br />
</body>
</html>
