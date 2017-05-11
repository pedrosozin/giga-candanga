class Conexao < ApplicationRecord
	has_many :fusoes
	belongs_to :site
	belongs_to :caixaemenda
end
