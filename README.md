# The Math!

Um jogo de tabuleiro que tem o proposito de ensinar equações como usar equações matemáticas apenas jogando e deduzindo.


# Requisitos dado os feedback colhidos

As equações devem ter o efeito esperado
Jogo deve começar fácil!
Haverá um sistema inteligente para determinar quais equações utilizar no jogo

## Sistema de fases

### Fase 1

#### Características
- [ ] O jogo vai começar com 4 casas
- [ ] O tempo será de 10 segundos
- [ ] O jogador terá 10 tentativas
#### Equações da fase
- [ ] A primeira equação será f(x) = x
- [ ] A segunda será f(x) = x+1
- [ ] A ultima da fase 1 será f(x) = x-1
#### Inteligência
- [ ] A cada erro irá perder 2 segundos
- [ ] Se respondido em menos de 1 segundo já irá para o fase 2
- [ ] Se respondido em menos de 3 segundos irá para a ultima equação
- [ ] Se acertar o alvo irá ganhar 10 segundos e mais duas tentativas

### Fase 2

#### Características
- [ ] O jogo vai começar com 9 casas
- [ ] O tempo será de 20 segundos
- [ ] O jogador quando chegar na fase será adicionada 10 tentativas
#### Equações da fase
- [ ] A primeira equação será f(x) = x+2
- [ ] A segunda será f(x) = x+3
- [ ] A terceira da fase 1 será f(x) = x+4
- [ ] A quarta equação será f(x) = x-2
- [ ] A quinta será f(x) = x-3
- [ ] A sexta da fase 1 será f(x) = x-4
#### Inteligência
- [ ] A cada erro irá perder 4 segundos
- [ ] Se respondido em menos de 1 segundo já irá para o fase 2
- [ ] Se respondido em menos de 3 segundos irá para a ultima equação
- [ ] Se acertar o alvo irá ganhar 10 segundos e mais duas tentativas








# Organização do codigo:

## Main

Responsavel por fazer as cenas do jogo transitar entre sim
Vai saber quando sair da tela de HUD para o sistema de fases do Jogo.


## Personagem

Estados:
[NAO_TELEPORTA, TELEPORTA]

Quando o personagem nasce, ele não teleporta

Após um evento de clique ele deve se teletransportar























