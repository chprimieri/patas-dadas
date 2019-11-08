require 'test_helper'

class PermissoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @permissao = permissoes(:one)
  end

  test "should get index" do
    get permissoes_url
    assert_response :success
  end

  test "should get new" do
    get new_permissao_url
    assert_response :success
  end

  test "should create permissao" do
    assert_difference('Permissao.count') do
      post permissoes_url, params: { permissao: { administracao: @permissao.administracao, passeio: @permissao.passeio, pessoa_id: @permissao.pessoa_id } }
    end

    assert_redirected_to permissao_url(Permissao.last)
  end

  test "should show permissao" do
    get permissao_url(@permissao)
    assert_response :success
  end

  test "should get edit" do
    get edit_permissao_url(@permissao)
    assert_response :success
  end

  test "should update permissao" do
    patch permissao_url(@permissao), params: { permissao: { administracao: @permissao.administracao, passeio: @permissao.passeio, pessoa_id: @permissao.pessoa_id } }
    assert_redirected_to permissao_url(@permissao)
  end

  test "should destroy permissao" do
    assert_difference('Permissao.count', -1) do
      delete permissao_url(@permissao)
    end

    assert_redirected_to permissoes_url
  end
end
