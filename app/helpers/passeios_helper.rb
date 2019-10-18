module PasseiosHelper
	def data_formatada(data)
    data.nil? ? nil : l(data, format: :data_hora)
  end

  def confere_cachorros(cachorro_1, cachorro_2, cachorro_3)
  	cachorros = ''

  	if !cachorro_1.nil?
  		cachorros << cachorro_1.nome
  	end

  	if !cachorro_2.nil?
  		if cachorros.blank?
  			cachorros << cachorro_2.nome
  		else
  			cachorros << ', ' << cachorro_2.nome
  		end
  	end

  	if !cachorro_3.nil?
  		if cachorros.blank?
  			cachorros << cachorro_3.nome
  		else
  			cachorros << ', ' << cachorro_3.nome
  		end
  	end

  	return cachorros
  end
end
