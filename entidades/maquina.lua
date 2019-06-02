local maquina = {}

function maquina.novo(tabuleiroMaquina)
	local instancia = {
		nome = 'maquina',
		jogadasCertas = {},
		tabuleiroMaquina = tabuleiroMaquina
	}

	-- distribuindo navios verticalmente e horizontalmente, atraves de random encontra-se o valor inicial do barco. Todo o resto é obtido a partir deste valor random.
	function instancia:escolher_posicoesPortaAvioes(cont)
		-- repete a partir daqui se alguma posicao não for marcada
		local numero1 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local numero2 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local pos1 = "0"
		local pos2 = "0"
		local pos3 = "0"
		local pos4 = "0"
		local pos5 = "0"


		-- define posicoes se couber no tabuleiroMaquina
		if cont == 1 and numero2 + 4 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1] .. (numero2+1)
			pos3 = self.tabuleiroMaquina.letras[numero1] .. (numero2+2)
			pos4 = self.tabuleiroMaquina.letras[numero1] .. (numero2+3)
			pos5 = self.tabuleiroMaquina.letras[numero1] .. (numero2+4)
		elseif cont == 2 and numero1 + 4 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1+1] .. numero2
			pos3 = self.tabuleiroMaquina.letras[numero1+2] .. numero2
			pos4 = self.tabuleiroMaquina.letras[numero1+3] .. numero2
			pos5 = self.tabuleiroMaquina.letras[numero1+4] .. numero2
		end


		if self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos1)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos2)] ~= nil
			and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos3)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos4)] ~= nil
			and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos5)] ~= nil then
			if self.tabuleiroMaquina:marcaPosicao(pos1, "PA", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos2, "PA", cont) == true
				and self.tabuleiroMaquina:marcaPosicao(pos3, "PA", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos4, "PA", cont) == true
				and self.tabuleiroMaquina:marcaPosicao(pos5, "PA", cont) == true then
				self.tabuleiroMaquina:marcaPosicao(pos1, "PA", cont)
				self.tabuleiroMaquina:marcaPosicao(pos2, "PA", cont)
				self.tabuleiroMaquina:marcaPosicao(pos3, "PA", cont)
				self.tabuleiroMaquina:marcaPosicao(pos4, "PA", cont)
				self.tabuleiroMaquina:marcaPosicao(pos5, "PA", cont)
				return true
			end
		else
			self:escolher_posicoesPortaAvioes(cont)
		end
		return false
	end

	function instancia:escolher_posicoesNavioTanque(cont)
		-- repete a partir daqui se alguma posicao não for marcada
		local numero1 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local numero2 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local pos1 = "0"
		local pos2 = "0"
		local pos3 = "0"
		local pos4 = "0"

		-- define posicoes se couber no tabuleiroMaquina
		if cont % 2 == 0 and numero2 + 3 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1] .. (numero2+1)
			pos3 = self.tabuleiroMaquina.letras[numero1] .. (numero2+2)
			pos4 = self.tabuleiroMaquina.letras[numero1] .. (numero2+3)
		elseif cont % 2 == 1 and numero1 + 3 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1+1] .. numero2
			pos3 = self.tabuleiroMaquina.letras[numero1+2] .. numero2
			pos4 = self.tabuleiroMaquina.letras[numero1+3] .. numero2
		end


		if self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos1)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos2)] ~= nil
			and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos3)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos4)] ~= nil then
			if self.tabuleiroMaquina:marcaPosicao(pos1, "NT", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos2, "NT", cont) == true
				and self.tabuleiroMaquina:marcaPosicao(pos3, "NT", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos4, "NT", cont) == true then
				self.tabuleiroMaquina:marcaPosicao(pos1, "NT", cont)
				self.tabuleiroMaquina:marcaPosicao(pos2, "NT", cont)
				self.tabuleiroMaquina:marcaPosicao(pos3, "NT", cont)
				self.tabuleiroMaquina:marcaPosicao(pos4, "NT", cont)
				return true
			end
		else
			self:escolher_posicoesNavioTanque(cont)
		end
		return false
	end

	function instancia:escolher_posicoesContratorpedo(cont)
		-- repete a partir daqui se alguma posicao não for marcada
		local numero1 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local numero2 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local pos1 = "0"
		local pos2 = "0"
		local pos3 = "0"

		-- define posicoes se couber no tabuleiroMaquina
		if cont % 2 == 0 and numero2 + 2 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1] .. (numero2+1)
			pos3 = self.tabuleiroMaquina.letras[numero1] .. (numero2+2)
		elseif cont % 2 == 1 and numero1 + 2 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1+1] .. numero2
			pos3 = self.tabuleiroMaquina.letras[numero1+2] .. numero2
		end


		if self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos1)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos2)] ~= nil
			and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos3)] ~= nil then
			if self.tabuleiroMaquina:marcaPosicao(pos1, "CT", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos2, "CT", cont) == true
				and self.tabuleiroMaquina:marcaPosicao(pos3, "CT", cont) == true then
				self.tabuleiroMaquina:marcaPosicao(pos1, "CT", cont)
				self.tabuleiroMaquina:marcaPosicao(pos2, "CT", cont)
				self.tabuleiroMaquina:marcaPosicao(pos3, "CT", cont)
				return true
			end
		else
			self:escolher_posicoesContratorpedo(cont)
		end
		return false
	end

	function instancia:escolher_posicoesSubmarino(cont)
		-- repete a partir daqui se alguma posicao não for marcada
		local numero1 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local numero2 = math.random(tabuleiroMaquina:verificaTamanho(self.tabuleiroMaquina.tipo))
		local pos1 = "0"
		local pos2 = "0"

		-- define posicoes se couber no tabuleiroMaquina
		if cont % 2 == 0 and numero2 + 1 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1] .. (numero2+1)
		elseif cont % 2 == 1 and numero1 + 1 <= table.getn(self.tabuleiroMaquina.letras) then
			pos1 = self.tabuleiroMaquina.letras[numero1] .. numero2
			pos2 = self.tabuleiroMaquina.letras[numero1+1] .. numero2
		end


		if self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos1)] ~= nil and self.tabuleiroMaquina[self.tabuleiroMaquina:capturaIndex(pos2)] ~= nil then
			if self.tabuleiroMaquina:marcaPosicao(pos1, "S", cont) == true and self.tabuleiroMaquina:marcaPosicao(pos2, "S", cont) == true then
				self.tabuleiroMaquina:marcaPosicao(pos1, "S", cont)
				self.tabuleiroMaquina:marcaPosicao(pos2, "S", cont)
				return true
			end
		else
			self:escolher_posicoesSubmarino(cont)
		end
		return false
	end


	function instancia:joga()
		-- se nao for a primeira jogada, verifica se a ultima jogada (jogadasCertas[#jogadasCertas]) foi certa, se sim, escolhe entre as 4 posicoes vazias ao redor da posicao da ultima jogada certa
		-- se todas as 4 posicoes estiverem marcadas (verificado atraves do marcaPosicao), entao joga aleatorio
		-- chama marcaPosicao de tabuleiro. Depois chama verificaJogada de partida, se return true, add posicao em jogadasCertas (jogadasCertas[#jogadasCertas + 1] = posicao)
	end

	return instancia
end


return maquina

