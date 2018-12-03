package livraria.model;

import java.sql.Date;
import java.util.Random;

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

	// Valor da Nota
	public double valorNota(int qntLivro, String preco) {
		double valor = Double.parseDouble(preco);

		valor = (valor * qntLivro);

		return valor;
	}

	// Numero da NF
	public int nroNF() {
		Random gerador = new Random();

		int nroNF = gerador.nextInt(9999);

		return nroNF;
	}

	// Numero da Fatura
	public int nroFatura() {
		Random gerador = new Random();

		int nroFatura = gerador.nextInt(9999);

		return nroFatura;
	}
}
