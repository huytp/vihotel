require 'test_helper'

class HotelOverviewsControllerTest < ActionController::TestCase
  setup do
    @hotel_overview = hotel_overviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hotel_overviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hotel_overview" do
    assert_difference('HotelOverview.count') do
      post :create, hotel_overview: { content: @hotel_overview.content, title: @hotel_overview.title }
    end

    assert_redirected_to hotel_overview_path(assigns(:hotel_overview))
  end

  test "should show hotel_overview" do
    get :show, id: @hotel_overview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hotel_overview
    assert_response :success
  end

  test "should update hotel_overview" do
    patch :update, id: @hotel_overview, hotel_overview: { content: @hotel_overview.content, title: @hotel_overview.title }
    assert_redirected_to hotel_overview_path(assigns(:hotel_overview))
  end

  test "should destroy hotel_overview" do
    assert_difference('HotelOverview.count', -1) do
      delete :destroy, id: @hotel_overview
    end

    assert_redirected_to hotel_overviews_path
  end
end
