require "test_helper"

class CommentariesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commentaries_index_url
    assert_response :success
  end

  test "should get show" do
    get commentaries_show_url
    assert_response :success
  end
end
