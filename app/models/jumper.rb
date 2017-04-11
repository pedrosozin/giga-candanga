class Jumper < ApplicationRecord
  belongs_to :portadgo
  belongs_to :portadgo2, class_name: "Portadgo"

  after_create :create_inverse, unless: :has_inverse?
  after_destroy :destroy_inverses, if: :has_inverse?

  def create_inverse
    self.class.create(inverse_jumper_options)
  end

  def destroy_inverses
    inverses.destroy_all
  end

  def has_inverse?
    self.class.exists?(inverse_jumper_options)
  end

  def inverses
    self.class.where(inverse_jumper_options)
  end

  def inverse_jumper_options
    { portadgo2_id: portadgo_id, portadgo_id: portadgo2_id }
  end
end
