class Usuario < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def password_required?
    super if confirmed?
  end

  def password_match?
    self.errors[:password] << 'Não pode ser vazio' if password.blank?
    self.errors[:password_confirmation] << 'Não pode ser vazio' if password_confirmation.blank?
    self.errors[:password_confirmation] << 'Senhas não são iguais' if password != password_confirmation
    password = password_confirmation && !password.blank?
  end

  def disable
    self.ativo = false 
  end
end
