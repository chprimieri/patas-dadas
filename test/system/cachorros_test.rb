require "application_system_test_case"

class CachorrosTest < ApplicationSystemTestCase
  setup do
    @cachorro = cachorros(:one)
  end

  test "visiting the index" do
    visit cachorros_url
    assert_selector "h1", text: "Cachorros"
  end

  test "creating a Cachorro" do
    visit cachorros_url
    click_on "New Cachorro"

    fill_in "Areas", with: @cachorro.areas
    fill_in "Data de nascimento", with: @cachorro.data_de_nascimento
    check "Disponivel para passeio" if @cachorro.disponivel_para_passeio
    fill_in "Dupla", with: @cachorro.dupla_id
    fill_in "Duracao", with: @cachorro.duracao
    fill_in "Equipamento", with: @cachorro.equipamento
    fill_in "Frequencia", with: @cachorro.frequencia
    fill_in "Nome", with: @cachorro.nome
    fill_in "Observacoes", with: @cachorro.observacoes
    fill_in "Porte", with: @cachorro.porte
    fill_in "Sexo", with: @cachorro.sexo
    fill_in "Status", with: @cachorro.status
    click_on "Create Cachorro"

    assert_text "Cachorro was successfully created"
    click_on "Back"
  end

  test "updating a Cachorro" do
    visit cachorros_url
    click_on "Edit", match: :first

    fill_in "Areas", with: @cachorro.areas
    fill_in "Data de nascimento", with: @cachorro.data_de_nascimento
    check "Disponivel para passeio" if @cachorro.disponivel_para_passeio
    fill_in "Dupla", with: @cachorro.dupla_id
    fill_in "Duracao", with: @cachorro.duracao
    fill_in "Equipamento", with: @cachorro.equipamento
    fill_in "Frequencia", with: @cachorro.frequencia
    fill_in "Nome", with: @cachorro.nome
    fill_in "Observacoes", with: @cachorro.observacoes
    fill_in "Porte", with: @cachorro.porte
    fill_in "Sexo", with: @cachorro.sexo
    fill_in "Status", with: @cachorro.status
    click_on "Update Cachorro"

    assert_text "Cachorro was successfully updated"
    click_on "Back"
  end

  test "destroying a Cachorro" do
    visit cachorros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Cachorro was successfully destroyed"
  end
end
