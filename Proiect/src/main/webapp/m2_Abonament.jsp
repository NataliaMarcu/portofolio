<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifică Abonament</title>
<link rel="stylesheet" href="stil.css">
<link href="table.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<h1 align="center">Modificările au fost efectuate cu succes!</h1>
	<br />
	<p align = "center"><strong><em><font size ="5" >Alege ce vrei să faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Abonamente.jsp"><b>Mergi la tabela abonamente</b></a>
	</p>
	<p align="center">
		<a href="nou_Abonament.jsp"><b>Adaugă un nou abonament</b></a>
	</p>	
	<p align="center">
		<a href="sterge_Abonament.jsp"><b>Șterge un abonament</b></a>	
	</p>	
	<p align="center">	
		 <a href="index.html"><b>Mergi la pagina principală</b></a>
	</p>
	<%
	jb.connect();
	Long aux = java.lang.Long.parseLong(request.getParameter("idabonament"));
	String idziar = request.getParameter("idziar");
	String idabonat = request.getParameter("idabonat");
	String DataAbonament = request.getParameter("data_abonament");
	String DataExpirareAbonament = request.getParameter("data_expirare_abonament");
	String TipAbonament = request.getParameter("tip_abonament");
	String Suma = request.getParameter("suma");

	String[] valori = { idziar, idabonat, DataAbonament, DataExpirareAbonament, TipAbonament, Suma };

	String[] campuri = { "idziar", "idabonat", "data_abonament", "data_expirare_abonament", "tip_abonament", "suma" };
	jb.modificaTabela("abonamente", "idabonament", aux, campuri, valori);
	jb.disconnect();
	%>
</body>
</html>
