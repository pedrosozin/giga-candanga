class Caixaemenda < ApplicationRecord
	has_and_belongs_to_many :segmentos
	has_one :poste
	has_one :caixasub
	has_and_belongs_to_many :trechos
	has_and_belongs_to_many :fibras
	belongs_to :conexao

end
