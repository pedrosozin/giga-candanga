class Caboacesso < ApplicationRecord
	has_many :trechos
	belongs_to :site, optional: true
	belongs_to :dgo, optional: true
end
