require "test_helper"

class ProfilsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profils_index_url
    assert_response :success
  end
end
