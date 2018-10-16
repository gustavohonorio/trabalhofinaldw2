package livraria.model;

public class Cliente {

	private int codigo;
	private String nome;
	private String endereco;
	private Livro[] livros;
	private NotaFiscal[] NFS;
	
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
	
	public NotaFiscal[] getNFS() {
		return NFS;
	}
	public void setNFS(NotaFiscal[] nFS) {
		NFS = nFS;
	}
	
	
}
