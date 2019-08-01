package historico;

public class Disciplina {
    String nome;
    SituacaoDisciplina situacao;
    double nota;

    public Disciplina (String nome) {
        this.nome = nome;
        situacao = SituacaoDisciplina.CURSANDO;
    }

    void atualizaResultado (double nota) {
        if (nota >= 60.0)
            situacao = SituacaoDisciplina.APROVADO;
        else
            situacao = SituacaoDisciplina.REPROVADO;
        
        this.nota = nota;
    }

    void imprime () {
        System.out.println(nome + " - " + nota + ": " + situacao);
    }

    public static void main (String args[]) {
        Disciplina d1 = new Disciplina("POO1");
        d1.atualizaResultado(84.6);
        
        Disciplina d2 = new Disciplina("AED2");
        d2.atualizaResultado(59);
        
        Disciplina d3 = new Disciplina("EST");
        d3.atualizaResultado(90);
        
        Historico h = new Historico();
        h.matriculaDisciplina(d1);
        h.matriculaDisciplina(d2);
        h.matriculaDisciplina(d3);
        
        h.imprime();
    }
} 
