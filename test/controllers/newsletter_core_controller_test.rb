require 'test_helper'

class NewsletterCoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get letters" do
    get :letters
    assert_response :success
  end

end
