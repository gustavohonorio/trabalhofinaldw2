package livraria.model;

public class Secao {

	private int codigo;
	private String nome;
	private Area[] areas;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public Area[] getAreas() {
		return areas;
	}
	public void setAreas(Area[] areas) {
		this.areas = areas;
	}
	
	
}
