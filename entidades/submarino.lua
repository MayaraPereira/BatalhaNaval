local navio = require("entidades/navio")
local submarino = {}

function submarino.novo()
	local instancia = navio.novo("submarino", 2)
	posicionamento = {}

	function instancia:adicionar_posicao(posicao)
		table.insert(posicionamento, posicao)
	end
	return instancia
end

return submarino
