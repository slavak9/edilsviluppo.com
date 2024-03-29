require "test_helper"

class WorksCatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @works_cat = works_cats(:one)
  end

  test "should get index" do
    get works_cats_url
    assert_response :success
  end

  test "should get new" do
    get new_works_cat_url
    assert_response :success
  end

  test "should create works_cat" do
    assert_difference("WorksCat.count") do
      post works_cats_url, params: { works_cat: { title: @works_cat.title } }
    end

    assert_redirected_to works_cat_url(WorksCat.last)
  end

  test "should show works_cat" do
    get works_cat_url(@works_cat)
    assert_response :success
  end

  test "should get edit" do
    get edit_works_cat_url(@works_cat)
    assert_response :success
  end

  test "should update works_cat" do
    patch works_cat_url(@works_cat), params: { works_cat: { title: @works_cat.title } }
    assert_redirected_to works_cat_url(@works_cat)
  end

  test "should destroy works_cat" do
    assert_difference("WorksCat.count", -1) do
      delete works_cat_url(@works_cat)
    end

    assert_redirected_to works_cats_url
  end
end
