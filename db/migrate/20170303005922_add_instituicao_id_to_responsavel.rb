class AddInstituicaoIdToResponsavel < ActiveRecord::Migration[5.0]
  def change
    add_reference :responsaveis, :instituicao, foreign_key: true
  end
end
