package Controller;

import DAO.AbonatiDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Abonati;
import DAOImpl.AbonatiDaoImpl;

public class AbonatiController extends HttpServlet {

	Abonati abonati = new Abonati();
	AbonatiDaoImpl abonatiDaoImpl = new AbonatiDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaAbonati") != null) {
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			String adresa = request.getParameter("adresa");
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date datanasterii = null;
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}

			abonati.setNume(nume);
			abonati.setPrenume(prenume);
			abonati.setAdresa(adresa);
			abonati.setDatanasterii(datanasterii);
			abonatiDaoImpl.adaugaAbonati(abonati);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonati.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaAbonati") != null) {
			List<Abonati> listaAbonati = new ArrayList();
			listaAbonati = abonatiDaoImpl.afiseazaAbonati();
			request.setAttribute("listaAbonati", listaAbonati);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Abonati.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaAbonati") != null) {
			Long id1 = Long.parseLong(request.getParameter("idabonat"));
			String nume = request.getParameter("nume");
			String prenume = request.getParameter("prenume");
			String adresa = request.getParameter("adresa");
			
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date datanasterii = null;
			try {
				datanasterii = df.parse(request.getParameter("datanasterii"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			abonatiDaoImpl.modificaAbonati(id1, nume, prenume, adresa, datanasterii);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonati.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeAbonati") != null) {
			Long id2 = Long.parseLong(request.getParameter("idabonat"));
			abonati.setIdabonat(id2);
			abonatiDaoImpl.stergeAbonati(abonati);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonati.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>
}
