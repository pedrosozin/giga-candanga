class Complemento < ApplicationRecord
  belongs_to :usuario, inverse_of: :complemento
end
