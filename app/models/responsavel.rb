class Responsavel < ApplicationRecord
  belongs_to :responsavel_tipo, optional: true
  belongs_to :instituicao

  validates :nome, presence: true
  validates :cargo, presence: true

  has_many :emails, inverse_of: :responsavel
  has_many :telefones, inverse_of: :responsavel

  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: :all_blank
    # proc { |atts|
    # atts["email"].blank?
  # }
  accepts_nested_attributes_for :telefones, allow_destroy: true, reject_if: :all_blank
    # proc { |atts|
    # atts["numero"].blank?
  # }

end
