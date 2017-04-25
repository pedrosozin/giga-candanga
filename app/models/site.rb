class Site < ApplicationRecord
	belongs_to :instituicao
	has_many :geradores
	has_many :nobreaks
	has_many :switches
	has_many :dgos
	has_many :conexoes
end
