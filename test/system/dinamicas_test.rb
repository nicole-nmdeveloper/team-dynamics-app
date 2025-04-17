require "application_system_test_case"

class DinamicasTest < ApplicationSystemTestCase
  setup do
    @dinamica = dinamicas(:one)
  end

  test "visiting the index" do
    visit dinamicas_url
    assert_selector "h1", text: "Dinamicas"
  end

  test "should create dinamica" do
    visit dinamicas_url
    click_on "New dinamica"

    fill_in "Descricao", with: @dinamica.descricao
    fill_in "Nome", with: @dinamica.nome
    click_on "Create Dinamica"

    assert_text "Dinamica was successfully created"
    click_on "Back"
  end

  test "should update Dinamica" do
    visit dinamica_url(@dinamica)
    click_on "Edit this dinamica", match: :first

    fill_in "Descricao", with: @dinamica.descricao
    fill_in "Nome", with: @dinamica.nome
    click_on "Update Dinamica"

    assert_text "Dinamica was successfully updated"
    click_on "Back"
  end

  test "should destroy Dinamica" do
    visit dinamica_url(@dinamica)
    click_on "Destroy this dinamica", match: :first

    assert_text "Dinamica was successfully destroyed"
  end
end
