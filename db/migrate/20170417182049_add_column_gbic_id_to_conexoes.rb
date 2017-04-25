class AddColumnGbicIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :gbic_origem_id, :integer
  end
end
