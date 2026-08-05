require "test_helper"

class SanskritweekPastEventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sanskritweek_past_events_index_url
    assert_response :success
  end

  test "should get new" do
    get sanskritweek_past_events_new_url
    assert_response :success
  end

  test "should get create" do
    get sanskritweek_past_events_create_url
    assert_response :success
  end

  test "should get edit" do
    get sanskritweek_past_events_edit_url
    assert_response :success
  end

  test "should get update" do
    get sanskritweek_past_events_update_url
    assert_response :success
  end

  test "should get destroy" do
    get sanskritweek_past_events_destroy_url
    assert_response :success
  end
end
