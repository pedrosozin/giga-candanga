class CreateEnderecos < ActiveRecord::Migration[5.0]
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :cidade
      t.string :estado
      t.string :bairro
      t.string :endereco
      t.references :instituicao, foreign_key: true

      t.timestamps
    end
  end
end
