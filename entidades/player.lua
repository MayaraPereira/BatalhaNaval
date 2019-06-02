local player = {}

function player.novo(nome,tabuleiro)
	local instancia = {
		nome = nome,
		tabuleiro = tabuleiro
	}

	-- permite manipular strigs com indices
	getmetatable('').__index = function(str,i) return string.sub(str,i,i) end
	getmetatable('').__call = function(str,i,j)
		if type(i)~='table' then return string.sub(str,i,j)
		else local t={}
			for k,v in ipairs(i) do
				t[k]=string.sub(str,v,v)
			end
			return table.concat(t)
		end
	end

	function instancia:escolher_posicoesPortaAvioes(pos1, pos2, pos3, pos4, pos5, cont) -- primeiro letra (horizontal) depois numero (vertical)
		if self.tabuleiro[self.tabuleiro:capturaIndex(pos1)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos2)] ~= nil
			and self.tabuleiro[self.tabuleiro:capturaIndex(pos3)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos4)] ~= nil
			and self.tabuleiro[self.tabuleiro:capturaIndex(pos5)] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if pos3[1] == pos4[1] and (pos3[2] == pos4[2] - 1 or pos4[2] == pos3[2] - 1) then
						if pos4[1] == pos5[1] and (pos4[2] == pos5[2] - 1 or pos5[2] == pos4[2] - 1) then
							if self.tabuleiro:marcaPosicao(pos1, "PA", cont) == true and self.tabuleiro:marcaPosicao(pos2, "PA", cont) == true
								and self.tabuleiro:marcaPosicao(pos3, "PA", cont) == true and self.tabuleiro:marcaPosicao(pos4, "PA", cont) == true
								and self.tabuleiro:marcaPosicao(pos5, "PA", cont) == true then
								self.tabuleiro:marcaPosicao(pos1, "PA", cont)
								self.tabuleiro:marcaPosicao(pos2, "PA", cont)
								self.tabuleiro:marcaPosicao(pos3, "PA", cont)
								self.tabuleiro:marcaPosicao(pos4, "PA", cont)
								self.tabuleiro:marcaPosicao(pos5, "PA", cont)
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
							if self.tabuleiro:marcaPosicao(pos1, "PA", cont) == true and self.tabuleiro:marcaPosicao(pos2, "PA", cont) == true
								and self.tabuleiro:marcaPosicao(pos3, "PA", cont) == true	and self.tabuleiro:marcaPosicao(pos4, "PA", cont) == true
								and self.tabuleiro:marcaPosicao(pos5, "PA", cont) == true then
								self.tabuleiro:marcaPosicao(pos1, "PA", cont)
								self.tabuleiro:marcaPosicao(pos2, "PA", cont)
								self.tabuleiro:marcaPosicao(pos3, "PA", cont)
								self.tabuleiro:marcaPosicao(pos4, "PA", cont)
								self.tabuleiro:marcaPosicao(pos5, "PA", cont)
								return true
							end
						end
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesNavioTanque(pos1, pos2, pos3, pos4, cont)
		if self.tabuleiro[self.tabuleiro:capturaIndex(pos1)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos2)] ~= nil
			and self.tabuleiro[self.tabuleiro:capturaIndex(pos3)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos4)] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if pos3[1] == pos4[1] and (pos3[2] == pos4[2] - 1 or pos4[2] == pos3[2] - 1) then
						if self.tabuleiro:marcaPosicao(pos1, "NT", cont) == true and self.tabuleiro:marcaPosicao(pos2, "NT", cont) == true
							and self.tabuleiro:marcaPosicao(pos3, "NT", cont) == true and self.tabuleiro:marcaPosicao(pos4, "NT", cont) == true then
							self.tabuleiro:marcaPosicao(pos1, "NT", cont)
							self.tabuleiro:marcaPosicao(pos2, "NT", cont)
							self.tabuleiro:marcaPosicao(pos3, "NT", cont)
							self.tabuleiro:marcaPosicao(pos4, "NT", cont)
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
						if self.tabuleiro:marcaPosicao(pos1, "NT", cont) == true and self.tabuleiro:marcaPosicao(pos2, "NT", cont) == true
							and self.tabuleiro:marcaPosicao(pos3, "NT", cont) == true and self.tabuleiro:marcaPosicao(pos4, "NT", cont) == true then
							self.tabuleiro:marcaPosicao(pos1, "NT", cont)
							self.tabuleiro:marcaPosicao(pos2, "NT", cont)
							self.tabuleiro:marcaPosicao(pos3, "NT", cont)
							self.tabuleiro:marcaPosicao(pos4, "NT", cont)
							return true
						end
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesContratorpedo(pos1, pos2, pos3, cont)
		if self.tabuleiro[self.tabuleiro:capturaIndex(pos1)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos2)] ~= nil
			and self.tabuleiro[self.tabuleiro:capturaIndex(pos3)] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if pos2[1] == pos3[1] and (pos2[2] == pos3[2] - 1 or pos3[2] == pos2[2] - 1) then
					if self.tabuleiro:marcaPosicao(pos1, "CT", cont) == true and self.tabuleiro:marcaPosicao(pos2, "CT", cont) == true
						and self.tabuleiro:marcaPosicao(pos3, "CT", cont) == true then
						self.tabuleiro:marcaPosicao(pos1, "CT", cont)
						self.tabuleiro:marcaPosicao(pos2, "CT", cont)
						self.tabuleiro:marcaPosicao(pos3, "CT", cont)
						return true
					end
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if pos2[2] == pos3[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos3[1]) + 1]) then
					if self.tabuleiro:marcaPosicao(pos1, "CT", cont) == true and self.tabuleiro:marcaPosicao(pos2, "CT", cont) == true
						and self.tabuleiro:marcaPosicao(pos3, "CT", cont) == true then
						self.tabuleiro:marcaPosicao(pos1, "CT", cont)
						self.tabuleiro:marcaPosicao(pos2, "CT", cont)
						self.tabuleiro:marcaPosicao(pos3, "CT", cont)
						return true
					end
				end
			end
		end
		return false
	end

	function instancia:escolher_posicoesSubmarino(pos1, pos2, cont)
		if self.tabuleiro[self.tabuleiro:capturaIndex(pos1)] ~= nil and self.tabuleiro[self.tabuleiro:capturaIndex(pos2)] ~= nil
			and self.tabuleiro[self.tabuleiro:capturaIndex(pos3)] ~= nil then
			if pos1[1] == pos2[1] and (pos1[2] == pos2[2] - 1 or pos2[2] == pos1[2] - 1) then
				if self.tabuleiro:marcaPosicao(pos1, "S", cont) == true and self.tabuleiro:marcaPosicao(pos2, "S", cont) == true then
					self.tabuleiro:marcaPosicao(pos1, "S", cont)
					self.tabuleiro:marcaPosicao(pos2, "S", cont)
					return true
				end
			elseif pos1[2] == pos2[2] and (self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) - 1] or
					self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos1[1])] == self.tabuleiro.letras[self.tabuleiro:capturaIndex(pos2[1]) + 1]) then
				if self.tabuleiro:marcaPosicao(pos1, "S", cont) == true and self.tabuleiro:marcaPosicao(pos2, "S", cont) == true then
					self.tabuleiro:marcaPosicao(pos1, "S", cont)
					self.tabuleiro:marcaPosicao(pos2, "S", cont)
					return true
				end
			end
		end
		return false
	end

	function instancia:joga(posicao)
		-- chama marcaPosicao de tabuleiro
		if self.tabuleiro[self.tabuleiro:capturaIndex(posicao)] ~= nil then
			return self.tabuleiro:marcaPosicao(posicao, "tiro", 0)
		end
		return false
	end

	function instancia:cancelaPartida()
		-- chama finalizaJogo de partida
	end

	return instancia
end

return player
