class AddFieldsToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :usuarios, :ativo, :boolean
    add_column :usuarios, :nome, :string
    add_column :usuarios, :telefone, :string
  end
end
