class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  validates :nome, presence: true
  validates :telefone, presence: {alert: "Telefone inválido"},
                       length: {minimum: 8, maximum: 13}

  def self.all_active
    self.where(ativo: true)
  end

  def deactivate
    self.update(ativo:false) unless self.class.where(ativo: true).second.nil?
  end
end
