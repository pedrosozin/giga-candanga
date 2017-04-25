class Ipa < ApplicationRecord
	has_many :contatos
	has_many :sites
	has_one :caboacesso
end
