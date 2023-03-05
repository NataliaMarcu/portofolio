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
	<h1 align="center">Modifică</h1>
	<br />
	<%
            jb.connect();
            String NumeZiar, adresa, NumeAbonat, PrenumeAbonat, AdresaAbonat, datanasterii, data_abonament, data_expirare_abonament, tip_abonament, suma;

            Long aux = java.lang.Long.parseLong(request.getParameter("primarykey"));
            ResultSet rs = jb.intoarceAbonamenteId(aux);
            rs.first();
            int id1 = rs.getInt("idziar_abonament");
            int id2 = rs.getInt("idabonat_abonament");

            NumeZiar = rs.getString("NumeZiar");
            adresa = rs.getString("adresa");
            NumeAbonat = rs.getString("NumeAbonat");
            PrenumeAbonat = rs.getString("PrenumeAbonat");
            AdresaAbonat = rs.getString("AdresaAbonat");
            datanasterii = rs.getString("datanasterii");
            data_abonament = rs.getString("data_abonament");
            data_expirare_abonament = rs.getString("data_expirare_abonament");
            tip_abonament = rs.getString("tip_abonament");
            suma = rs.getString("suma");
            

            ResultSet rs1 = jb.vedeTabela("ziare");
            ResultSet rs2 = jb.vedeTabela("abonati");
            Long idziar, idabonat;


        %>
	<form action="m2_Abonament.jsp" method="post">
		<div>
			<p>
				<p align="center">Id Abonament:</p>
				<p><input type="text" name="idabonament" size="30"
					value="<%= aux%>" readonly /></p>
			</p>
			<p>
				<p align="center">Id Ziar:</p>
				<p><SELECT NAME="idziar">
						<%
                                while (rs1.next()) {
                                    idziar = rs1.getLong("idziar");
                                    NumeZiar = rs1.getString("nume");
                                    adresa = rs1.getString("adresa");
                                    if (idziar != id1) {
                            %>
						<OPTION VALUE="<%= idziar%>"><%= idziar%>,
							<%= NumeZiar%>,
							<%= adresa%></OPTION>
						<%
                                        } else {
                                %>
						<OPTION selected="yes" VALUE="<%= idziar%>"><%= idziar%>,
							<%= NumeZiar%>,
							<%= adresa%></OPTION>
						<%
                                        }
                                    }
                                %>
				</SELECT></p>
			</p>
			<p>
				<p align="center">Id Abonat:</p>
				<p><SELECT NAME="idabonat">
						<%
                                while (rs2.next()) {
                                    idabonat = rs2.getLong("idabonat");
                                    NumeAbonat = rs2.getString("nume");
                                    PrenumeAbonat = rs2.getString("prenume");
                                    AdresaAbonat = rs2.getString("adresa");
                                    datanasterii = rs2.getString("datanasterii");
                            if (idabonat != id2) {
                            %>
						<OPTION VALUE="<%= idabonat%>"><%= idabonat%>,
							<%= NumeAbonat%>,
							<%= PrenumeAbonat%>,
							<%= AdresaAbonat%>,
							<%= datanasterii%></OPTION>
						<%
                                        } else {
                                %>
						<OPTION selected="yes" VALUE="<%= idabonat%>"><%= idabonat%>,
							<%= NumeAbonat%>,
							<%= PrenumeAbonat%>,
							<%= AdresaAbonat%>,
							<%= datanasterii%></OPTION>
						<%
                                        }
                                    }
                                %>
				</SELECT></p>
			</p>
			<p>
				<p align="center">Data Abonament:</p>
				<p><input type="date" name="data_abonament" size="30"
					value="<%= data_abonament%>" /></p>
			</p>
			<p>
				<p align="center">Data Expirare Abonament:</p>
				<p><input type="date" name="data_expirare_abonament" size="30"
					value="<%= data_expirare_abonament%>" /></p>
			</p>
			<p>
				<p align="center">Tip Abonament:</p>
				<p><input type="text" name="tip_abonament" size="30"
					value="<%= tip_abonament%>" /></p>
			</p>
			<p>
				<p align="center">Suma:</p>
				<p><input type="number" name="suma" size="30"
					value="<%= suma%>" /></p>
			</p>
		</div>
		<p align="center">
			<input type="submit" value="Modifică linia">
		</p>
	</form>
	<p align="center"">
		<a href="index.html"><b>Pagina principală</b></a> <br />
</body>
<%
        rs.close();
        rs1.close();
        rs2.close();
        jb.disconnect();
    %>
</html>
