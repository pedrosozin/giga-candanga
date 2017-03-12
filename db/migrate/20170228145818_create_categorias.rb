class CreateCategorias < ActiveRecord::Migration[5.0]
  def change
    create_table :categorias do |t|
      t.string :nome
      t.boolean :ativa, default: :true
      t.timestamps
    end
  end
end
