algoritmo "semnome"
var
   nomes: vetor [1..50] de caractere
   nota1, nota2, media: vetor [1..50] de real
   opcao, totalalunos: inteiro
   n1, n2, mediaturma, maiorn: real
   nome, vazio: caractere

procedimento mostramenu ()
inicio
   escreval ("----------------------- ")
   escreval ("     ESCOLA ZULMO       ")
   escreval ("----------------------- ")
   escreval ("1 -> Cadastrar ")
   escreval ("2 -> Listar ")
   escreval ("3 -> Buscar ")
   escreval ("4 -> Média Geral ")
   escreval ("5 -> Maior Nota ")
   escreval ("6 -> Sair ")
   escreval ("----------------------- ")
fimprocedimento

procedimento cadastrar()
inicio
   se (totalalunos = 50) entao
      escreval ("Limite de alunos atingido!")
   senao
      totalalunos <- totalalunos + 1
      limpatela
      escreval ("----------------------- ")
      escreval ("     ESCOLA ZULMO       ")
      escreval ("       CADASTRO         ")
      escreval ("----------------------- ")
      escreval ("Digite seu nome: ")
      leia (nome)
      nomes[totalalunos] <- nome
      escreval ("Digite sua primeira nota: ")
      leia (n1)
      nota1[totalalunos] <- n1
      escreval ("Digite sua segunda nota: ")
      leia (n2)
      nota2[totalalunos] <- n2
      media[totalalunos] <- (n1 + n2) / 2
   fimse
fimprocedimento

procedimento listar()
var
   i: inteiro

inicio
   limpatela
   escreval ("----------------------- ")
   escreval ("     ESCOLA ZULMO       ")
   escreval ("       LISTAGEM         ")
   escreval ("----------------------- ")
   para i <- 1 ate totalalunos faca
      escreval ("----------------------- ")
      escreval ("ALUNO", i, ": ", nomes[i])
      escreval ("NOTA 1: ", nota1[i])
      escreval ("NOTA 2: ", nota2[i])
      escreval ("MÉDIA: ", media[i]:4:2)
      escreval ("----------------------- ")
      escreval ()
   fimpara
   escreval ("Pressione ENTER para voltar ao menu... ")
   leia (vazio)
fimprocedimento

procedimento buscar()
var
   i: inteiro
   tem: logico
   r: caractere
inicio
   tem <- falso

   repita
      limpatela
      escreval ("----------------------- ")
      escreval ("     ESCOLA ZULMO       ")
      escreval ("        BUSCA           ")
      escreval ("----------------------- ")
      escreva ("Digite o nome do aluno: ")
      leia (nome)
      para i <- 1 ate totalalunos faca
         se (nomes[i] = nome) entao
            escreval ("ALUNO: ", nomes[i])
            escreval ("NOTA 1: ", nota1[i])
            escreval ("NOTA 2: ", nota2[i])
            escreval ("MÉDIA: ", media[i]:4:2)
            tem <- verdadeiro
         fimse
      fimpara
      se (tem = falso) entao
         escreval ("Nenhum aluno foi encontrado. ")
      fimse
      escreval ()
      escreval ()
      escreval ()
      escreval ("Deseja procurar novamente? [S/N] ")
      leia (r)
      r <- maiusc(r)

      enquanto (r <> "N") e (r <> "S") faca
         escreval ("Resposta inválida! Digite novamente [S/N] ")
         leia (r)
         r <- maiusc(r)
      fimenquanto
   ate (r = "N")
fimprocedimento

procedimento mediageral()
var
   i: inteiro

inicio
   mediaturma <- 0

   para i <- 1 ate totalalunos faca
      mediaturma <- mediaturma + media[i]
   fimpara

   mediaturma <- mediaturma / totalalunos

   limpatela
   escreval ("----------------------- ")
   escreval ("     ESCOLA ZULMO       ")
   escreval ("     MÉDIA GERAL        ")
   escreval ("----------------------- ")
   escreval ()
   escreval ("A QUANTIDADE DE ALUNOS NA TURMA:", totalalunos)
   escreval ("A MÉDIA DA TURMA FOI: ", mediaturma:4:2)
   escreval ()
   escreval ("Pressione ENTER para voltar ao menu... ")
   leia (vazio)
fimprocedimento

procedimento maiornota()
var
   i: inteiro

inicio
   maiorn <- 0

   para i <- 1 ate totalalunos faca
      se (nota1[i] > maiorn) entao
         maiorn <- nota1[i]
      fimse

      se (nota2[i] > maiorn) entao
         maiorn <- nota2[i]
      fimse
   fimpara

   limpatela
   escreval ("----------------------- ")
   escreval ("     ESCOLA ZULMO       ")
   escreval ("     MAIOR NOTA         ")
   escreval ("----------------------- ")
   escreval ("A MAIOR NOTA DA ESCOLA FOI: ", maiorn:4:2)

fimprocedimento

procedimento saida()
inicio
   escreval ("----------------------  ")
   escreval ("     ESCOLA ZULMO       ")
   escreval ("----------------------- ")
   escreval ()
   escreval ("VOLTE SEMPRE ")
   escreval ()
   escreval ("Saindo... ")
fimprocedimento

inicio
   totalalunos <- 0

   enquanto (opcao <> 6) faca
      limpatela
      mostramenu()
      leia (opcao)

      escolha (opcao)

      caso 1
         cadastrar()
      caso 2
         listar()
      caso 3
         buscar()
      caso 4
         mediageral()
      caso 5
         maiornota()
      caso 6
         saida()
      fimescolha
   fimenquanto
fimalgoritmo