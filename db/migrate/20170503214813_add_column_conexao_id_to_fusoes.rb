class AddColumnConexaoIdToFusoes < ActiveRecord::Migration[5.0]
  def change
    add_column :fusoes, :conexao_id, :integer
    add_index :fusoes, :conexao_id
  end

end
