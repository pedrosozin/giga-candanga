class AddColumnSwitch2IdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :switch_site_id, :integer
  end
end
