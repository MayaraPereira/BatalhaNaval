local player = {}

function player.novo(nome,tabuleiro)
	local instancia = {
		nome = nome,
		tabuleiro = tabuleiro
	}

	function instancia:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5)
		if self.tabuleiro[pos1] ~= nil then
			self.tabuleiro:marcaPosicao(pos1)
			if pos1[1] == pos2[1] or pos1[2] == pos2[2] then
				self.tabuleiro:marcaPosicao(pos2)
				if pos1[1] == pos2[1] then
					if pos2[1] == pos3[1] then
						self.tabuleiro:marcaPosicao(pos3)
						if pos3[1] == pos4[1] then
							self.tabuleiro:marcaPosicao(pos4)
							if pos4[1] == pos5[1] then
								self.tabuleiro:marcaPosicao(pos5)
							end
						end
					end
				else
					if pos2[2] == pos3[2] then
						self.tabuleiro:marcaPosicao(pos3)
						if pos3[2] == pos4[2] then
							self.tabuleiro:marcaPosicao(pos4)
							if pos4[2] == pos5[2] then
								self.tabuleiro:marcaPosicao(pos5)
							end
						end
					end
				end
			end
		end
		print(self.tabuleiro[pos1])
	end

	function instancia:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
		if self.tabuleiro[pos1] ~= nil then
			self.tabuleiro:marcaPosicao(pos1)
			if pos1[1] == pos2[1] or pos1[2] == pos2[2] then
				self.tabuleiro:marcaPosicao(pos2)
				if pos1[1] == pos2[1] then
					if pos2[1] == pos3[1] then
						self.tabuleiro:marcaPosicao(pos3)
						if pos3[1] == pos4[1] then
							self.tabuleiro:marcaPosicao(pos4)
						end
					end
				else
					if pos2[2] == pos3[2] then
						self.tabuleiro:marcaPosicao(pos3)
						if pos3[2] == pos4[2] then
							self.tabuleiro:marcaPosicao(pos4)
						end
					end
				end
			end
		end
		print(self.tabuleiro[pos1])
	end

	function instancia:escolher_posicoesContratorpedo(pos1, pos2, pos3)
		if self.tabuleiro[pos1] ~= nil then
			self.tabuleiro:marcaPosicao(pos1)
			if pos1[1] == pos2[1] or pos1[2] == pos2[2] then
				self.tabuleiro:marcaPosicao(pos2)
				if pos1[1] == pos2[1] then
					if pos2[1] == pos3[1] then
						self.tabuleiro:marcaPosicao(pos3)
					end
				else
					if pos2[2] == pos3[2] then
						self.tabuleiro:marcaPosicao(pos3)
					end
				end
			end
		end
		print(self.tabuleiro[pos1])
	end

	function instancia:escolher_posicoesSubmarino(pos1, pos2)
		if self.tabuleiro[pos1] ~= nil then
			self.tabuleiro:marcaPosicao(pos1)
			if pos1[1] == pos2[1] or pos1[2] == pos2[2] then
				self.tabuleiro:marcaPosicao(pos2)
			end
		end
		print(self.tabuleiro[pos1])
	end

	function instancia:joga(posicao)
		-- chama marcaPosicao de tabuleiro. Depois chama verificaJogada de partida
	end

	function instancia:cancelaPartida()
		-- chama finalizaJogo de partida
	end

	return instancia
end

return player
