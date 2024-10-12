require "test_helper"

class ContactPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_page_index_url
    assert_response :success
  end
end
