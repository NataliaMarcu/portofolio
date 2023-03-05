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
	<h1 align="center">Modificările au fost efectuate cu succes!</h1>
	<br />
	<p align = "center"><strong><em><font size ="5" >Alege ce vrei sa faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Ziare.jsp"><b>Mergi la tabela ziare</b></a>
	</p>
	<p align="center">
		<a href="nou_Ziar.jsp"><b>Adaugă un nou ziar</b></a>
	</p>	
	<p align="center">
		<a href="sterge_Ziar.jsp"><b>Șterge un ziar</b></a>	
	</p>	
	<p align="center">	
		 <a href="index.html"><b>Pagina principală</b></a>
	</p>
	<%
            jb.connect();
            Long aux = java.lang.Long.parseLong(request.getParameter("idziar"));
            String Nume = request.getParameter("nume");
            String Adresa = request.getParameter("adresa");

            String[] valori = {Nume, Adresa};
            String[] campuri = {"nume", "adresa"};
            jb.modificaTabela("ziare", "idziar", aux, campuri, valori);
            jb.disconnect();
        %>
</body>
</html>
