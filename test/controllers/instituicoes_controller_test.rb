require "test_helper"

class InstituicoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instituicao = instituicoes(:one)
  end

  test "should get index" do
    get instituicoes_url
    assert_response :success
  end

  test "should get new" do
    get new_instituicao_url
    assert_response :success
  end

  test "should create instituicao" do
    assert_difference("Instituicao.count") do
      post instituicoes_url, params: {instituicao:
                                          {cnpj: @instituicao.cnpj,
                                           data_aprovacao: @instituicao.data_aprovacao,
                                           nome: @instituicao.nome,
                                           references: @instituicao.references,
                                           resumo: @instituicao.resumo,
                                           sigla: @instituicao.sigla,
                                           site: @instituicao.site}}
    end

    assert_redirected_to instituicao_url(Instituicao.last)
  end

  test "should show instituicao" do
    get instituicao_url(@instituicao)
    assert_response :success
  end

  test "should get edit" do
    get edit_instituicao_url(@instituicao)
    assert_response :success
  end

  test "should update instituicao" do
    patch instituicao_url(@instituicao), params: {instituicao:
                                                      {cnpj: @instituicao.cnpj,
                                                       data_aprovacao: @instituicao.data_aprovacao,
                                                       nome: @instituicao.nome,
                                                       references: @instituicao.references,
                                                       resumo: @instituicao.resumo,
                                                       sigla: @instituicao.sigla,
                                                       site: @instituicao.site}}
    assert_redirected_to instituicao_url(@instituicao)
  end

  test "should destroy instituicao" do
    assert_difference("Instituicao.count", -1) do
      delete instituicao_url(@instituicao)
    end

    assert_redirected_to instituicoes_url
  end
end
