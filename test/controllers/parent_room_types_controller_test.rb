require 'test_helper'

class ParentRoomTypesControllerTest < ActionController::TestCase
  setup do
    @parent_room_type = parent_room_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_room_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_room_type" do
    assert_difference('ParentRoomType.count') do
      post :create, parent_room_type: { name: @parent_room_type.name }
    end

    assert_redirected_to parent_room_type_path(assigns(:parent_room_type))
  end

  test "should show parent_room_type" do
    get :show, id: @parent_room_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parent_room_type
    assert_response :success
  end

  test "should update parent_room_type" do
    patch :update, id: @parent_room_type, parent_room_type: { name: @parent_room_type.name }
    assert_redirected_to parent_room_type_path(assigns(:parent_room_type))
  end

  test "should destroy parent_room_type" do
    assert_difference('ParentRoomType.count', -1) do
      delete :destroy, id: @parent_room_type
    end

    assert_redirected_to parent_room_types_path
  end
end
