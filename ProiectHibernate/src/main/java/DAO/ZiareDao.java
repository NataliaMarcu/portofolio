package DAO;

import java.util.List;
import pojo.Ziare;

public interface ZiareDao {
	public void adaugaZiare (Ziare ziare);
	public List<Ziare> afiseazaZiare();
	public void modificaZiare (Long idziar, String nume, String adresa);
	public void stergeZiare (Ziare ziare);
}
