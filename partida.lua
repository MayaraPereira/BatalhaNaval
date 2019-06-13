local player = require("entidades/player")
local placar = require("entidades/placar")
local maquina = require("entidades/maquina")
local tabuleiro = require("entidades/tabuleiro")
local portaAvioes = require("entidades/portaAvioes")
local navioTanque = require("entidades/navioTanque")
local contratorpedo = require("entidades/contratorpedo")
local submarino = require("entidades/submarino")

-- FRONT: TELA INICIAL COM BOTOES: NOVA PARTIDA, RANKING, INSTRUÇÕES E SAIR

-- FRONT: BOTAO NOVA PARTIDA: NOVA TELA (SELEÇÃO DE TABULEIROS, BOTÕES CONTINUAR E CANCELAR) PARA SELECIONAR O TIPO DE TABULEIRO(5X5 (tipo 1), 10X10 (tipo 2) E 20X20 (tipo 3)).
--        QUANDO O JOGADOR SELECIONAR O TIPO, CLICA NO BOTAO CONTINUAR. O BOTAO CONTINUAR CHAMA A FUNCAO criarEMontarTabuleiros(tipo). O BOTAO CANCELAR VOLTA PARA A TELA INICIAL.
-- 		  APÓS PRESSIONAR CONTINUAR E FUNCAO criarEMontarTabuleiros(tipo) == true, EXIBE UMA NOVA TELA PARA CADASTRO DO PLAYER (BARRA DE INPUT PARA NICKNAME E BOTÕES CONTINUAR E
--		  CANCELAR). O PLAYER PREENCHE O CAMPO COM SEU NICKNAME E CLICA NO BOTAO CONTINUAR. O BOTAO CONTINUAR CHAMA A FUNCAO criarPlayerPlacar(nome). O BOTAO CANCELAR VOLTA PARA
--		  A TELA INICIAL. APÓS PRESSIONAR CONTINUAR E FUNCAO criarPlayerPlacar(nome) == true, EXIBE UMA NOVA TELA PARA POSICIONAR NAVIOS (TABULEIRO, BARRA DE INPUT PARA POSICOES,
--		  BOTAO CONFIRMA PARA FIXAR POSICOES DO BARCO, E BOTÕES INICIAR E CANCELAR) E CHAMA A FUNCAO posicionarNavios(). EXIBE AO USUARIO QUAL O BARCO QUE ELE IRA POSICIONAR.
--		  QUANDO USUARIO PREENCHER A BARRA DE INPUT COM TODAS AS POSICOES REFERENTES AO BARCO SEPARADAS POR VIRGULA E CLICAR EM CONFIRMA, DEVE-SE ATUALIZAR O TABULEIRO COM AS
--        POSICOES CORRESPONDENTES EM PRETO. ESSE PROCESSO DE POSICIONAMENTO DEPENDE DIRETAMENTE DO TIPO DE TABULEIRO. O BOTAO CANCELAR VOLTA PARA A TELA INICIAL. QUANDO TODOS OS
--		  BARCOS ESTIVEREM POSICIONADOS A PARTIDA INICIA. EXIBE UMA NOVA TELA PARA A PARTIDA (2 TABULEIROS (TIROS DADOS E TABULEIRO PROPRIO), BARRA DE INPUT PARA A POSICAO ALVO,
--		  BOTOES ATIRAR E FINALIZAR) CHAMA A FUNCAO iniciarAtaque(). QUANDO USUARIO PREENCHER A BARRA DE INPUT COM A POSICAO QUE QUER ATIRAR E CLICAR NO BOTAO ATIRAR, ESSA POSICAO
--		  E PASSADA PARA A CHAMADA DE OUTRA FUNCAO DENTRO DA iniciarAtaque(). EXIBIR EM FORMA DE CONSOLE MENSAGENS COMO: ACERTOU, ERROU, JOGA INVÁLIDA. QUANDO UM USUARIO VENCER
--		  EXIBE UMA MENSAGEM COM O NOME DE QUEM VENCEU E RETORNA PARA A TELA INICIAL. O BOTAO FINALIZAR CHAMA A FUNCAO finalizarPartida().

