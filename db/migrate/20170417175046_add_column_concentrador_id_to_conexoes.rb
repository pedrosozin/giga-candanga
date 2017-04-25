class AddColumnConcentradorIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :concentrador_id, :integer
  end
end
