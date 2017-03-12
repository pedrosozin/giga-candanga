require "test_helper"

class RepasseCategoriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get repasse_categorias_index_url
    assert_response :success
  end

  test "should get new" do
    get repasse_categorias_new_url
    assert_response :success
  end
end
