class RepasseCategoria < ApplicationRecord

  validates :nome, presence: true, length: {in: 1..255}
  
  scope :ativas, lambda { where(ativa: true).order(:created_at)}

  scope :inativas, lambda { where(ativa: false).order(:created_at)}

  def desativa
    self.ativa = false
    self.save
  end

  def reativa
    self.ativa = true
    self.save
  end

end
