package pojos;
// Generated 14 feb 2022 13:49:31 by Hibernate Tools 5.5.7.Final

import java.util.Date;

/**
 * Prestamo generated by hbm2java
 */
public class Prestamo implements java.io.Serializable {

	private Integer idPrestamo;
	private Libro libro;
	private Socio socio;
	private Date fechaInicio;
	private Date fechaFin;

	public Prestamo() {
	}

	public Prestamo(Libro libro, Socio socio, Date fechaInicio, Date fechaFin) {
		this.libro = libro;
		this.socio = socio;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
	}

	public Integer getIdPrestamo() {
		return this.idPrestamo;
	}

	public void setIdPrestamo(Integer idPrestamo) {
		this.idPrestamo = idPrestamo;
	}

	public Libro getLibro() {
		return this.libro;
	}

	public void setLibro(Libro libro) {
		this.libro = libro;
	}

	public Socio getSocio() {
		return this.socio;
	}

	public void setSocio(Socio socio) {
		this.socio = socio;
	}

	public Date getFechaInicio() {
		return this.fechaInicio;
	}

	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}

	public Date getFechaFin() {
		return this.fechaFin;
	}

	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}

}
