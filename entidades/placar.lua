local placar = {}

function placar.novo(dono)
	local instancia = {
		dono = dono,
		pontos = 0
	}

	function instancia:incrementaPontos(tipoDeBarco)
		if tipoDeBarco == "porta" then
			pontos = pontos + 1
		elseif tipoDeBarco == "navio" then
			pontos = pontos + 2
		elseif tipoDeBarco == "contratorpedeiro" then
			pontos = pontos + 3
		elseif tipoDeBarco == "submarino" then
			pontos = pontos + 4
		end
	end

	return instancia
end

return placar
