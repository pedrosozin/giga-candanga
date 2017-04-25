class Conexao < ApplicationRecord
	has_many :fusoes
	belongs_to :site
end
