class CreateInstituicoes < ActiveRecord::Migration[5.0]
  def change
    create_table :instituicoes do |t|
      t.string :nome
      t.references :categoria
      t.string :sigla, limit: 100
      t.string :cnpj, limit: 35
      t.date :data_aprovacao
      t.text :resumo
      t.string :site

      t.timestamps
    end
  end
end
