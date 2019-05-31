local navio = require("entidades/navio")
local navioTanque = {}

function navioTanque.novo()
	local instancia = navio.novo("navio", 4)

	posicionamento = {}

	function instancia:adicionar_posicao(posicao)
		table.insert(posicao, posicionamento)
	end
	return instancia

end

return navioTanque
