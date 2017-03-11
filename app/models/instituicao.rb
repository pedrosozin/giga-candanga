class Instituicao < ApplicationRecord
  validates :nome, presence:true, length: { in: 2..255 }
  validates :sigla, presence: true
  validates :resumo, length: {in: 2..500}

  belongs_to :categoria, required: true

  has_one :endereco, inverse_of: :instituicao, :dependent => :destroy
  has_many :responsaveis, inverse_of: :instituicao,:dependent => :destroy

  accepts_nested_attributes_for :endereco, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :responsaveis, allow_destroy:true,  reject_if: proc{ |atts| deep_blank?(atts) }

  scope :ativas, lambda { where(se_ativa: true)}
  scope :search, -> (query) { where('upper(nome) like ? OR upper( sigla ) LIKE ?',"%#{query.upcase}%","%#{query.upcase}%") }


  def arquiva
    self.se_ativa = false;
    self.save
  end

  def ativa
    self.se_ativa = true
    self.save
  end

  def self.deep_blank?(hash)
    hash.each do |key, value|
      next if key == '_destroy' or key =='responsavel_tipo_id'
      any_blank = value.is_a?(Hash) ? deep_blank?(value) : value.blank?
      return false unless any_blank
    end
    true
  end


  def build_form_dependency(res_types)
    ((res_types.map {|rt| rt.id}) - (self.responsaveis.map {|r| r.responsavel_tipo_id})).each { |n|
      self.responsaveis.build(:responsavel_tipo_id => n)
    }

    self.responsaveis.each do |r|
      puts r.attributes
    end

    self.responsaveis.each do |r|
      if r.telefones.blank?
        r.telefones.build
      end

      if r.emails.blank?
        r.emails.build
      end
    end

    if self.endereco.blank?
      self.build_endereco
    end
  end

  def build_form_when_error(res_types)

    res_t_arr = ((res_types.map {|rt| rt.id}) - (self.responsaveis.map {|r| r.responsavel_tipo_id}))
    res_arr = self.responsaveis.select {|r| r.responsavel_tipo.blank?}

    res_t_arr.zip(res_arr).each { |rt, r| 
      if r.present? 
        r.responsavel_tipo_id = rt
      else
        self.responsaveis.build(:responsavel_tipo_id => rt)
      end
    }

    self.responsaveis.each do |r|
      if r.telefones.blank?
        r.telefones.build
      end

      if r.emails.blank?
        r.emails.build
      end
    end

    if self.endereco.blank?
      self.build_endereco
    end
  end


  private

  def categoria_existence
    if(not self.categoria_id.blank?)
      if Categoria.find_by(id: self.categoria_id).blank?
        self.errors.add(:categoria, "é obrigatório(a)")
      end
    end
  end


end
