class AddTelefoneToComplemento < ActiveRecord::Migration[5.0]
  def change
    add_column :complementos, :telefone, :string
  end
end
