package DAOImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import javax.persistence.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import pojo.Abonati;
import DAO.AbonatiDao;

public class AbonatiDaoImpl implements AbonatiDao{

	public void adaugaAbonati(Abonati abonati) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.save(abonati);
		transaction.commit();
		session.close();
	}

	public List<Abonati> afiseazaAbonati() {
		List<Abonati> listaAbonati = new ArrayList();
		Session session = HibernateUtil.getSessionFactory().openSession();
		org.hibernate.Query query = session.createQuery("From Abonati");
		listaAbonati = query.list();
		return listaAbonati;
	}

	public void modificaAbonati(Long idabonat, String nume, String prenume, String adresa, Date datanasterii) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		Abonati detaliiabonati = (Abonati) session.load(Abonati.class, idabonat);
		detaliiabonati.setNume(nume);
		detaliiabonati.setPrenume(prenume);
		detaliiabonati.setAdresa(adresa);
		detaliiabonati.setDatanasterii(datanasterii);
		session.update(detaliiabonati);
		transaction.commit();
		session.close();
	}

	public void stergeAbonati(Abonati abonati) {
		Session session = HibernateUtil.getSessionFactory().openSession();
		Transaction transaction = session.beginTransaction();
		session.delete(abonati);
		transaction.commit();
		session.close();
	}
}
