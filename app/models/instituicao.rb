class Instituicao < ApplicationRecord
  belongs_to :categoria, required: true
  has_one :endereco, inverse_of: :instituicao, dependent: :destroy
  has_many :responsaveis, inverse_of: :instituicao, dependent: :destroy

  validates :nome, presence: true, length: {in: 2..255}
  validates :sigla, presence: true
  validates :resumo, length: {in: 0..500}

  accepts_nested_attributes_for :endereco, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :responsaveis, allow_destroy: true, reject_if: proc {|atts| deep_blank?(atts) }

  scope :ativas, -> { where(se_ativa: true) }

  def arquiva
    update_attributes(se_ativa: false)
  end

  def ativa
    update_attributes(se_ativa: true)
  end

  def self.deep_blank?(hash)
    hash.each do |key, value|
      next if key == "_destroy" || key == "responsavel_tipo_id"
      any_blank = value.is_a?(Hash) ? deep_blank?(value) : value.blank?
      return false unless any_blank
    end
    true
  end

  def build_form_dependency(tipos_responsavel)
    get_map_tipos_responsavel(tipos_responsavel).each {|n|
      responsaveis.build(responsavel_tipo_id: n)
    }

    build_fields_responsaveis
    build_endereco if endereco.blank?
  end

  def build_form_when_error(tipos_responsavel)
    responsavel_tipos = get_map_tipos_responsavel(tipos_responsavel)
    responsaveis_vazios = responsaveis.select {|r| r.responsavel_tipo.blank? }

    responsavel_tipos.zip(responsaveis_vazios).each {|rt, r|
      r.present? ? r.responsavel_tipo_id = rt : responsaveis.build(responsavel_tipo_id: rt)
    }

    build_fields_responsaveis

    build_endereco if endereco.blank?
  end

  def build_fields_responsaveis
    responsaveis.each do |responsavel|
      responsavel.telefones.build if responsavel.telefones.blank?
      responsavel.emails.build if responsavel.emails.blank?
    end
  end

  def get_map_tipos_responsavel(tipos_responsavel)
    tipos_responsavel.map(&:id) - responsaveis.map(&:responsavel_tipo_id)
  end
end
