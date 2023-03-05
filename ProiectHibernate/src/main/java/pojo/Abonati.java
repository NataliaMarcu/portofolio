package pojo;

import java.util.HashSet;
import java.util.Set;
import java.util.Date;

public class Abonati  implements java.io.Serializable {
	private Long idabonat;
	private String nume;
	private String prenume;
	private String adresa;
	private Date datanasterii;
	private Set abonamente = new HashSet(0);

	public Abonati() {
	}

	public Abonati(Long idabonat, String nume, String prenume, String adresa, Date datanasterii , Set abonamente) {
		this.idabonat = idabonat;
		this.nume = nume;
		this.prenume = prenume;
		this.adresa = adresa;
		this.datanasterii = datanasterii;
		this.abonamente = abonamente;
	}

	public Long getIdabonat() {
		return this.idabonat;
	}

	public void setIdabonat(Long idabonat) {
		this.idabonat = idabonat;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getPrenume() {
		return this.prenume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}
	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}
	public Date getDatanasterii() {
		return this.datanasterii;
	}

	public void setDatanasterii(Date datanasterii) {
		this.datanasterii = datanasterii;
	}
	public Set getAbonamente() {
		return this.abonamente;
	}

	public void setAbonamente(Set abonamente) {
		this.abonamente = abonamente;
	}
}
