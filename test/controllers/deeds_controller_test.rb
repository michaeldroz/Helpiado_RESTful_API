require 'test_helper'

class DeedsControllerTest < ActionController::TestCase
  setup do
    @deed = deeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deeds)
  end

  test "should create deed" do
    assert_difference('Deed.count') do
      post :create, deed: { name: @deed.name }
    end

    assert_response 201
  end

  test "should show deed" do
    get :show, id: @deed
    assert_response :success
  end

  test "should update deed" do
    put :update, id: @deed, deed: { name: @deed.name }
    assert_response 204
  end

  test "should destroy deed" do
    assert_difference('Deed.count', -1) do
      delete :destroy, id: @deed
    end

    assert_response 204
  end
end
