require 'test_helper'

class GamesImagesControllerTest < ActionController::TestCase
  setup do
    @games_image = games_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create games_image" do
    assert_difference('GamesImage.count') do
      post :create, games_image: { gameId: @games_image.gameId, imageUrl: @games_image.imageUrl, userSubmitted: @games_image.userSubmitted, votes: @games_image.votes }
    end

    assert_redirected_to games_image_path(assigns(:games_image))
  end

  test "should show games_image" do
    get :show, id: @games_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @games_image
    assert_response :success
  end

  test "should update games_image" do
    put :update, id: @games_image, games_image: { gameId: @games_image.gameId, imageUrl: @games_image.imageUrl, userSubmitted: @games_image.userSubmitted, votes: @games_image.votes }
    assert_redirected_to games_image_path(assigns(:games_image))
  end

  test "should destroy games_image" do
    assert_difference('GamesImage.count', -1) do
      delete :destroy, id: @games_image
    end

    assert_redirected_to games_images_path
  end
end
