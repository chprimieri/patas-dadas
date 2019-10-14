require "application_system_test_case"

class PasseiosTest < ApplicationSystemTestCase
  setup do
    @passeio = passeios(:one)
  end

  test "visiting the index" do
    visit passeios_url
    assert_selector "h1", text: "Passeios"
  end

  test "creating a Passeio" do
    visit passeios_url
    click_on "New Passeio"

    fill_in "Cachorro 1", with: @passeio.cachorro_1_id
    fill_in "Cachorro 2", with: @passeio.cachorro_2_id
    fill_in "Cachorro 3", with: @passeio.cachorro_3_id
    fill_in "Data e hora", with: @passeio.data_e_hora
    fill_in "Pessoa", with: @passeio.pessoa_id
    fill_in "Status", with: @passeio.status
    click_on "Create Passeio"

    assert_text "Passeio was successfully created"
    click_on "Back"
  end

  test "updating a Passeio" do
    visit passeios_url
    click_on "Edit", match: :first

    fill_in "Cachorro 1", with: @passeio.cachorro_1_id
    fill_in "Cachorro 2", with: @passeio.cachorro_2_id
    fill_in "Cachorro 3", with: @passeio.cachorro_3_id
    fill_in "Data e hora", with: @passeio.data_e_hora
    fill_in "Pessoa", with: @passeio.pessoa_id
    fill_in "Status", with: @passeio.status
    click_on "Update Passeio"

    assert_text "Passeio was successfully updated"
    click_on "Back"
  end

  test "destroying a Passeio" do
    visit passeios_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Passeio was successfully destroyed"
  end
end
