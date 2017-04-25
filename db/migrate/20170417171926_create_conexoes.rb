class CreateConexoes < ActiveRecord::Migration[5.0]
  def change
    create_table :conexoes do |t|
      t.timestamps
    end
  end
end
