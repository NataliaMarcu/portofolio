<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adaugă ziar</title>
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
            String Nume = request.getParameter("nume");
            String Adresa = request.getParameter("adresa");
            if (Nume != null) {
                jb.connect();
                jb.adaugaZiar(Nume, Adresa);
                jb.disconnect();
        %>
	<h1 align="center"><em>Datele au fost adăugate cu succes!</em></h1>
	<p align = "center"><strong><em><font size ="5" >Alege ce vrei să faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Ziare.jsp"><b>Mergi la tabela ziare</b></a>
	</p>	
	<p align="center">
		<a href="sterge_Ziar.jsp"><b>Șterge un ziar</b></a>	
	</p>	
	<%
        } else {
        %>
           <br />
             <br />
                <br />
             <br />
	<h1>Adaugă un nou ziar</h1>
	<form action="nou_Ziar.jsp" method="post">
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
		<input type="submit" value="Adaugă" />
	</form>
	 <br>
         <br />
          <br />
           <br />
            <br />
             <br />

	<%
            }
        %>
	<br />	
		<p align="center">	
		 <a href="index.html"><b>Pagina principală</b></a>
	</p>
	<br />
</body>
</html>
