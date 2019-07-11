json.extract! cachorro, :id, :nome, :data_de_nascimento, :sexo, :porte, :foto, :status, :observacoes, :equipamento, :dupla_id, :frequencia, :duracao, :areas, :disponivel_para_passeio, :created_at, :updated_at
json.url cachorro_url(cachorro, format: :json)
