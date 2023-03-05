<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sterge Ziar</title>
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
            String[] s = request.getParameterValues("primarykey");
	  		if(s != null){
            jb.connect();
            jb.stergeDateTabela(s, "ziare", "idziar");
            jb.disconnect();
        %>
	<h1 align="center"><em>Datele au fost șterse cu succes!</em></h1>
	<br />
	<div >
		<p align = "center"><strong><em><font size ="5" >Alege ce vrei să faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Ziare.jsp"><b>Mergi la tabela ziare</b></a>
	</p>
	<p align="center">
		<a href="nou_Ziar.jsp"><b>Adaugă un nou ziar</b></a>
	</p>	
	<p align="center">	
		 <a href="index.html"><b>Mergi la pagina principală</b></a>
	</p>
	</div>
 <%
	  		} else {
 %>
 <br />
 <br />
 <br />
 <br />
 <br />
  <br />
 <br />
 <br />
 <br />
 <br />
  <br />
 <br />
 <br />
 	<h1 align="center">Trebuie să selectați cel puțin o linie pe care doriți să o ștergeți înainte să apăsați butonul "Șterge liniile marcate"!</h1>
	<br />
	<div >
	<p align="center">
		<a href="tabela_Ziare.jsp"><b>Înapoi la pagină</b></a>
	</p>
	</div>
	
	<%
	  		}
	%>
 
</body>
</html>
