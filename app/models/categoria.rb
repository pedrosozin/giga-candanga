class Categoria < ApplicationRecord
  validates :nome, presence: true, length: { in: 2..255}

  scope :ativas, lambda { where(ativa: true)}
  scope :inativas, lambda { where(ativa: false)}


  def desativa
    self.ativa = false
    self.save
  end

  def ativar
    self.ativa = true
    self.save
  end

  private

end
