class Gbic < ApplicationRecord
	belongs_to :porta_slot
	has_many :portadgos
end
