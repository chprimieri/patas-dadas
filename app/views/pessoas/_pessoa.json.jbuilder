json.extract! pessoa, :id, :nome, :data_de_nascimento, :email, :telefone, :foto, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)
