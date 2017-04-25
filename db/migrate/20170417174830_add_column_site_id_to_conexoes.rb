class AddColumnSiteIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :site_id, :integer
  end
end
