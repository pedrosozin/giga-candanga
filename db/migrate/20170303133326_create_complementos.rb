class CreateComplementos < ActiveRecord::Migration[5.0]
  def change
    create_table :complementos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
