package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Ziare;
import DAO.ZiareDao;

public class ZiareDaoImpl implements ZiareDao{

	public void adaugaZiare(Ziare ziare) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(ziare);
		transaction.commit();
		session.close();
	}

	public List<Ziare> afiseazaZiare() {
		List<Ziare> listaZiare = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Ziare");
		listaZiare = query.list();
		return listaZiare;
	}

	public void modificaZiare(Long idziar, String nume, String adresa) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Ziare detaliiziare = (Ziare) session.load(Ziare.class, idziar);
		detaliiziare.setNume(nume);
		detaliiziare.setAdresa(adresa);
		session.update(detaliiziare);
		transaction.commit();
		session.close();
	}

	public void stergeZiare(Ziare ziare) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(ziare);
		transaction.commit();
		session.close();
	}
}
