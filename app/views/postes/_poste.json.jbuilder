json.extract! poste, :id, :cod, :latitude, :longitude, :reserva_id, :created_at, :updated_at
json.url poste_url(poste, format: :json)