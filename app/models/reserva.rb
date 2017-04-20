class Reserva < ApplicationRecord
	has_one :poste
	has_one :caixasub
end
