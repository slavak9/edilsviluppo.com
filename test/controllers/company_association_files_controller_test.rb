require "test_helper"

class CompanyAssociationFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_association_file = company_association_files(:one)
  end

  test "should get index" do
    get company_association_files_url
    assert_response :success
  end

  test "should get new" do
    get new_company_association_file_url
    assert_response :success
  end

  test "should create company_association_file" do
    assert_difference("CompanyAssociationFile.count") do
      post company_association_files_url, params: { company_association_file: { description: @company_association_file.description } }
    end

    assert_redirected_to company_association_file_url(CompanyAssociationFile.last)
  end

  test "should show company_association_file" do
    get company_association_file_url(@company_association_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_association_file_url(@company_association_file)
    assert_response :success
  end

  test "should update company_association_file" do
    patch company_association_file_url(@company_association_file), params: { company_association_file: { description: @company_association_file.description } }
    assert_redirected_to company_association_file_url(@company_association_file)
  end

  test "should destroy company_association_file" do
    assert_difference("CompanyAssociationFile.count", -1) do
      delete company_association_file_url(@company_association_file)
    end

    assert_redirected_to company_association_files_url
  end
end
