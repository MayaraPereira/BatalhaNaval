local player = require("entidades/player")
local placar = require("entidades/placar")
local maquina = require("entidades/maquina")
local tabuleiro = require("entidades/tabuleiro")
local portaAvioes = require("entidades/portaAvioes")
local navioTanque = require("entidades/navioTanque")
local contratorpedo = require("entidades/contratorpedo")
local submarino = require("entidades/submarino")


function finalizarPartida(nomePlayer)
	-- exibe tela avisando que o jogo sera perdido, se true volta para menu, se false permanece na tela atual
end

function registrarVencedor(player)
	-- exibe mensagem de quem venceu
	if (player.nome ~= "maquina") then
		-- verifica se placarPlayer1.pontos eh maior que a pontuacao do ultimo registro do ranking top 10
		-- se entrar no top 10, colocar na posicao correta chamando o metodo registraPontuacao(player1)
			-- se empatar, compara o tempoP1 com o tempo da posicao empatada
	end
end

function registraPontuacao(player)
	-- pega player1.nome, placarPlayer1.pontos e tempoP1 e registra no bd, atualizando a tela de ranking
end


------------------------------------ funcao iniciar partida -----------------------------------
--criando tabuleiros
local tabPlayer1 = tabuleiro.novo(2)
local tabPlayer2 = tabuleiro.novo(2)

--montando tabuleiros de acordo com o tipo
tabPlayer1:montarTabuleiro(tabPlayer1:verificaTipo())
tabPlayer2:montarTabuleiro(tabPlayer2:verificaTipo())


-- testanto se os tamanhos estao corretos
print(tabPlayer1.posicoes[#tabPlayer1.posicoes])
print(tabPlayer2.posicoes[#tabPlayer2.posicoes])

-- criando jogadores e tabuleiros / antes disso deve receber o nome do jogador ("nome") e o tipo do tabuleiro (2)
local player1 = player.novo("nome", tabPlayer1)
local player2 = maquina.novo(tabPlayer2)

-- testando se os tabuleiros estao associados corretamente com os players
print(player1.tabuleiro.posicoes[1])
print(player2.tabuleiroMaquina.posicoes[1])

-- chama funcao posicionar navios

------------------------ aqui finaliza funcao iniciar partida ----------------------------------

------------------------------------- funcao posicionar navios ---------------------------------

if tabPlayer1:verificaTipo() == 1 then
	local cont = 0
	for cont = 1, 1, 1 do -- Enquanto cont for menor ou igual a 2 ele é incrementado de 1 a 1
		-- escolhe a posicão do navioTanque
		player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
		player2:escolher_posicoesNavioTanque()
	end -- fecha o comando "for"
	for cont = 1, 1, 1 do
		-- escolhe a posicão do contratorpedo
		player1:escolher_posicoesContratorpedo(pos1, pos2, pos3)
		player2:escolher_posicoesContratorpedo()
	end
	for cont = 1, 2, 1 do
		-- escolhe a posicão do submarinos
		player1:escolher_posicoesSubmarino(pos1, pos2)
		player2:escolher_posicoesSubmarino()
	end
elseif tabPlayer1:verificaTipo() == 2 then
	local cont = 0
	for cont = 1, 1, 1 do -- Enquanto cont for menor ou igual a 2 ele é incrementado de 1 a 1
		-- escolhe a posicão do portaAvioes
		player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5)
		player2:escolher_posicoesPortaAvioes()
	end -- fecha o comando "for"
	for cont = 1, 2, 1 do
		-- escolhe a posicão do navioTanque
		player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
		player2:escolher_posicoesNavioTanque()
	end -- fecha o comando "for"
	for cont = 1, 3, 1 do
		-- escolhe a posicão do contratorpedo
		player1:escolher_posicoesContratorpedo(pos1, pos2, pos3)
		player2:escolher_posicoesContratorpedo()
	end
	for cont = 1, 4, 1 do
		-- escolhe a posicão do submarinos
		player1:escolher_posicoesSubmarino(pos1, pos2)
		player2:escolher_posicoesSubmarino()
	end
elseif tabPlayer1:verificaTipo() == 3 then
	local cont = 0
	for cont = 1, 2, 1 do -- Enquanto cont for menor ou igual a 2 ele é incrementado de 1 a 1
		-- escolhe a posicão do portaAvioes
		player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5)
		player2:escolher_posicoesPortaAvioes()
	end -- fecha o comando "for"
	for cont = 1, 4, 1 do
		-- escolhe a posicão do navioTanque
		player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
		player2:escolher_posicoesNavioTanque()
	end -- fecha o comando "for"
	for cont = 1, 6, 1 do
		-- escolhe a posicão do contratorpedo
		player1:escolher_posicoesContratorpedo(pos1, pos2, pos3)
		player2:escolher_posicoesContratorpedo()
	end
	for cont = 1, 8, 1 do
		-- escolhe a posicão do submarinos
		player1:escolher_posicoesSubmarino(pos1, pos2)
		player2:escolher_posicoesSubmarino()
	end
end

------------------------- aqui finaliza funcao posicionar navios -------------------------------


----------------------------- funcao iniciar jogo ----------------------------------------------
-- definindo os placares para cada player
local placarPlayer1 = placar.novo()
local placarPlayer2 = placar.novo()

local tempoP1 = 0
local tempoP2 = 0

-- a partir daqui as posicoes de tiros são recebidas (player1 comeca)

while (true) do
    if (player2.tabuleiroMaquina.qtdPosicaoNavios ~= 0) then -- Se qtdPosicaoNavios de player2 for diferente de 0, player1 joga
		-- guardando o tempo inicial da jogada
		local tempoPlayer1 = os.time()
        -- recebe a posicao na tela
		local qtdAtual = player2.tabuleiroMaquina.qtdPosicaoNavios
		if (player1:joga(posicao) == true) then
			if (qtdAtual > player2.tabuleiroMaquina.qtdPosicaoNavios) then
				print("Acertou!")
				placarPlayer1:incrementarPontos()
				if (player2.tabuleiroMaquina.qtdPosicaoNavios == 0) then
					registrarVencedor(player1)
					break
				end
			else
				print("Errou!")
			end
		else
			print("Jogada Invalida. Perdeu a vez.")
		end
		-- contabilizando o tempo de cada jogada
		tempoP1 = tempoP1 + (os.time() - tempoPlayer1)
    if (player1.tabuleiro.qtdPosicaoNavios ~= 0) then -- Se qtdPosicaoNavios de player1 for diferente de 0, player2 joga
		local tempoPlayer2 = os.time()
		local qtdAtual = player1.tabuleiro.qtdPosicaoNavios
		if (player2:joga() == true) then
			if (qtdAtual > player1.tabuleiro.qtdPosicaoNavios) then
				placarPlayer2:incrementarPontos()
				if (player1.tabuleiro.qtdPosicaoNavios == 0) then
					registrarVencedor(player2)
					break
				end
			end
		end
	end
	-- contabilizando o tempo de cada jogada
	tempoP2 = tempoP2 + (os.time() - tempoPlayer2)
end -- fecha o comando "while"
------------------------- aqui finaliza funcao iniciar jogo -------------------------------
