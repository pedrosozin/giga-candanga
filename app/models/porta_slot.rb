class PortaSlot < ApplicationRecord
	belongs_to :slot
	has_one :gbic
end
