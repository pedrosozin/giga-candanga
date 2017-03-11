class Responsavel < ApplicationRecord
  belongs_to :responsavel_tipo, optional: true
  belongs_to :instituicao

  validates :nome, presence: true

  has_many :emails, inverse_of: :responsavel, :dependent => :destroy
  has_many :telefones, inverse_of: :responsavel, :dependent => :destroy

  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: :all_blank
    # proc { |atts|
    # atts["email"].blank?
  # }
  accepts_nested_attributes_for :telefones, allow_destroy: true, reject_if: :all_blank
    # proc { |atts|
    # atts["numero"].blank?
  # }

end
