class RepasseCategoria < ApplicationRecord
  validates :nome, presence: true, length: {in: 1..255}

  scope :ativas, -> { where(ativa: true).order(:created_at) }

  scope :inativas, -> { where(ativa: false).order(:created_at) }

  def desativa
    self.ativa = false
    save
  end

  def reativa
    self.ativa = true
    save
  end
end
