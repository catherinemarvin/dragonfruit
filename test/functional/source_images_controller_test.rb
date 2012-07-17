require 'test_helper'

class SourceImagesControllerTest < ActionController::TestCase
  setup do
    @source_image = source_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_image" do
    assert_difference('SourceImage.count') do
      post :create, source_image: { id: @source_image.id, url: @source_image.url }
    end

    assert_redirected_to source_image_path(assigns(:source_image))
  end

  test "should show source_image" do
    get :show, id: @source_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_image
    assert_response :success
  end

  test "should update source_image" do
    put :update, id: @source_image, source_image: { id: @source_image.id, url: @source_image.url }
    assert_redirected_to source_image_path(assigns(:source_image))
  end

  test "should destroy source_image" do
    assert_difference('SourceImage.count', -1) do
      delete :destroy, id: @source_image
    end

    assert_redirected_to source_images_path
  end
end
