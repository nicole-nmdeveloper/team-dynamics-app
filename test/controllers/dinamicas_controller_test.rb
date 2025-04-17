require "test_helper"

class DinamicasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dinamica = dinamicas(:one)
  end

  test "should get index" do
    get dinamicas_url
    assert_response :success
  end

  test "should get new" do
    get new_dinamica_url
    assert_response :success
  end

  test "should create dinamica" do
    assert_difference("Dinamica.count") do
      post dinamicas_url, params: { dinamica: { descricao: @dinamica.descricao, nome: @dinamica.nome } }
    end

    assert_redirected_to dinamica_url(Dinamica.last)
  end

  test "should show dinamica" do
    get dinamica_url(@dinamica)
    assert_response :success
  end

  test "should get edit" do
    get edit_dinamica_url(@dinamica)
    assert_response :success
  end

  test "should update dinamica" do
    patch dinamica_url(@dinamica), params: { dinamica: { descricao: @dinamica.descricao, nome: @dinamica.nome } }
    assert_redirected_to dinamica_url(@dinamica)
  end

  test "should destroy dinamica" do
    assert_difference("Dinamica.count", -1) do
      delete dinamica_url(@dinamica)
    end

    assert_redirected_to dinamicas_url
  end
end
