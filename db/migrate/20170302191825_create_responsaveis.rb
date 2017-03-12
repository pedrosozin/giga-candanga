class CreateResponsaveis < ActiveRecord::Migration[5.0]
  def change
    create_table :responsaveis do |t|
      t.references :responsavel_tipo, foreign_key: true
      t.string :cargo
      t.string :nome
      t.string :telefone

      t.timestamps
    end
  end
end
