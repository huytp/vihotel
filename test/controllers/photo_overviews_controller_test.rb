require 'test_helper'

class PhotoOverviewsControllerTest < ActionController::TestCase
  setup do
    @photo_overview = photo_overviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_overviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_overview" do
    assert_difference('PhotoOverview.count') do
      post :create, photo_overview: { image: @photo_overview.image }
    end

    assert_redirected_to photo_overview_path(assigns(:photo_overview))
  end

  test "should show photo_overview" do
    get :show, id: @photo_overview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_overview
    assert_response :success
  end

  test "should update photo_overview" do
    patch :update, id: @photo_overview, photo_overview: { image: @photo_overview.image }
    assert_redirected_to photo_overview_path(assigns(:photo_overview))
  end

  test "should destroy photo_overview" do
    assert_difference('PhotoOverview.count', -1) do
      delete :destroy, id: @photo_overview
    end

    assert_redirected_to photo_overviews_path
  end
end
