class AddColumnSwitchIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :switch_origem_id, :integer
  end
end
