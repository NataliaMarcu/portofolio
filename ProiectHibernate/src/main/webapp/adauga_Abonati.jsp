<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Abonati</title>
<link rel="stylesheet" href="stiluri.css">
</head>
<body>
 <br />
  <br />
		<h1>Adauga un nou abonat</h1>
		<form action="AbonatiController" method="GET">
			 <br />
			<div>
			<p>
				<p align="center">Nume</p>
				<p><input type="text" name="nume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Prenume</p>
				<p><input type="text" name="prenume" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Adresa</p>
				<p><input type="text" name="adresa" required="required" size="40" /></p>
			</p>
			<p>
				<p align="center">Data Nasterii</p>
				<p><input type="date" name="datanasterii" required="required" size="30" /></p>
			</p>
			
		</div>
					<input type="submit" name="adaugaAbonati" value="Adauga">
		</form>
<br />
	<form action="AbonatiController" method="POST">
		<input type="submit" name="afiseazaAbonati" value="Afiseaza">
		&nbsp; &nbsp;<br>
	</form>
	<br>
	 <br />
	  <br />
	   <br />
	<a href="index.html"><b>Pagina principala</b></a>
</body>
</html>
