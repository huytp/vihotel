require 'test_helper'

class PhotoOfRoomsControllerTest < ActionController::TestCase
  setup do
    @photo_of_room = photo_of_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:photo_of_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create photo_of_room" do
    assert_difference('PhotoOfRoom.count') do
      post :create, photo_of_room: { image: @photo_of_room.image }
    end

    assert_redirected_to photo_of_room_path(assigns(:photo_of_room))
  end

  test "should show photo_of_room" do
    get :show, id: @photo_of_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @photo_of_room
    assert_response :success
  end

  test "should update photo_of_room" do
    patch :update, id: @photo_of_room, photo_of_room: { image: @photo_of_room.image }
    assert_redirected_to photo_of_room_path(assigns(:photo_of_room))
  end

  test "should destroy photo_of_room" do
    assert_difference('PhotoOfRoom.count', -1) do
      delete :destroy, id: @photo_of_room
    end

    assert_redirected_to photo_of_rooms_path
  end
end
