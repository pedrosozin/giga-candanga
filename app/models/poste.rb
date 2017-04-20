class Poste < ApplicationRecord
	belongs_to :reserva, optional: true
	belongs_to :caixaemenda, optional: true
	has_and_belongs_to_many :trechos
end
