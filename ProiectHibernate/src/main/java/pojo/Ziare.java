package pojo;

import java.util.HashSet;
import java.util.Set;

public class Ziare  implements java.io.Serializable {
	private Long idziar;
	private String nume;
	private String adresa;
	private Set abonamente = new HashSet(0);

	public Ziare() {
	}

	public Ziare(Long idziar, String nume, String adresa, Set abonamente) {
		this.idziar = idziar;
		this.nume = nume;
		this.adresa = adresa;
		this.abonamente = abonamente;
	}

	public Long getIdziar() {
		return this.idziar;
	}

	public void setIdziar(Long idziar) {
		this.idziar = idziar;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}
	public Set getAbonamente() {
		return this.abonamente;
	}

	public void setAbonamente(Set abonamente) {
		this.abonamente = abonamente;
	}
}
