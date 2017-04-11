class Slot < ApplicationRecord
	belongs_to :switch
	has_many :porta_slots
end
