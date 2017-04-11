class Trecho < ApplicationRecord
	has_many :incidentes
	belongs_to :segmento
	belongs_to :dgo, optional: true
	has_and_belongs_to_many :caixaemendas
	has_and_belongs_to_many :caixasubs
	has_and_belongs_to_many :postes
	has_many :tubelooses
	belongs_to :caboacesso, optional: true
	scope :por_segmento, -> segmento { where(:segmento => segmento) }
end
