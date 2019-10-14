require 'test_helper'

class CachorrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cachorro = cachorros(:one)
  end

  test "should get index" do
    get cachorros_url
    assert_response :success
  end

  test "should get new" do
    get new_cachorro_url
    assert_response :success
  end

  test "should create cachorro" do
    assert_difference('Cachorro.count') do
      post cachorros_url, params: { cachorro: { areas: @cachorro.areas, data_de_nascimento: @cachorro.data_de_nascimento, disponivel_para_passeio: @cachorro.disponivel_para_passeio, dupla_id: @cachorro.dupla_id, duracao: @cachorro.duracao, equipamento: @cachorro.equipamento, frequencia: @cachorro.frequencia, nome: @cachorro.nome, observacoes: @cachorro.observacoes, porte: @cachorro.porte, sexo: @cachorro.sexo, status: @cachorro.status } }
    end

    assert_redirected_to cachorro_url(Cachorro.last)
  end

  test "should show cachorro" do
    get cachorro_url(@cachorro)
    assert_response :success
  end

  test "should get edit" do
    get edit_cachorro_url(@cachorro)
    assert_response :success
  end

  test "should update cachorro" do
    patch cachorro_url(@cachorro), params: { cachorro: { areas: @cachorro.areas, data_de_nascimento: @cachorro.data_de_nascimento, disponivel_para_passeio: @cachorro.disponivel_para_passeio, dupla_id: @cachorro.dupla_id, duracao: @cachorro.duracao, equipamento: @cachorro.equipamento, frequencia: @cachorro.frequencia, nome: @cachorro.nome, observacoes: @cachorro.observacoes, porte: @cachorro.porte, sexo: @cachorro.sexo, status: @cachorro.status } }
    assert_redirected_to cachorro_url(@cachorro)
  end

  test "should destroy cachorro" do
    assert_difference('Cachorro.count', -1) do
      delete cachorro_url(@cachorro)
    end

    assert_redirected_to cachorros_url
  end
end
