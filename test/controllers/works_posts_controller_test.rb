require "test_helper"

class WorksPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @works_post = works_posts(:one)
  end

  test "should get index" do
    get works_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_works_post_url
    assert_response :success
  end

  test "should create works_post" do
    assert_difference("WorksPost.count") do
      post works_posts_url, params: { works_post: { title: @works_post.title, work_cat_id: @works_post.work_cat_id } }
    end

    assert_redirected_to works_post_url(WorksPost.last)
  end

  test "should show works_post" do
    get works_post_url(@works_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_works_post_url(@works_post)
    assert_response :success
  end

  test "should update works_post" do
    patch works_post_url(@works_post), params: { works_post: { title: @works_post.title, work_cat_id: @works_post.work_cat_id } }
    assert_redirected_to works_post_url(@works_post)
  end

  test "should destroy works_post" do
    assert_difference("WorksPost.count", -1) do
      delete works_post_url(@works_post)
    end

    assert_redirected_to works_posts_url
  end
end
