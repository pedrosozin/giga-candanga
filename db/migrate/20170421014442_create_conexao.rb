 class CreateConexao < ActiveRecord::Migration[5.0]
  def change
       create_table :conexoes do |t|
    t.timestamps
     t.integer :segmento_id
     t.integer :caixaemenda_id
     t.integer :caboacesso_id
     t.integer :dgo_origem_id
     t.integer :dgo_site_id
     t.integer :switch_origem_id
     t.integer :switch_site_id
     t.integer :site_id
     t.integer :concentrador_id
     t.integer :gbic_origem_id
     t.integer :gbic_site_id

 	end

 
  
 	 add_index :conexoes, :segmento_id
 	 add_index :conexoes, :caixaemenda_id
 	 add_index :conexoes, :caboacesso_id
     add_index :conexoes, :dgo_origem_id
 	 add_index :conexoes, :dgo_site_id
 	 add_index :conexoes, :switch_origem_id
 	 add_index :conexoes, :site_id
 	 add_index :conexoes, :concentrador_id
 	 add_index :conexoes, :gbic_origem_id
 	 add_index :conexoes, :gbic_site_id
 	 add_index :fusoes, :conexao_id

  end 

 end
	