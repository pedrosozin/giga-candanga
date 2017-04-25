class AddColumnCaixaemendaIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :caixaemenda_id, :integer
  end
end
