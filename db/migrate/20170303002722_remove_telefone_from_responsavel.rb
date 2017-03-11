class RemoveTelefoneFromResponsavel < ActiveRecord::Migration[5.0]
  def up
    remove_column :responsaveis, :telefone, :string
  end

  def down
    add_column :responsaveis, :telefone, :string
  end
end
