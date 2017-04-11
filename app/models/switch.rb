class Switch < ApplicationRecord
	belongs_to :site
	has_many :slots
end
