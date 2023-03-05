package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pojo.Ziare;
import pojo.Abonati;
import pojo.Abonamente;
import DAOImpl.AbonamenteDaoImpl;
import DAOImpl.HibernateUtil;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Session;

public class AbonamenteController extends HttpServlet {

	Abonamente abonamente = new Abonamente();
	AbonamenteDaoImpl abonamenteDaoImpl = new AbonamenteDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("adaugaAbonamente") != null) {
			// preluarea parametrilor de interes
			Long idziar = java.lang.Long.parseLong(request.getParameter("idziar"));
			Long idabonat = java.lang.Long.parseLong(request.getParameter("idabonat"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Ziare ziare = (Ziare) session.get(Ziare.class, idziar);
			Abonati abonati = (Abonati) session.get(Abonati.class, idabonat);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dataAbonament = null;
			try {
				dataAbonament = df.parse(request.getParameter("dataAbonament"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dataExpirareAbonament = null;
			try {
				dataExpirareAbonament = df1.parse(request.getParameter("dataExpirareAbonament"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String tipAbonament = request.getParameter("tipAbonament");
			Float suma = java.lang.Float.parseFloat(request.getParameter("suma"));

			abonamente.setZiare(ziare);
			abonamente.setAbonati(abonati);
			abonamente.setDataAbonament(dataAbonament);
			abonamente.setDataExpirareAbonament(dataExpirareAbonament);
			abonamente.setTipAbonament(tipAbonament);
			abonamente.setSuma(suma);

			abonamenteDaoImpl.adaugaAbonamente(abonamente);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonamente.jsp");
			rd.forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("afiseazaAbonamente") != null) {
			List<Abonamente> listaAbonamente = new ArrayList();
			listaAbonamente = abonamenteDaoImpl.afiseazaAbonamente();
			request.setAttribute("listaAbonamente", listaAbonamente);
			RequestDispatcher rd = request.getRequestDispatcher("tabela_Abonamente.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("modificaAbonamente") != null) {
			Long id1 = Long.parseLong(request.getParameter("idabonament"));
			// preluarea parametrilor de interes
			Long idziar = java.lang.Long.parseLong(request.getParameter("idziar"));
			Long idabonat = java.lang.Long.parseLong(request.getParameter("idabonat"));
			Session session = HibernateUtil.getSessionFactory().openSession();
			Ziare ziare = (Ziare) session.get(Ziare.class, idziar);
			Abonati abonati = (Abonati) session.get(Abonati.class, idabonat);

			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date dataAbonament = null;
			try {
				dataAbonament = df.parse(request.getParameter("dataAbonament"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			Date dataExpirareAbonament = null;
			try {
				dataExpirareAbonament = df1.parse(request.getParameter("dataExpirareAbonament"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			String tipAbonament = request.getParameter("tipAbonament");
			Float suma = Float.parseFloat(request.getParameter("suma"));

			abonamenteDaoImpl.modificaAbonamente(id1, ziare, abonati, dataAbonament, dataExpirareAbonament, tipAbonament, suma);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonamente.jsp");
			rd.forward(request, response);

		}

		if (request.getParameter("stergeAbonamente") != null) {
			Long id2 = Long.parseLong(request.getParameter("idabonament"));
			abonamente.setIdabonament(id2);
			abonamenteDaoImpl.stergeAbonamente(abonamente);
			RequestDispatcher rd = request.getRequestDispatcher("adauga_Abonamente.jsp");
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
