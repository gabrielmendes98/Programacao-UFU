package cliente;



import com.poo2.transportadora.domain.enums.TipoCliente;
import java.util.List;
import pedido.Pedido;

public  abstract class Cliente{

    private int idCliente;
    private String nome;
    private String cpfOuCnpj;
    private TipoCliente tipoCliente;
    private Double pontos;
    private Localidade localidade;
    private List<Pedido> pedidos;

    public Cliente(){

    }

//    public void efetuaPagamentoReais(Pedido pedido, Veiculo veiculo) {
//        pedido.setVeiculo(veiculo);
//        veiculo.addObserver(pedido);
//    }
//
//    public void efetuaPagamentoPontos(Pedido pedido, Veiculo veiculo) {
//        this.setPontos(this.getPontos()-pedido.getValoEmPontos());
//        pedido.setVeiculo(veiculo);
//        veiculo.addObserver(pedido);
//    }

    public void adicionaPedido(Pedido pedido){
        this.pedidos.add(pedido);
    }

    public abstract void ganhaPontos(Pedido pedido);

    public Cliente(Integer idCliente, String nome, String cpfOuCnpj, TipoCliente tipoCliente, Double pontos, Localidade localidade, List<Pedido> pedidos) {
        this.idCliente = idCliente;
        this.nome = nome;
        this.cpfOuCnpj = cpfOuCnpj;
        this.tipoCliente = tipoCliente;
        this.pontos = pontos;
        this.localidade = localidade;
        this.pedidos = pedidos;
    }

    /**
     * Construtor para atualizacao
     * @param clienteRequest
     */
//    public void toCliente(ClienteRequest clienteRequest){
//        this.setCpfOuCnpj(clienteRequest.getCpfOuCnpj());
//        this.setPedidos(clienteRequest.getPedidoList());
//        this.setPontos(clienteRequest.getPontos());
//        this.setNome(clienteRequest.getNome());
//        this.setLocalidade(clienteRequest.getLocalidade());
//    }

    public Integer getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(Integer idCliente) {
        this.idCliente = idCliente;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpfOuCnpj() {
        return cpfOuCnpj;
    }

    public void setCpfOuCnpj(String cpfOuCnpj) {
        this.cpfOuCnpj = cpfOuCnpj;
    }

    public TipoCliente getTipoCliente() {
        return tipoCliente;
    }

    public void setTipoCliente(TipoCliente tipoCliente) {
        this.tipoCliente = tipoCliente;
    }

    public Double getPontos() {
        return pontos;
    }

    public void setPontos(Double pontos) {
        this.pontos = pontos;
    }

    public Localidade getLocalidade() {
        return localidade;
    }

    public void setLocalidade(Localidade localidade) {
        this.localidade = localidade;
    }

    public List<Pedido> getPedidos() {
        return pedidos;
    }

    public void setPedidos(List<Pedido> pedidos) {
        this.pedidos = pedidos;
    }
}