-- FRONT: BOTAO RANKING: NOVA TELA (TABELA COM NICKNAME, TEMPO E PONTUACAO DOS 5 MELHORES JOGADORES, E BOTAO VOLTAR). BOTAO VOLTAR RETORNA A TELA INICIAL.

-- FRONT: BOTAO INSTRUCOES: NOVA TELA (COM TODAS AS REGRAS DE JOGO E CARACTERÍSTICAS DOS TABULEIROS, BOTAO VOLTAR). BOTAO VOLTAR RETORNA A TELA INICIAL.

-- FRONT: BOTAO SAIR: MATA O JOGO.


-- *************************************** INICIO CRIACAO DE ENTIDADES ***********************************************

--criando tabuleiros
local tabPlayer1 -- = tabuleiro.novo(2)
local tabPlayer2 -- = tabuleiro.novo(2)

--montando tabuleiros de acordo com o tipo
-- tabPlayer1:montarTabuleiro(tabPlayer1:verificaTipo())
-- tabPlayer2:montarTabuleiro(tabPlayer2:verificaTipo())

-- criando jogadores, antes disso deve receber o nome do jogador ("nome")
local player1 -- = player.novo("nome", tabPlayer1)
local player2 -- = maquina.novo(tabPlayer2)

-- definindo os placares para cada player
local placarPlayer1 --= placar.novo()
local placarPlayer2 -- = placar.novo()

-- *************************************** FIM CRIACAO DE ENTIDADES ***********************************************


-- ******************************************* INICIO DEFINICAO FUNCOES **************************************************************

---------------------------------------------- funcao criar e montarTabuleiro(tipoDoTabuleiro) -----------------------------------------------
function criarEMontarTabuleiros(tipoDoTabuleiro)
	tabPlayer1 = tabuleiro.novo(tipoDoTabuleiro)
	tabPlayer2 = tabuleiro.novo(tipoDoTabuleiro)

	tabPlayer1:montarTabuleiro(tabPlayer1:verificaTipo())
	tabPlayer2:montarTabuleiro(tabPlayer2:verificaTipo())
	return true
end

----------------------------------------------- fim funcao criar e montarTabuleiro(tipoDoTabuleiro) ------------------------------------------

---------------------------------------------- funcao criarPlayerPlacar(nome) -----------------------------------------------
function criarPlayerPlacar(nome)
	player1 = player.novo(nome, tabPlayer1)
	player2 = maquina.novo(tabPlayer2)

	placarPlayer1 = placar.novo()
	placarPlayer2 = placar.novo()

	return true
end

----------------------------------------------- fim funcao criarPlayerPlacar(nome) ------------------------------------------

---------------------------------------------- funcao posicionar portaAvioes(qtdPortaAvioes) -----------------------------------------------
function posicionarPortaAvioes(qtdPortaAvioes)
	-- dentro desta funcao deve receber as posicoes dos portaAvioes (telas)
	local cont1 = 0
	local cont2 = 0

	while(cont1 <= qtdPortaAvioes and cont2 <= qtdPortaAvioes) do
		-- acrescentar uma input para pos1, pos2, pos3, pos4, pos5
		if (player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5, cont1) == true) then
			player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5, cont1)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesPortaAvioes(cont2) == true) then
			player2:escolher_posicoesPortaAvioes(cont2)
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar portaAvioes(qtdPortaAvioes) ------------------------------------------


