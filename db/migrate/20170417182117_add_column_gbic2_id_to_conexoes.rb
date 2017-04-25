class AddColumnGbic2IdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :gbic_site_id, :integer
  end
end
