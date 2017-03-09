class AddSeAtivaToInstituicao < ActiveRecord::Migration[5.0]
  def up
    add_column :instituicoes, :se_ativa, :boolean , default:true
  end



  def down
    remove_column :instituicoes, :se_ativa, :boolean
  end
end
