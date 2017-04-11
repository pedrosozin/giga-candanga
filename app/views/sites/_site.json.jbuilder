json.extract! site, :id, :ipa_id, :nome, :latitude, :longitude, :largura_banda, :tipo, :created_at, :updated_at
json.url site_url(site, format: :json)