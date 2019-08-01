package pedido;


import cliente.Cliente;
import com.poo2.transportadora.domain.enums.StatusPedido;
import com.poo2.transportadora.domain.enums.TipoItem;
import com.poo2.transportadora.domain.veiculo.Observer;
import veiculo.Veiculo;
import java.io.Serializable;
import java.util.List;
import java.util.Objects;
import java.util.Observable;

public abstract class Pedido implements Observer, Pedido1{

    private String idPedido;
    private Cliente cliente;
    private StatusPedido statusPedido;
    private String dataPedido;
    private String dataPrevistaDeEntrega;
    private Double valor;
    private Double valoEmPontos;
    private String cidadeAtual;
    private String cidadeDestino;
    private String cidadePartida;
    private Double pesoTotal;
    private List<TipoItem> tipoItems;
    private Veiculo veiculo;

    public Pedido(){

    }

//    @Autowired
//    private PedidoService pedidoService;

    public abstract List<TipoItem> verificatipos();

    public void montar(TipoItem tipoItem){
        tipoItems.add(tipoItem);
    }

    /**
     * Atualiza a cidade do pedido e salva no banco
     * @param cidadeAtual
     */
    public void update(String cidadeAtual){
        this.cidadeAtual = cidadeAtual;
//        pedidoService.update(this);
    }

    public Pedido(String idPedido, StatusPedido statusPedido, String dataPedido, String dataPrevistaDeEntrega, Double valor, Double valoEmPontos, String cidadeAtual, String cidadeDestino, String cidadePartida, Double pesoTotal, List<TipoItem> tipoItems, Veiculo veiculo, Cliente cliente) {
        this.idPedido = idPedido;
        this.statusPedido = statusPedido;
        this.dataPedido = dataPedido;
        this.dataPrevistaDeEntrega = dataPrevistaDeEntrega;
        this.valor = valor;
        this.valoEmPontos = valoEmPontos;
        this.cidadeAtual = cidadeAtual;
        this.cidadeDestino = cidadeDestino;
        this.cidadePartida = cidadePartida;
        this.pesoTotal = pesoTotal;
        this.tipoItems = tipoItems;
        this.veiculo = veiculo;
        this.cliente = cliente;
    }

    public Double getPesoTotal() {
        return pesoTotal;
    }

    public void setPesoTotal(Double pesoTotal) {
        this.pesoTotal = pesoTotal;
    }

    public List<TipoItem> getTipoItems() {
        return tipoItems;
    }

    public void setTipoItems(List<TipoItem> tipoItems) {
        this.tipoItems = tipoItems;
    }

    public String getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(String idPedido) {
        this.idPedido = idPedido;
    }

    public StatusPedido getStatusPedido() {
        return statusPedido;
    }

    public void setStatusPedido(StatusPedido statusPedido) {
        this.statusPedido = statusPedido;
    }

    public String getDataPedido() {
        return dataPedido;
    }

    public void setDataPedido(String dataPedido) {
        this.dataPedido = dataPedido;
    }

    public String getDataPrevistaDeEntrega() {
        return dataPrevistaDeEntrega;
    }

    public void setDataPrevistaDeEntrega(String dataPrevistaDeEntrega) {
        this.dataPrevistaDeEntrega = dataPrevistaDeEntrega;
    }

    public Double getValor() {
        return valor;
    }

    public void setValor(Double valor) {
        this.valor = valor;
    }

    public double getValorEmPontos() {
        return valoEmPontos;
    }

    public void setValorEmPontos(double valoEmPontos) {
        this.valoEmPontos = valoEmPontos;
    }

    public String getCidadeAtual() {
        return cidadeAtual;
    }

    public void setCidadeAtual(String cidadeAtual) {
        this.cidadeAtual = cidadeAtual;
    }

    public Veiculo getVeiculo() {
        return veiculo;
    }

    public void setVeiculo(Veiculo veiculo) {
        this.veiculo = veiculo;
    }

    public String getCidadeDestino() {
        return cidadeDestino;
    }

    public void setCidadeDestino(String cidadeDestino) {
        this.cidadeDestino = cidadeDestino;
    }

    public String getCidadePartida() {
        return cidadePartida;
    }

    public void setCidadePartida(String cidadePartida) {
        this.cidadePartida = cidadePartida;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pedido pedido = (Pedido) o;
        return Objects.equals(idPedido, pedido.idPedido) &&
                Objects.equals(cliente, pedido.cliente) &&
                statusPedido == pedido.statusPedido &&
                Objects.equals(dataPedido, pedido.dataPedido) &&
                Objects.equals(dataPrevistaDeEntrega, pedido.dataPrevistaDeEntrega) &&
                Objects.equals(valor, pedido.valor) &&
                Objects.equals(valoEmPontos, pedido.valoEmPontos) &&
                Objects.equals(cidadeAtual, pedido.cidadeAtual) &&
                Objects.equals(cidadeDestino, pedido.cidadeDestino) &&
                Objects.equals(cidadePartida, pedido.cidadePartida) &&
                Objects.equals(pesoTotal, pedido.pesoTotal) &&
                Objects.equals(tipoItems, pedido.tipoItems) &&
                Objects.equals(veiculo, pedido.veiculo);
    }

    @Override
    public int hashCode() {
        return Objects.hash(idPedido, cliente, statusPedido, dataPedido, dataPrevistaDeEntrega, valor, valoEmPontos, cidadeAtual, cidadeDestino, cidadePartida, pesoTotal, tipoItems, veiculo);
    }

    

}