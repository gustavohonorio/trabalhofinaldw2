package livraria.model;

public class Autor {

	private int codigo;
	private String nome;
	private String endereco;
	private Livro[] livros;
	
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
	
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public Livro[] getLivros() {
		return livros;
	}
	public void setLivros(Livro[] livros) {
		this.livros = livros;
	}
	
	
}
