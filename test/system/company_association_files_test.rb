require "application_system_test_case"

class CompanyAssociationFilesTest < ApplicationSystemTestCase
  setup do
    @company_association_file = company_association_files(:one)
  end

  test "visiting the index" do
    visit company_association_files_url
    assert_selector "h1", text: "Company association files"
  end

  test "should create company association file" do
    visit company_association_files_url
    click_on "New company association file"

    fill_in "Description", with: @company_association_file.description
    click_on "Create Company association file"

    assert_text "Company association file was successfully created"
    click_on "Back"
  end

  test "should update Company association file" do
    visit company_association_file_url(@company_association_file)
    click_on "Edit this company association file", match: :first

    fill_in "Description", with: @company_association_file.description
    click_on "Update Company association file"

    assert_text "Company association file was successfully updated"
    click_on "Back"
  end

  test "should destroy Company association file" do
    visit company_association_file_url(@company_association_file)
    click_on "Destroy this company association file", match: :first

    assert_text "Company association file was successfully destroyed"
  end
end
