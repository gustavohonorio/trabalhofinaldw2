package livraria.model;

import java.sql.Date;

public class NotaFiscal {

	private int codigo;
	private int numeroNF;
	private int numeroFatura;
	private int qntLivros;
	private double valorNota;
	private Date dataNF;
	private Date dataFatura;
	private Cliente cliente;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public int getNumeroNF() {
		return numeroNF;
	}
	public void setNumeroNF(int numeroNF) {
		this.numeroNF = numeroNF;
	}
	
	public int getNumeroFatura() {
		return numeroFatura;
	}
	public void setNumeroFatura(int numeroFatura) {
		this.numeroFatura = numeroFatura;
	}
	
	public int getQntLivros() {
		return qntLivros;
	}
	public void setQntLivros(int qntLivros) {
		this.qntLivros = qntLivros;
	}
	
	public double getValorNota() {
		return valorNota;
	}
	public void setValorNota(double valorNota) {
		this.valorNota = valorNota;
	}
	
	public Date getDataNF() {
		return dataNF;
	}
	public void setDataNF(Date dataNF) {
		this.dataNF = dataNF;
	}
	
	public Date getDataFatura() {
		return dataFatura;
	}
	public void setDataFatura(Date dataFatura) {
		this.dataFatura = dataFatura;
	}
	
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
}
