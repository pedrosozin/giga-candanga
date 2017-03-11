class ResponsavelTipo < ApplicationRecord
  has_many :responsaveis, inverse_of: :responsavel_tipo

  validates :descricao, presence: true, length: {in: 4..255}
end
