class Endereco < ApplicationRecord
  belongs_to :instituicao

  validates :cep, presence: true, length: {in: 7..15}
  
  validates :cidade, presence:true

  validates :estado, presence:true

  validates :endereco, presence: true
end