---------------------------------------------- funcao posicionar navio tanque(qtdNavios) -----------------------------------------------
function posicionarNavioTanque(qtdNavios)
	local cont1 = 0
	local cont2 = 0

	while(cont1 <= qtdNavios and cont2 <= qtdNavios) do
		-- acrescentar uma input para pos1, pos2, pos3, pos4
		if (cont1 <= qtdNavios and player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4, cont1) == true) then
			player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4, cont1)
			cont1 = cont1 + 1
		end
		if (cont2 <= qtdNavios and player2:escolher_posicoesNavioTanque(cont2) == true) then
			player2:escolher_posicoesNavioTanque(cont2)
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar navio tanque(tipoDoTabuleiro) ------------------------------------------

---------------------------------------------- funcao posicionar contratorpedo(qtdContratorpedos) -----------------------------------------------
function posicionarContratorpedo(qtdContratorpedos)
	local cont1 = 0
	local cont2 = 0

	while(cont1 <= qtdContratorpedos and cont2 <= qtdContratorpedos) do
		-- acrescentar uma input para pos1, pos2, pos3
		if (player1:escolher_posicoesContratorpedo(pos1, pos2, pos3, cont1) == true) then
			player1:escolher_posicoesContratorpedo(pos1, pos2, pos3, cont1)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesContratorpedo(cont2) == true) then
			player2:escolher_posicoesContratorpedo(cont2)
			cont2 = cont2 + 1
		end
	end
end
---------------------------------- fim funcao posicionar contratorpedo(qtdContratorpedos) ------------------------------------------

-------------------------------------- funcao posicionar submarino(qtdSubmarinos) -----------------------------------------------
function posicionarSubmarino(qtdSubmarinos)
	-- dentro desta funcao deve receber as posicoes dos submarinos (telas)
	local cont1 = 0
	local cont2 = 0

	-- recebe as posicoes do submarino
	while(cont1 <= qtdSubmarinos and cont2 <= qtdSubmarinos) do
		-- acrescentar uma input para pos1, pos2
		if (player1:escolher_posicoesSubmarino(pos1, pos2, cont1) == true) then
			player1:escolher_posicoesSubmarino(pos1, pos2, cont1)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesSubmarino(cont2) == true) then
			player2:escolher_posicoesSubmarino(cont2)
			cont2 = cont2 + 1
		end
	end
end
--------------------------------- fim funcao posicionar submarino(qtdSubmarinos) ------------------------------------------

------------------------------------- funcao posicionar navios ---------------------------------
function posicionarNavios()
	if tabPlayer1:verificaTipo() == 1 then
		-- funcao posicionar navios chama funcao de posicionar navio tanque
		posicionarNavioTanque(1)
		-- funcao posicionar navios chama funcao de posicionar contratorpedo
		posicionarContratorpedo(1)
		-- funcao posicionar navios chama funcao de posicionar submarino
		posicionarSubmarino(2)

	elseif tabPlayer1:verificaTipo() == 2 then
		-- funcao posicionar navios chama funcao de posicionar portaAvioes
		posicionarPortaAvioes(1)
		-- funcao posicionar navios chama funcao de posicionar navio tanque
		posicionarNavioTanque(2)
		-- funcao posicionar navios chama funcao de posicionar contratorpedo
		posicionarContratorpedo(3)
		-- funcao posicionar navios chama funcao de posicionar submarino
		posicionarSubmarino(4)

	elseif tabPlayer1:verificaTipo() == 3 then
		-- funcao posicionar navios chama funcao de posicionar portaAvioes
		posicionarPortaAvioes(2)
		-- funcao posicionar navios chama funcao de posicionar navio tanque
		posicionarNavioTanque(4)
		-- funcao posicionar navios chama funcao de posicionar contratorpedo
		posicionarContratorpedo(6)
		-- funcao posicionar navios chama funcao de posicionar submarino
		posicionarSubmarino(8)

	end
end

------------------------- aqui finaliza funcao posicionar navios -------------------------------

----------------------------- funcao registrarVencedor ----------------------------------------------

