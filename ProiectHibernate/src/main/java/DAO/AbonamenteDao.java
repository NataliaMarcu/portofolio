package DAO;

import java.util.List;
import pojo.Abonamente;
import java.util.Date;
import pojo.Abonati;
import pojo.Ziare;

public interface AbonamenteDao {
	public void adaugaAbonamente (Abonamente abonamente);
	public List<Abonamente> afiseazaAbonamente();
	public void modificaAbonamente (Long idabonament, Ziare ziare, Abonati abonati, Date dataAbonament, Date dataExpirareAbonament, String tipAbonament, Float suma);
	public void stergeAbonamente (Abonamente abonamente);
}    
