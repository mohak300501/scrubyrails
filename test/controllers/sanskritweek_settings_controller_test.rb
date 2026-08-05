require "test_helper"

class SanskritweekSettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get sanskritweek_settings_edit_url
    assert_response :success
  end

  test "should get update" do
    get sanskritweek_settings_update_url
    assert_response :success
  end
end
