require 'test_helper'

class ImportControllerTest < ActionController::TestCase
  test "should get analyze" do
    get :analyze
    assert_response :success
  end

end
