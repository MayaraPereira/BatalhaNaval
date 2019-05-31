local player = require("entidades/player")
local placar = require("entidades/placar")
local maquina = require("entidades/maquina")
local tabuleiro = require("entidades/tabuleiro")
local portaAvioes = require("entidades/portaAvioes")
local navioTanque = require("entidades/navioTanque")
local contratorpedo = require("entidades/contratorpedo")
local submarino = require("entidades/submarino")

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


-- primeiro escolhe a posicão do portaAvioes (pos1, pos2, pos3, pos4, pos5)
--player1:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5)
--player2:escolher_posicoesPortaAvioes()

-- segundo escolhe a posicão do navioTanque
--player1:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
--player2:escolher_posicoesNavioTanque()

-- terceiro escolhe a posicão do contratorpedo
--player1:escolher_posicoesContratorpedo(pos1, pos2, pos3)
--player2:escolher_posicoesContratorpedo()

-- quarto escolhe a posicão do submarino
--player1:escolher_posicoesSubmarino(pos1, pos2)
--player2:escolher_posicoesSubmarino()

function verificaJogada(nomePlayer)
	-- verificaPosicao no tabuleiro. Se posicao branca, errou e nao pontua. chama joga do outro player.
	-- Se posicao vermelha, acertou e atualiza placar do player (chama incrementaPontuacao de Placar).
		-- dependendo do tamanho do tabuleiro, se o numero de jogadas do nomePlayer for maior ou igual que 20 (20x20), 10 (10x10) ou 4 (4x4) entao:
			-- se qtdPosicaoNavios do tabuleiro do jogador que nao Ã© nomePlayer for 0, o nomePlayer ganhou a partida, entao:
				-- chama registraPontuacao

end

function atualizaPlacar(nomePlayer)
	-- chama incrementaPontuacao de Pla
end

function finalizarPartida(nomePlayer)
	-- volta para menu avisando que o jogo sera perdido
end

function registraPontuacao(nomePlayer)
	-- pega os pontos do placar de nomePlayer e registra no bd
end
