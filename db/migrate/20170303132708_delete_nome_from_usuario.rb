class DeleteNomeFromUsuario < ActiveRecord::Migration[5.0]
  def change
    remove_column :usuarios, :nome
  end
end
