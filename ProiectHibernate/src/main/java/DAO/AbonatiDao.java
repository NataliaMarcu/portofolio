package DAO;

import java.util.List;
import java.util.Date;
import pojo.Abonati;

public interface AbonatiDao {
	public void adaugaAbonati (Abonati abonati);
	public List<Abonati> afiseazaAbonati();
	public void modificaAbonati (Long idabonat, String nume, String prenume, String adresa, Date datanasterii);
	public void stergeAbonati (Abonati abonati);
}
