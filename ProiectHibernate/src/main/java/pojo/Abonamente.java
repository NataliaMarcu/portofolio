package pojo;

import java.util.Date;

public class Abonamente  implements java.io.Serializable {
	private Long idabonament;
	private Abonati abonati;
	private Ziare ziare;
	private Date dataAbonament;
	private Date dataExpirareAbonament;
	private String tipAbonament;
	private Float suma;

	public Abonamente() {
	}

	public Abonamente(Abonati abonati, Ziare ziare, Long idabonament, Date data_abonament, Date data_expirare_abonament, String tip_abonament, Float suma) {
		this.abonati = abonati;
		this.ziare = ziare;
		this.idabonament = idabonament;
		this.dataAbonament = data_abonament;
		this.dataExpirareAbonament = data_expirare_abonament;
		this.tipAbonament = tip_abonament;
		this.suma = suma;
	}

	public Long getIdabonament() {
		return this.idabonament;
	}

	public void setIdabonament(Long idabonament) {
		this.idabonament = idabonament;
	}
	public Abonati getAbonati() {
		return this.abonati;
	}

	public void setAbonati(Abonati abonati) {
		this.abonati = abonati;
	}
	public Ziare getZiare() {
		return this.ziare;
	}

	public void setZiare(Ziare ziare) {
		this.ziare = ziare;
	}
	public Date getDataAbonament() {
		return this.dataAbonament;
	}

	public void setDataAbonament(Date data_abonament) {
		this.dataAbonament = data_abonament;
	}
	public Date getDataExpirareAbonament() {
		return this.dataExpirareAbonament;
	}

	public void setDataExpirareAbonament(Date data_expirare_abonament) {
		this.dataExpirareAbonament = data_expirare_abonament;
	}
	public String getTipAbonament() {
		return this.tipAbonament;
	}

	public void setTipAbonament(String tip_abonament) {
		this.tipAbonament = tip_abonament;
	}
	public Float getSuma() {
		return this.suma;
	}

	public void setSuma(Float suma) {
		this.suma = suma;
	}
}
