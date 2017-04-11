json.extract! reserva, :id, :cod, :comprimento, :latitude, :longitude, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)