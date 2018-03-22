require 'test_helper'

class ReversationsControllerTest < ActionController::TestCase
  setup do
    @reversation = reversations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reversations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reversation" do
    assert_difference('Reversation.count') do
      post :create, reversation: { address: @reversation.address, check_in: @reversation.check_in, check_out: @reversation.check_out, company: @reversation.company, email: @reversation.email, full_name: @reversation.full_name, number_adult: @reversation.number_adult, number_children: @reversation.number_children, number_of_room: @reversation.number_of_room, phone: @reversation.phone, requirement: @reversation.requirement, room_type: @reversation.room_type }
    end

    assert_redirected_to reversation_path(assigns(:reversation))
  end

  test "should show reversation" do
    get :show, id: @reversation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reversation
    assert_response :success
  end

  test "should update reversation" do
    patch :update, id: @reversation, reversation: { address: @reversation.address, check_in: @reversation.check_in, check_out: @reversation.check_out, company: @reversation.company, email: @reversation.email, full_name: @reversation.full_name, number_adult: @reversation.number_adult, number_children: @reversation.number_children, number_of_room: @reversation.number_of_room, phone: @reversation.phone, requirement: @reversation.requirement, room_type: @reversation.room_type }
    assert_redirected_to reversation_path(assigns(:reversation))
  end

  test "should destroy reversation" do
    assert_difference('Reversation.count', -1) do
      delete :destroy, id: @reversation
    end

    assert_redirected_to reversations_path
  end
end
