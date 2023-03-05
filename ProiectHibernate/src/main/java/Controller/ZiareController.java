package Controller;

import DAO.ZiareDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Ziare;
import DAOImpl.ZiareDaoImpl;

public class ZiareController extends HttpServlet {

	Ziare ziare = new Ziare();
	ZiareDaoImpl ziareDaoImpl = new ZiareDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaZiare") != null) {
			String nume = request.getParameter("nume");
			String adresa = request.getParameter("adresa");
			ziare.setNume(nume);
			ziare.setAdresa(adresa);
			ziareDaoImpl.adaugaZiare(ziare);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Ziare.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaZiare") != null) {
			List<Ziare> listaZiare = new ArrayList();
			listaZiare = ziareDaoImpl.afiseazaZiare();
			request.setAttribute("listaZiare", listaZiare);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Ziare.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaZiare") != null) {
			Long id1 = Long.parseLong(request.getParameter("idziar"));
			String nume = request.getParameter("nume");
			String adresa = request.getParameter("adresa");
			ziareDaoImpl.modificaZiare(id1, nume, adresa);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Ziare.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeZiare") != null) {
			Long id2 = Long.parseLong(request.getParameter("idziar"));
			ziare.setIdziar(id2);
			ziareDaoImpl.stergeZiare(ziare);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Ziare.jsp");
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
