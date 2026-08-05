require "test_helper"

class SanskritweekEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sanskritweek_events_index_url
    assert_response :success
  end

  test "should get show" do
    get sanskritweek_events_show_url
    assert_response :success
  end

  test "should get new" do
    get sanskritweek_events_new_url
    assert_response :success
  end

  test "should get create" do
    get sanskritweek_events_create_url
    assert_response :success
  end

  test "should get edit" do
    get sanskritweek_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get sanskritweek_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sanskritweek_events_destroy_url
    assert_response :success
  end
end
