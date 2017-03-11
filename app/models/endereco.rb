class Endereco < ApplicationRecord
  belongs_to :instituicao

  validates :cep,  length: {in: 6..15}
end
