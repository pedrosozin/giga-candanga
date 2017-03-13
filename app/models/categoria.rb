class Categoria < ApplicationRecord
  validates :nome, presence: true, length: {in: 2..255}
  has_many :instituicoes

  scope :ativas, -> { where(ativa: true) }
  scope :inativas, -> { where(ativa: false) }

  def desativa
    self.ativa = false
    save
  end

  def ativar
    self.ativa = true
    save
  end
end
