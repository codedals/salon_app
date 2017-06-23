require 'test_helper'

class SalonImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salon_image = salon_images(:one)
  end

  test "should get index" do
    get salon_images_url
    assert_response :success
  end

  test "should get new" do
    get new_salon_image_url
    assert_response :success
  end

  test "should create salon_image" do
    assert_difference('SalonImage.count') do
      post salon_images_url, params: { salon_image: { image_url: @salon_image.image_url, name: @salon_image.name, salon_id: @salon_image.salon_id, type: @salon_image.type } }
    end

    assert_redirected_to salon_image_url(SalonImage.last)
  end

  test "should show salon_image" do
    get salon_image_url(@salon_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_salon_image_url(@salon_image)
    assert_response :success
  end

  test "should update salon_image" do
    patch salon_image_url(@salon_image), params: { salon_image: { image_url: @salon_image.image_url, name: @salon_image.name, salon_id: @salon_image.salon_id, type: @salon_image.type } }
    assert_redirected_to salon_image_url(@salon_image)
  end

  test "should destroy salon_image" do
    assert_difference('SalonImage.count', -1) do
      delete salon_image_url(@salon_image)
    end

    assert_redirected_to salon_images_url
  end
end
