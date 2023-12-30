require "test_helper"

class Api::V1::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_articles_index_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_articles_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_articles_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_articles_destroy_url
    assert_response :success
  end
end
