local placar = {}

function placar.novo()
	local instancia = {
		pontos = 0
	}

	function instancia:incrementaPontos(tipoDeBarco)
		if tipoDeBarco == "porta" then
			self.pontos = self.pontos + 1
		elseif tipoDeBarco == "navio" then
			self.pontos = self.pontos + 2
		elseif tipoDeBarco == "contratorpedeiro" then
			self.pontos = self.pontos + 3
		elseif tipoDeBarco == "submarino" then
			self.pontos = self.pontos + 4
		end
	end

	function instancia:decrementaPontos()
		self.pontos = self.pontos - 1
	end

	return instancia
end

return placar
