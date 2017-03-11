class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def self.all_active
    self.where(ativo: true)
  end

  def deactivate
    self.update(ativo: false)
  end
end
