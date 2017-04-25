class AddColumnDgoIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :dgo_site_id, :integer
  end
end
