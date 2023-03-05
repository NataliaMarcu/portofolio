<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java"
	import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Adaugă abonament</title>
<link rel="stylesheet" href="stil.css">
</head>
<jsp:useBean id="jb" scope="session" class="db.JavaBean" />
<jsp:setProperty name="jb" property="*" />
<body>
	<%
            Long idziar, idabonat; 
			Float suma;
            String id1, id2, NumeZiar, Adresa, NumeAbonat, PrenumeAbonat, AdresaAbonat, DataNasterii, DataAbonament, DataExpirareAbonament, TipAbonament, Suma;
            id1 = request.getParameter("idziar");
            id2 = request.getParameter("idabonat");
            DataAbonament = request.getParameter("data_abonament");
            DataExpirareAbonament = request.getParameter("data_expirare_abonament");
            TipAbonament = request.getParameter("tip_abonament");
            Suma = request.getParameter("suma");
            if (id1 != null) {
                jb.connect();
                jb.adaugaAbonamente(java.lang.Long.parseLong(id1), java.lang.Long.parseLong(id2), DataAbonament, DataExpirareAbonament, TipAbonament, java.lang.Float.parseFloat(Suma));
                jb.disconnect();
        %>
	<h1 align="center"><em>Datele au fost adăugate cu succes!</em></h1>
	<p align = "center"><strong><em><font size ="5" >Alege ce vrei să faci mai departe:</font></em></strong></p>
	<p align="center">
		<a href="tabela_Abonamente.jsp"><b>Mergi la tabela abonamente</b></a>
	</p>	
	<p align="center">
		<a href="sterge_Abonament.jsp"><b>Șterge un abonament</b></a>	
	</p>	
	<%
        } else {
        jb.connect();
        ResultSet rs1 = jb.vedeTabela("ziare");
        ResultSet rs2 = jb.vedeTabela("abonati");
        %>
	<h1>Adaugă un nou abonament</h1>
	<form action="nou_Abonament.jsp" method="post">
		<div>
			<p>
				<p align="center">Id Ziar:</p>
				<p>Selectati ziarul: <SELECT NAME="idziar">
						<%
                                    while(rs1.next()){
                                        idziar = rs1.getLong("idziar");
                                        NumeZiar = rs1.getString("nume");
                                        Adresa = rs1.getString("adresa");
                                %>
						<OPTION VALUE="<%= idziar%>"><%= idziar%>,<%= NumeZiar%>,<%= Adresa%></OPTION>
						<%
                                    }
                                %>
				</SELECT>

				</p>
			</p>
			<p>
				<p align="center">Id Abonat:</p>
				<p>Selectati abonatul: <SELECT NAME="idabonat">
						<!-- OPTION selected="yes" VALUE="iris1">Iris 1</OPTION -->
						<%
                                    while(rs2.next()){
                                        idabonat = rs2.getLong("idabonat");
                                        NumeAbonat = rs2.getString("nume");
                                        PrenumeAbonat = rs2.getString("prenume");
                                        AdresaAbonat = rs2.getString("adresa");
                                        DataNasterii = rs2.getString("datanasterii");
                                %>
						<OPTION VALUE="<%= idabonat%>"><%= idabonat%>,<%= NumeAbonat%>,<%= PrenumeAbonat%>,<%= AdresaAbonat%>,<%= DataNasterii%></OPTION>
						<%
                                    }
                                %>
				</SELECT>
				</p>
			</p>
			<p>
				<p align="center">Data Abonament:</p>
				<p><input type="date" name="data_abonament" required="required" size="30" /></p>
			</p>
			<p>
				<p align="center">Data Expirare Abonament:</p>
				<p><input type="date" name="data_expirare_abonament" required="required" size="30" /></p>
			</p>
			<p>
				<p align="center">Tip Abonament:</p>
				<p><input type="text" name="tip_abonament" required="required" size="30" /></p>
			</p>
			<p>
				<p align="center">Suma:</p>
				<p><input type="number" name="suma" required="required" size="30" /></p>
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
