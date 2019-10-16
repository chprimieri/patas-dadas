module PasseiosHelper
	def data_formatada(data)
    data.nil? ? nil : l(data, format: :data_hora)
  end
end
