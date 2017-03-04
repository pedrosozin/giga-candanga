json.extract! instituicao, :id, :nome, :references, :sigla, :cnpj, :data_aprovacao, :resumo, :site, :created_at, :updated_at
json.url instituicao_url(instituicao, format: :json)