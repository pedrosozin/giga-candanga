class AddAtivoToComplemento < ActiveRecord::Migration[5.0]
  def change
    add_column :complementos, :ativo, :boolean
  end
end
