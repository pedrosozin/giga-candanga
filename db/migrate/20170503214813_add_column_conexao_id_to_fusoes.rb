class AddColumnConexaoIdToFusoes < ActiveRecord::Migration[5.0]
  def change
    add_column :fusoes, :conexao_id, :integer
  end
end
