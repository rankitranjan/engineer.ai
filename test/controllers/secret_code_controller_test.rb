require 'test_helper'

class SecretCodeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get secret_code_index_url
    assert_response :success
  end

end
