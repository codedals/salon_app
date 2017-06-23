require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get site_index_url
    assert_response :success
  end

  test "should get salons" do
    get site_salons_url
    assert_response :success
  end

end
