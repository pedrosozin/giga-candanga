class CreateResponsavelTipos < ActiveRecord::Migration[5.0]
  def change
    create_table :responsavel_tipos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
