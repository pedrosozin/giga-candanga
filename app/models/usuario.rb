class Usuario < ApplicationRecord
  has_one :complemento, inverse_of: :usuario
  accepts_nested_attributes_for :complemento, reject_if: proc {|attr| attr[:nome,:telefone].blank? }, allow_destroy: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
