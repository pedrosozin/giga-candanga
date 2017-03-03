class AddUsuarioRefToComplemento < ActiveRecord::Migration[5.0]
  def change
    add_reference :complementos, :usuario, foreign_key: true
  end
end
