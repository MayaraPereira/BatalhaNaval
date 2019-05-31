local tabuleiro = {}

function tabuleiro.novo(tipo)
	local instancia = {
		posicoes = {},
		statusPosicao = {},
		qtdPosicoesNavios = 0,
		tipo = tipo
	}

	function instancia:montarTabuleiro(tipo)
		-- aqui ja define tamanho e posicoes de acordo com o tipo
		if tipo == 1 then
			self.posicoes = {"A1", "A2", "A3", "A4", "A5","B1", "B2", "B3", "B4", "B5", "C1", "C2", "C3", "C4", "C5",
						"D1", "D2", "D3", "D4", "D5", "E1", "E2", "E3", "E4", "E5"}
			self.statusPosicao = {"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia"}
			self.qtdPosicoesNavios = 4
		elseif tipo == 2 then
			self.posicoes = {"A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10",
						"C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10",
						"E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10",
						"G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10",
						"I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10"}
			self.statusPosicao = {"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia"}
			self.qtdPosicoesNavios = 10
		elseif tipo == 3 then
			self.posicoes = {"A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "A9", "A10", "A11", "A12", "A13", "A14", "A15", "A16", "A17", "A18", "A19", "A20",
						"B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8", "B9", "B10", "B11", "B12", "B13", "B14", "B15", "B16", "B17", "B18", "B19", "B20",
						"C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "C11", "C12", "C13", "C14", "C15", "C16", "C17", "C18", "C19", "C20",
						"D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "D11", "D12", "D13", "D14", "D15", "D16", "D17", "D18", "D19", "D20",
						"E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8", "E9", "E10", "E11", "E12", "E13", "E14", "E15", "E16", "E17", "E18", "E19", "E20",
						"F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10", "F11", "F12", "F13", "F14", "F15", "F16", "F17", "F18", "F19", "F20",
						"G1", "G2", "G3", "G4", "G5", "G6", "G7", "G8", "G9", "G10", "G11", "G12", "G13", "G14", "G15", "G16", "G17", "G18", "G19", "G20",
						"H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "H11", "H12", "H13", "H14", "H15", "H16", "H17", "H18", "H19", "H20",
						"I1", "I2", "I3", "I4", "I5", "I6", "I7", "I8", "I9", "I10", "I11", "I12", "I13", "I14", "I15", "I16", "I17", "I18", "I19", "I20",
						"J1", "J2", "J3", "J4", "J5", "J6", "J7", "J8", "J9", "J10", "J11", "J12", "J13", "J14", "J15", "J16", "J17", "J18", "J19", "J20",
						"K1", "K2", "K3", "K4", "K5", "K6", "K7", "K8", "K9", "K10", "K11", "K12", "K13", "K14", "K15", "K16", "K17", "K18", "K19", "K20",
						"L1", "L2", "L3", "L4", "L5", "L6", "L7", "L8", "L9", "L10", "L11", "L12", "L13", "L14", "L15", "L16", "L17", "L18", "L19", "L20",
						"M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "M10", "M11", "M12", "M13", "M14", "M15", "M16", "M17", "M18", "M19", "M20",
						"N1", "N2", "N3", "N4", "N5", "N6", "N7", "N8", "N9", "N10", "N11", "N12", "N13", "N14", "N15", "N16", "N17", "N18", "N19", "N20",
						"O1", "O2", "O3", "O4", "O5", "O6", "O7", "O8", "O9", "O10", "O11", "O12", "O13", "O14", "O15", "O16", "O17", "O18", "O19", "O20",
						"R1", "R2", "R3", "R4", "R5", "R6", "R7", "R8", "R9", "R10", "R11", "R12", "R13", "R14", "R15", "R16", "R17", "R18", "R19", "R20",
						"S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10", "S11", "S12", "S13", "S14", "S15", "S16", "S17", "S18", "S19", "S20",
						"T1", "T2", "T3", "T4", "T5", "T6", "T7", "T8", "T9", "T10", "T11", "T12", "T13", "T14", "T15", "T16", "T17", "T18", "T19", "T20",
						"U1", "U2", "U3", "U4", "U5", "U6", "U7", "U8", "U9", "U10", "U11", "U12", "U13", "U14", "U15", "U16", "U17", "U18", "U19", "U20",
						"V1", "V2", "V3", "V4", "V5", "V6", "V7", "V8", "V9", "V10", "V11", "V12", "V13", "V14", "V15", "V16", "V17", "V18", "V19", "V20"}
			self.statusPosicao = {"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia",
							"vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia", "vazia"}
			self.qtdPosicoesNavios = 20
		else
			print("Tipo inválido!")
			return false
		end

		return posicoes, statusPosicao, qtdPosicoesNavios

	end

	-- o metodo verifica qual tipo do tabuleiro
	function instancia:verificaTipo()
		return self.tipo
	end

	-- o metodo verifica qual a dimensao do tabuleiro (5x5, 10x10 ou 20x20)
	function instancia:verificaTamanho(tipoTab)
		if tipoTab == 1 then
			return 5
		elseif tipoTab == 2 then
			return 10
		elseif tipoTab  == 3 then
			return 20
		end
	end

	-- o metodo verifica se a posicao esta com status vazio, branco, vermelho ou preto
	function instancia:verificaPosicao(posicao)
		-- mostra o status da posicao do tabuleiro
		return self.statusPosicao[self.posicoes(posicao)]
	end

	-- o metodo marca a posicao de acordo com o status da posicao escolhida
	function instancia:marcaPosicao(posicao, operacao)
		if operacao == "tiro" then
			if self.statusPosicao[self:capturaIndex(posicao)] == "vazia" then
				self.statusPosicao[self:capturaIndex(posicao)] = "branco"
				return true
			elseif self.statusPosicao[self:capturaIndex(posicao)] == "preto" then
				self.statusPosicao[self:capturaIndex(posicao)] = "vermelho"
				self.qtdPosicoesNavios = self.qtdPosicoesNavios - 1
				return true
				-- diminuir posicao no barco atingido
			end
		else
			if self.statusPosicao[self:capturaIndex(posicao)] == "vazia" then
				self.statusPosicao[self:capturaIndex(posicao)] = "preto"
				if operacao == "PA" then
					-- acrescentar posicao no barco porta avioes
				elseif operacao == "NT" then
					-- acrescentar posicao no barco porta avioes
				elseif operacao == "CT" then
					-- acrescentar posicao no barco porta avioes
				elseif operacao == "S" then
					-- acrescentar posicao no barco porta avioes
				else
					print("Operacao invalida")
					return false
				end
				return true
			elseif self.statusPosicao[self:capturaIndex(posicao)] == "preto" then
				print("posicao ocupada")
				return false
			else
				print("erro de operacao - tabuleiro metodo marcaPosicao")
				return false
			end
		end
	end

	-- crian uma lista com todos os indices
	function instancia:capturaIndex(posicao)
		local index = {}
		for k,v in pairs(self.posicoes) do
			index[v]=k
		end

		return index[posicao]
	end

	return instancia
end

return tabuleiro
