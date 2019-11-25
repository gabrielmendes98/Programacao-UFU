## Entrega 0: Jokenpo
**Ideia inicial:** Pedra, Papel ou Tesoura - Jokenpo<br>
A ideia é criar um jogo de jokenpo com sistema de streaming para que outras pessoas possam assistir aos jogos.

O servidor suportará até 15 pessoas conectadas, sendo que cada pessoa pode se conectar como um jogador ou um observador.

As regras do jogo sao simples e estão claramente ilustradas na imagem abaixo:

![erro, nao foi possivel carregar a imagem](https://img.ohmymag.com.br/article/480/pedra/jokenpo_5ced45efdf9229add66e2d1034e4a545c91a5cb8.jpg)

**Funcionamento:** O servidor ficará aberto à conexão para os usuários. Um usuário terá a opção de se conectar como jogador ou como observador. Caso ele se conecte como jogador, o mesmo entrará em uma fila aguardando outro jogador se conectar para iniciar a partida. Caso o usuário se conecte como observador, aparecerá uma lista de partidas com os nomes das pessoas que ele pode assistir, assim basta ele escolher uma partida e assisti-la. O jogo consistirá em uma "melhor de três" e quando acabar, os jogadores serão enviados para o menu principal, podendo iniciar outra partida ou observar alguém.

**Linguagem de implementação:** O jogo será implementado em Python.

**Componentes:** 15 Clients (jogadores + observadores), 1 interface para rodar o jogo (terminal), 1 servidor para as pessoas acessarem.

**Lista de testes a serem implementados:**<br>
* Teste de ponta a ponta: para mostrar que todas as jogadas que um jogador faz pode ser visto pelos outros.<br>
* Teste de concorrência: demonstrando que múltiplos clientes podem acessar o serviço ao mesmo tempo, sem comportamentos estranhos.<br>
* Teste de recuperação de falhas: quando um componente falha e volta a executar, ele não leva o sistema a nenhum estado inesperado, como por exemplo um *rollback* das jogadas feitas.<br>
* Demonstração de funcionalidades: Mostrar que as funcionalidades estão implementadas, ou seja, que é realmente possível jogar o jogo sem falhas.<br>