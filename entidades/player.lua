local player = {}

function player.novo(nome,tabuleiro)
	local instancia = {
		nome = nome,
		tabuleiro = tabuleiro
	}

	function instancia:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5) -- primeiro letra (horizontal) depois numero (vertical)
		if self.tabuleiro[pos1] ~= nil and self.tabuleiro[pos2] ~= nil and self.tabuleiro[pos3] ~= nil and self.tabuleiro[pos4] ~= nil and self.tabuleiro[pos5] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if pos3[1] == pos4[1] and (pos3[2] == pos4[2] - 1 or pos4[2] == pos3[2] - 1) then
						if pos4[1] == pos5[1] and (pos4[2] == pos5[2] - 1 or pos5[2] == pos4[2] - 1) then
							if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3) and self.tabuleiro:marcaPosicao(pos4)
								and self.tabuleiro:marcaPosicao(pos5)) then
								self.tabuleiro:marcaPosicao(pos1)
								self.tabuleiro:marcaPosicao(pos2)
								self.tabuleiro:marcaPosicao(pos3)
								self.tabuleiro:marcaPosicao(pos4)
								self.tabuleiro:marcaPosicao(pos5)
								return true
							end
						end
					end
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if pos2[2] == pos3[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) + 1]) then
					if pos3[2] == pos4[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1]) - 1] or
						self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1]) + 1]) then
						if pos4[2] == pos5[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos5[1]) - 1] or
							self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos5[1]) + 1]) then
							if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3) and self.tabuleiro:marcaPosicao(pos4)
								and self.tabuleiro:marcaPosicao(pos5)) then
								self.tabuleiro:marcaPosicao(pos1)
								self.tabuleiro:marcaPosicao(pos2)
								self.tabuleiro:marcaPosicao(pos3)
								self.tabuleiro:marcaPosicao(pos4)
								self.tabuleiro:marcaPosicao(pos5)
								return true
							end
						end
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4)
		if self.tabuleiro[pos1] ~= nil and self.tabuleiro[pos2] ~= nil and self.tabuleiro[pos3] ~= nil and self.tabuleiro[pos4] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if pos3[1] == pos4[1] and (pos3[2] == pos4[2] - 1 or pos4[2] == pos3[2] - 1) then
						if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3) and self.tabuleiro:marcaPosicao(pos4)) then
							self.tabuleiro:marcaPosicao(pos1)
							self.tabuleiro:marcaPosicao(pos2)
							self.tabuleiro:marcaPosicao(pos3)
							self.tabuleiro:marcaPosicao(pos4)
							return true
						end
					end
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if pos2[2] == pos3[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) + 1]) then
					if pos3[2] == pos4[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1]) - 1] or
						self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos4[1]) + 1]) then
						if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3) and self.tabuleiro:marcaPosicao(pos4)) then
							self.tabuleiro:marcaPosicao(pos1)
							self.tabuleiro:marcaPosicao(pos2)
							self.tabuleiro:marcaPosicao(pos3)
							self.tabuleiro:marcaPosicao(pos4)
							return true
						end
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesContratorpedo(pos1, pos2, pos3)
		if self.tabuleiro[pos1] ~= nil and self.tabuleiro[pos2] ~= nil and self.tabuleiro[pos3] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3)) then
						self.tabuleiro:marcaPosicao(pos1)
						self.tabuleiro:marcaPosicao(pos2)
						self.tabuleiro:marcaPosicao(pos3)
						return true
					end
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if pos2[2] == pos3[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) + 1]) then
					if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2) and self.tabuleiro:marcaPosicao(pos3)) then
						self.tabuleiro:marcaPosicao(pos1)
						self.tabuleiro:marcaPosicao(pos2)
						self.tabuleiro:marcaPosicao(pos3)
						return true
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesSubmarino(pos1, pos2)
		if self.tabuleiro[pos1] ~= nil and self.tabuleiro[pos2] ~= nil and self.tabuleiro[pos3] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2)) then
					self.tabuleiro:marcaPosicao(pos1)
					self.tabuleiro:marcaPosicao(pos2)
					return true
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if (self.tabuleiro:marcaPosicao(pos1) and self.tabuleiro:marcaPosicao(pos2)) then
					self.tabuleiro:marcaPosicao(pos1)
					self.tabuleiro:marcaPosicao(pos2)
					return true
				end
			end
		end
		return false
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
