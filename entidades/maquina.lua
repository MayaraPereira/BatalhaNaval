local maquina = {}

function maquina.novo(tabuleiroMaquina)
	local instancia = {
		nome = 'maquina',
		jogadasCertas = {},
		tabuleiroMaquina = tabuleiroMaquina
	}

	-- distribuindo navios horizontalmente (M, A, U, I), atraves de random encontra-se o valor inicial do barco. Todo o resto é obtido a partir deste valor random.
	function instancia:escolher_posicoesPortaAvioes()
	-- repete a partir daqui se alguma posicao não for marcada
		pos1 = "M"
		pos2 = "M"
		pos3 = "M"
		pos4 = "M"
		pos5 = "M"

		print(self.tabuleiroMaquina.tipo)

		numero = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		pos1 = pos1 .. numero

		pos2 = pos2 .. (numero+1)
		pos3 = pos3 .. (numero+2)
		pos4 = pos4 .. (numero+3)
		pos5 = pos5 .. (numero+4)


		if self.tabuleiroMaquina[pos1] ~= nil and self.tabuleiroMaquina[pos2] ~= nil and self.tabuleiroMaquina[pos3] ~= nil and self.tabuleiroMaquina[pos4] ~= nil and self.tabuleiroMaquina[pos5] ~= nil then
			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
			self.tabuleiroMaquina:marcaPosicao(pos4)
			self.tabuleiroMaquina:marcaPosicao(pos5)
		else
			pos2 = pos2 .. (numero-1)
			pos3 = pos3 .. (numero-2)
			pos4 = pos4 .. (numero-3)
			pos5 = pos5 .. (numero-4)

			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
			self.tabuleiroMaquina:marcaPosicao(pos4)
			self.tabuleiroMaquina:marcaPosicao(pos5)
		end
		print(self.tabuleiroMaquina[pos1])
	end

	function instancia:escolher_posicoesNavioTanque()
		pos1 = "A"
		pos2 = "A"
		pos3 = "A"
		pos4 = "A"

		print(self.tabuleiroMaquina.tipo)

		numero = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		pos1 = pos1 .. numero

		pos2 = pos2 .. (numero+1)
		pos3 = pos3 .. (numero+2)
		pos4 = pos4 .. (numero+3)

		if self.tabuleiroMaquina[pos1] ~= nil and self.tabuleiroMaquina[pos2] ~= nil and self.tabuleiroMaquina[pos3] ~= nil and self.tabuleiroMaquina[pos4] ~= nil then
			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
			self.tabuleiroMaquina:marcaPosicao(pos4)
		else
			pos2 = pos2 .. (numero-1)
			pos3 = pos3 .. (numero-2)
			pos4 = pos4 .. (numero-3)

			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
			self.tabuleiroMaquina:marcaPosicao(pos4)
		end
		print(self.tabuleiroMaquina[pos1])
	end

	function instancia:escolher_posicoesContratorpedo()
		pos1 = "U"
		pos2 = "U"
		pos3 = "U"


		print(self.tabuleiroMaquina.tipo)

		numero = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		pos1 = pos1 .. numero

		pos2 = pos2 .. (numero+1)
		pos3 = pos3 .. (numero+2)

		if self.tabuleiroMaquina[pos1] ~= nil and self.tabuleiroMaquina[pos2] ~= nil and self.tabuleiroMaquina[pos3] ~= nil then
			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
		else
			pos2 = pos2 .. (numero-1)
			pos3 = pos3 .. (numero-2)

			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
			self.tabuleiroMaquina:marcaPosicao(pos3)
		end
		print(self.tabuleiroMaquina[pos1])
	end

	function instancia:escolher_posicoesSubmarino()
		pos1 = "I"
		pos2 = "I"

		print(self.tabuleiroMaquina.tipo)

		numero = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		pos1 = pos1 .. numero

		pos2 = pos2 .. (numero+1)

		if self.tabuleiroMaquina[pos1] ~= nil and self.tabuleiroMaquina[pos2] ~= nil then
			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
		else
			pos2 = pos2 .. (numero-1)

			self.tabuleiroMaquina:marcaPosicao(pos1)
			self.tabuleiroMaquina:marcaPosicao(pos2)
		end
		print(self.tabuleiroMaquina[pos1])
	end


	function instancia:joga()
		-- se nao for a primeira jogada, verifica se a ultima jogada (jogadasCertas[#jogadasCertas]) foi certa, se sim, escolhe entre as 4 posicoes vazias ao redor da posicao da ultima jogada certa
		-- se todas as 4 posicoes estiverem marcadas (verificado atraves do marcaPosicao), entao joga aleatorio
		-- chama marcaPosicao de tabuleiro. Depois chama verificaJogada de partida, se return true, add posicao em jogadasCertas (jogadasCertas[#jogadasCertas + 1] = posicao)
	end

	function instancia:posicionaNavio(tipoNavio)
		-- chama marcaPosicao de tabuleiro. posicoes aleatorias.
	end

	return instancia
end


return maquina

