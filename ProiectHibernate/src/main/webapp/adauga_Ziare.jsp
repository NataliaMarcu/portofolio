<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ziare</title>
        <link rel="stylesheet" href="stiluri.css">
    </head>
    <body>
 	<br />
 	 <br />
            <h1> Adauga un nou ziar </h1>
            <form action="ZiareController" method="GET">
               <br />
                <br />
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
		<input type="submit" name="adaugaZiare" value="Adauga ziarul" />
	</form>
<br />
        <form action="ZiareController" method="POST">
            <input type="submit" name="afiseazaZiare" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
         <br />
          <br />
           <br />
            <br />
             <br />
        <a href="index.html"><b>Pagina principala</b></a>
    </body>
</html>
