require "application_system_test_case"

class PermissoesTest < ApplicationSystemTestCase
  setup do
    @permissao = permissoes(:one)
  end

  test "visiting the index" do
    visit permissoes_url
    assert_selector "h1", text: "Permissoes"
  end

  test "creating a Permissao" do
    visit permissoes_url
    click_on "New Permissao"

    check "Administracao" if @permissao.administracao
    check "Passeio" if @permissao.passeio
    fill_in "Pessoa", with: @permissao.pessoa_id
    click_on "Create Permissao"

    assert_text "Permissao was successfully created"
    click_on "Back"
  end

  test "updating a Permissao" do
    visit permissoes_url
    click_on "Edit", match: :first

    check "Administracao" if @permissao.administracao
    check "Passeio" if @permissao.passeio
    fill_in "Pessoa", with: @permissao.pessoa_id
    click_on "Update Permissao"

    assert_text "Permissao was successfully updated"
    click_on "Back"
  end

  test "destroying a Permissao" do
    visit permissoes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Permissao was successfully destroyed"
  end
end
