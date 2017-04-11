class Dgo < ApplicationRecord
	has_many :portadgos	
	belongs_to :segmento
	has_one :trecho
	has_one :caboacesso
	belongs_to :site
end
