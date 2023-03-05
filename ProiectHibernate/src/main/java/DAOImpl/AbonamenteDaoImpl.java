package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Abonamente;
import DAO.AbonamenteDao;
import java.util.Date;
import pojo.Abonati;
import pojo.Ziare;

public class AbonamenteDaoImpl implements AbonamenteDao{

	public void adaugaAbonamente(Abonamente abonamente) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(abonamente);
		transaction.commit();
		session.close();
	}

	public List<Abonamente> afiseazaAbonamente() {
		List<Abonamente> listaAbonamente = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Abonamente");
		listaAbonamente = query.list();
		return listaAbonamente;
	}

	public void modificaAbonamente(Long idabonament, Ziare ziare, Abonati abonati, Date dataAbonament, Date dataExpirareAbonament, String tipAbonament, Float suma) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Abonamente detaliiabonamente;
		detaliiabonamente = (Abonamente) session.load(Abonamente.class, idabonament);
		detaliiabonamente.setZiare(ziare);
		detaliiabonamente.setAbonati(abonati);
		detaliiabonamente.setDataAbonament(dataAbonament);
		detaliiabonamente.setDataExpirareAbonament(dataExpirareAbonament);
		detaliiabonamente.setTipAbonament(tipAbonament);
		detaliiabonamente.setSuma(suma);
		session.update(detaliiabonamente);
		transaction.commit();
		session.close();
	}

	public void stergeAbonamente(Abonamente abonamente) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(abonamente);
		transaction.commit();
		session.close();
	}
}
