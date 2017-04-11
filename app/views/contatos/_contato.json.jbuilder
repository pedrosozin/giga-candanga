json.extract! contato, :id, :nome, :telefone, :tipo, :email, :prioridade, :ipa_id, :created_at, :updated_at
json.url contato_url(contato, format: :json)