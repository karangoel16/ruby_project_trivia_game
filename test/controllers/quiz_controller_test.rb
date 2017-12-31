require 'test_helper'

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get quest" do
    get quiz_quest_url
    assert_response :success
  end

end
