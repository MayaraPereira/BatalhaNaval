local player = require("entidades/player")
local placar = require("entidades/placar")
local maquina = require("entidades/maquina")
local tabuleiro = require("entidades/tabuleiro")
local portaAvioes = require("entidades/portaAvioes")
local navioTanque = require("entidades/navioTanque")
local contratorpedo = require("entidades/contratorpedo")
local submarino = require("entidades/submarino")


-- ******************************************* INICIO DEFINICAO FUNCOES **************************************************************

---------------------------------------------- funcao posicionar portaAvioes(qtdPortaAvioes) -----------------------------------------------
function posicionarPortaAvioes(qtdPortaAvioes)
	-- dentro desta funcao deve receber as posicoes dos portaAvioes (telas)
	local cont1 = 0
	local cont2 = 0

	-- recebe as posicoes do portaAvioes
	while(cont1 <= qtdPortaAvioes and cont2 <= qtdPortaAvioes) do
		-- escolhe a posicão do portaAvioes
		if (player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5) == true) then
			player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesPortaAvioes() == true) then
			player2:escolher_posicoesPortaAvioes()
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar portaAvioes(qtdPortaAvioes) ------------------------------------------


---------------------------------------------- funcao posicionar navio tanque(qtdNavios) -----------------------------------------------
function posicionarNavioTanque(qtdNavios)
-- dentro desta funcao deve receber as posicoes dos navios tanque (telas)
	local cont1 = 0
	local cont2 = 0

	while(cont1 <= qtdNavios and cont2 <= qtdNavios) do
		-- escolhe a posicão do navioTanque
		if (player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4) == true) then
			player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesNavioTanque() == true) then
			player2:escolher_posicoesNavioTanque()
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar navio tanque(tipoDoTabuleiro) ------------------------------------------

---------------------------------------------- funcao posicionar contratorpedo(qtdContratorpedos) -----------------------------------------------
function posicionarContratorpedo(qtdContratorpedos)
	-- dentro desta funcao deve receber as posicoes dos contratorpedos (telas)
	local cont1 = 0
	local cont2 = 0

	-- recebe as posicoes do contratorpedo
	while(cont1 <= qtdContratorpedos and cont2 <= qtdContratorpedos) do
		-- escolhe a posicão do contratorpedo
		if (player1:escolher_posicoesContratorpedo(pos1, pos2, pos3) == true) then
			player1:escolher_posicoesContratorpedo(pos1, pos2, pos3)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesContratorpedo() == true) then
			player2:escolher_posicoesContratorpedo()
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar contratorpedo(qtdContratorpedos) ------------------------------------------

---------------------------------------------- funcao posicionar submarino(qtdSubmarinos) -----------------------------------------------
function posicionarSubmarino(qtdSubmarinos)
	-- dentro desta funcao deve receber as posicoes dos submarinos (telas)
	local cont1 = 0
	local cont2 = 0

	-- recebe as posicoes do submarino
	while(cont1 <= qtdSubmarinos and cont2 <= qtdSubmarinos) do
		-- escolhe a posicão do submarinos
		if (player1:escolher_posicoesSubmarino(pos1, pos2) == true) then
			player1:escolher_posicoesSubmarino(pos1, pos2)
			cont1 = cont1 + 1
		end
		if (player2:escolher_posicoesSubmarino() == true) then
			player2:escolher_posicoesSubmarino()
			cont2 = cont2 + 1
		end
	end
end
----------------------------------------------- fim funcao posicionar submarino(qtdSubmarinos) ------------------------------------------

function finalizarPartida()
	-- exibe tela avisando que o jogo sera perdido, se true volta para menu, se false permanece na tela atual
end

function registrarVencedor(instanciaPlayer)
	-- exibe mensagem de quem venceu
	if (instanciaPlayer.nome ~= "maquina") then
		-- verifica se placarPlayer1.pontos eh maior que a pontuacao do ultimo registro do ranking top 10
		-- se entrar no top 10, colocar na posicao correta chamando o metodo registraPontuacao()
			-- se empatar, compara o tempoP1 com o tempo da posicao empatada
	end
end

function registraPontuacao()
	-- pega player1.nome, placarPlayer1.pontos e tempoP1 e registra no bd, atualizando a tela de ranking
end


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

----------------------------- funcao iniciar ataque ----------------------------------------------

function iniciarAtaque()
	local tempoP1 = 0
	local tempoP2 = 0

	-- a partir daqui as posicoes de tiros são recebidas (player1 sempre comeca)
	while (true) do
		if (tabPlayer2.qtdPosicaoNavios ~= 0) then -- Se qtdPosicaoNavios de player2 for diferente de 0, player1 joga
			-- guardando o tempo inicial da jogada
			local tempoPlayer1 = os.time()
			-- recebe a posicao na tela
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
		end
	end -- fecha o comando "while"
end
------------------------- aqui finaliza funcao iniciar ataque -------------------------------

-- ******************************************* FIM DEFINICAO FUNCOES **************************************************************



-- *************************************** CHAMADA DE FUNCOES E CRIACAO DE ENTIDADES ***********************************************
--criando tabuleiros
local tabPlayer1 = tabuleiro.novo(2)
local tabPlayer2 = tabuleiro.novo(2)

--montando tabuleiros de acordo com o tipo
tabPlayer1:montarTabuleiro(tabPlayer1:verificaTipo())
tabPlayer2:montarTabuleiro(tabPlayer2:verificaTipo())


-- testanto se os tamanhos estao corretos
print(tabPlayer1.posicoes[#tabPlayer1.posicoes])
print(tabPlayer2.posicoes[#tabPlayer2.posicoes])

-- criando jogadores, antes disso deve receber o nome do jogador ("nome")
local player1 = player.novo("nome", tabPlayer1)
local player2 = maquina.novo(tabPlayer2)

-- testando se os tabuleiros estao associados corretamente com os players
print(player1.tabuleiro.posicoes[1])
print(player2.tabuleiroMaquina.posicoes[1])

-- chama funcao posicionar navios
posicionarNavios()

-- definindo os placares para cada player
local placarPlayer1 = placar.novo()
local placarPlayer2 = placar.novo()

-- *************************************** FIM CHAMADA DE FUNCOES E CRIACAO DE ENTIDADES ***********************************************
