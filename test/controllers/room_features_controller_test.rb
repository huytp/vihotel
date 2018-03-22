require 'test_helper'

class RoomFeaturesControllerTest < ActionController::TestCase
  setup do
    @room_feature = room_features(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:room_features)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create room_feature" do
    assert_difference('RoomFeature.count') do
      post :create, room_feature: { name: @room_feature.name }
    end

    assert_redirected_to room_feature_path(assigns(:room_feature))
  end

  test "should show room_feature" do
    get :show, id: @room_feature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @room_feature
    assert_response :success
  end

  test "should update room_feature" do
    patch :update, id: @room_feature, room_feature: { name: @room_feature.name }
    assert_redirected_to room_feature_path(assigns(:room_feature))
  end

  test "should destroy room_feature" do
    assert_difference('RoomFeature.count', -1) do
      delete :destroy, id: @room_feature
    end

    assert_redirected_to room_features_path
  end
end
