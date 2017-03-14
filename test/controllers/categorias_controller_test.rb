require "test_helper"
class CategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get listar" do
    get categorias_listar_url
    assert_response :success
  end

  test "should get criar" do
    get categorias_criar_url
    assert_response :success
  end

  test "should get editar" do
    get categorias_editar_url
    assert_response :success
  end
end
