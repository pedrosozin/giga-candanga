class AddColumnCaboacessoIdToConexoes < ActiveRecord::Migration[5.0]
  def change
    add_column :conexoes, :caboacesso_id, :integer
  end
end
