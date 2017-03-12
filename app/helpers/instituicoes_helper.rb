module InstituicoesHelper
  def setup_endereco(instituicao)
    instituicao.endereco ||= instituicao.build_endereco
    instituicao.endereco
  end
end
