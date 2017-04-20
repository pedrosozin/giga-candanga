json.extract! incidente, :id, :trecho_id, :cod, :data, :latitude, :longitude, :responsavel, :created_at, :updated_at
json.url incidente_url(incidente, format: :json)