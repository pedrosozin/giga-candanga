class Segmento < ApplicationRecord
	has_many :dgos
	has_and_belongs_to_many :caixaemendas
	has_many :trechos
end	
