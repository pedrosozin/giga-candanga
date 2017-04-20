class Fibra < ApplicationRecord
	belongs_to :tubeloose
	has_and_belongs_to_many :caixaemendas
	has_and_belongs_to_many :uplinks
	belongs_to :portadgo
	has_one :fusao

end
