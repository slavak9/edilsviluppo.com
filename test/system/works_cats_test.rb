require "application_system_test_case"

class WorksCatsTest < ApplicationSystemTestCase
  setup do
    @works_cat = works_cats(:one)
  end

  test "visiting the index" do
    visit works_cats_url
    assert_selector "h1", text: "Works cats"
  end

  test "should create works cat" do
    visit works_cats_url
    click_on "New works cat"

    fill_in "Title", with: @works_cat.title
    click_on "Create Works cat"

    assert_text "Works cat was successfully created"
    click_on "Back"
  end

  test "should update Works cat" do
    visit works_cat_url(@works_cat)
    click_on "Edit this works cat", match: :first

    fill_in "Title", with: @works_cat.title
    click_on "Update Works cat"

    assert_text "Works cat was successfully updated"
    click_on "Back"
  end

  test "should destroy Works cat" do
    visit works_cat_url(@works_cat)
    click_on "Destroy this works cat", match: :first

    assert_text "Works cat was successfully destroyed"
  end
end