function registrarVencedor(instanciaPlayer)
	-- exibe mensagem de quem venceu
	if (instanciaPlayer.nome ~= "maquina") then
		-- verifica se placarPlayer1.pontos eh maior que a pontuacao do ultimo registro do ranking top 10
		-- se entrar no top 10, colocar na posicao correta chamando o metodo registraPontuacao()
			-- se empatar, compara o tempoP1 com o tempo da posicao empatada
	end
end
------------------------- aqui finaliza funcao registrarVencedor -------------------------------

----------------------------- funcao registraPontuacao ----------------------------------------------
function registraPontuacao()
	-- pega player1.nome, placarPlayer1.pontos e tempoP1 e registra no bd, atualizando a tela de ranking
end
------------------------- aqui finaliza funcao registraPontuacao -------------------------------


----------------------------- funcao iniciar ataque ----------------------------------------------

function iniciarAtaque()
	local tempoP1 = 0
	local tempoP2 = 0

	while (true) do
		if (tabPlayer2.qtdPosicaoNavios ~= 0) then -- Se qtdPosicaoNavios de player2 for diferente de 0, player1 joga
			-- guardando o tempo inicial da jogada
			local tempoPlayer1 = os.time()
			-- acrescentar uma input para posicao alvo. recebe a posicao na tela
			local qtdAtual = tabPlayer2.qtdPosicaoNavios
			if (player1:joga(posicao) == true) then
				-- contabilizando o tempo de cada jogada
				tempoP1 = tempoP1 + (os.time() - tempoPlayer1)
				if (qtdAtual > tabPlayer2.qtdPosicaoNavios) then
					print("Acertou!")
					placarPlayer1:incrementarPontos()
					if (tabPlayer2.qtdPosicaoNavios == 0) then
						registrarVencedor(player1)
						break
					end
				else
					print("Errou!")
				end
			else
				print("Jogada Invalida. Perdeu a vez.")
			end
		else
			print("Por algum motivo " .. player1.nome .. "venceu!")
			break
		end
		if (tabPlayer1.qtdPosicaoNavios ~= 0) then -- Se qtdPosicaoNavios de player1 for diferente de 0, player2 joga
			local tempoPlayer2 = os.time()
			local qtdAtual = tabPlayer1.qtdPosicaoNavios
			if (player2:joga() == true) then
				-- contabilizando o tempo de cada jogada
				tempoP2 = tempoP2 + (os.time() - tempoPlayer2)
				if (qtdAtual > tabPlayer1.qtdPosicaoNavios) then
					placarPlayer2:incrementarPontos()
					if (tabPlayer1.qtdPosicaoNavios == 0) then
						registrarVencedor(player2)
						break
					end
				end
			end
		else
			print("Por algum motivo " .. player2.nome .. "venceu!")
			break
		end
	end -- fecha o comando "while"
end
------------------------- aqui finaliza funcao iniciar ataque -------------------------------

------------------------- inicio funcao finalizarPartida -------------------------------

function finalizarPartida()
	-- exibe tela avisando que o jogo sera perdido, se true volta para menu, se false permanece na tela atual
end

------------------------- aqui finaliza funcao finalizarPartida -------------------------------


-- ******************************************* FIM DEFINICAO FUNCOES **************************************************************

-- *************************************** INICIO CHAMADA DE FUNCOES ***********************************************
-- chama funcao de criar e montar tabuleiros
criarEMontarTabuleiros(2)

-- testanto se os tamanhos estao corretos
print(tabPlayer1.posicoes[#tabPlayer1.posicoes])
print(tabPlayer2.posicoes[#tabPlayer2.posicoes])

-- chama funcao de criar player e placar
criarPlayerPlacar(nome)

-- testando se os tabuleiros estao associados corretamente com os players
print(player1.tabuleiro.posicoes[1])
print(player2.tabuleiroMaquina.posicoes[1])

-- chama funcao posicionar navios
posicionarNavios(tabPlayer1)

-- chama funcao iniciarAtaque
iniciarAtaque()

-- *************************************** FIM CHAMADA DE FUNCOES ***********************************************
