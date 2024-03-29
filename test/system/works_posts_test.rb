require "application_system_test_case"

class WorksPostsTest < ApplicationSystemTestCase
  setup do
    @works_post = works_posts(:one)
  end

  test "visiting the index" do
    visit works_posts_url
    assert_selector "h1", text: "Works posts"
  end

  test "should create works post" do
    visit works_posts_url
    click_on "New works post"

    fill_in "Title", with: @works_post.title
    fill_in "Work cat", with: @works_post.work_cat_id
    click_on "Create Works post"

    assert_text "Works post was successfully created"
    click_on "Back"
  end

  test "should update Works post" do
    visit works_post_url(@works_post)
    click_on "Edit this works post", match: :first

    fill_in "Title", with: @works_post.title
    fill_in "Work cat", with: @works_post.work_cat_id
    click_on "Update Works post"

    assert_text "Works post was successfully updated"
    click_on "Back"
  end

  test "should destroy Works post" do
    visit works_post_url(@works_post)
    click_on "Destroy this works post", match: :first

    assert_text "Works post was successfully destroyed"
  end
end
