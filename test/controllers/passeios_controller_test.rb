require 'test_helper'

class PasseiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @passeio = passeios(:one)
  end

  test "should get index" do
    get passeios_url
    assert_response :success
  end

  test "should get new" do
    get new_passeio_url
    assert_response :success
  end

  test "should create passeio" do
    assert_difference('Passeio.count') do
      post passeios_url, params: { passeio: { cachorro_1_id: @passeio.cachorro_1_id, cachorro_2_id: @passeio.cachorro_2_id, cachorro_3_id: @passeio.cachorro_3_id, data_e_hora: @passeio.data_e_hora, pessoa_id: @passeio.pessoa_id, status: @passeio.status } }
    end

    assert_redirected_to passeio_url(Passeio.last)
  end

  test "should show passeio" do
    get passeio_url(@passeio)
    assert_response :success
  end

  test "should get edit" do
    get edit_passeio_url(@passeio)
    assert_response :success
  end

  test "should update passeio" do
    patch passeio_url(@passeio), params: { passeio: { cachorro_1_id: @passeio.cachorro_1_id, cachorro_2_id: @passeio.cachorro_2_id, cachorro_3_id: @passeio.cachorro_3_id, data_e_hora: @passeio.data_e_hora, pessoa_id: @passeio.pessoa_id, status: @passeio.status } }
    assert_redirected_to passeio_url(@passeio)
  end

  test "should destroy passeio" do
    assert_difference('Passeio.count', -1) do
      delete passeio_url(@passeio)
    end

    assert_redirected_to passeios_url
  end
end
