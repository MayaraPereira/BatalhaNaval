local navio = require("entidades/navio")
local contratorpedo = {}

function contratorpedo.novo()
	local instancia = navio.novo("contratorpedo", 3)
	posicionamento = {}

	function instancia:adicionar_posicao(posicao)
		table.insert(posicionamento, posicao)
	end

	return instancia
end

return contratorpedo
