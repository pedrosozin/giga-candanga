class Fusao < ApplicationRecord
  belongs_to :fibra
  belongs_to :fibra2, class_name: "Fibra"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_fusao_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_fusao_options)
  end

  def inverses
    self.class.where(inverse_fusao_options)
  end

  def inverse_jumper_options
    { fibra2_id: fibra_id, fibra_id: fibra_id }
  end
end
