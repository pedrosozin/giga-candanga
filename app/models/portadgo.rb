class Portadgo < ApplicationRecord
	belongs_to :gbic
	has_one :jumper
	has_one :portadgo2, through: :jumpers
	belongs_to :dgo
	has_one :fibra
end
