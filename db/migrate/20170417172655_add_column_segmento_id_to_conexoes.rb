class AddColumnSegmentoIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :segmento_id, :integer
  end
end
