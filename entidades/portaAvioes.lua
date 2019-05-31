local navio = require("entidades/navio")
local portaAvioes = {}

function portaAvioes.novo()
	local instancia = navio.novo("porta", 5)
	posicionamento = {}

	function instancia:adicionar_posicao(posicao)
		table.insert(posicao, posicionamento)
	end
	return instancia

end

return portaAvioes
