require 'test_helper'

class MovesControllerTest < ActionController::TestCase
  setup do
    @move = moves(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moves)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create move" do
    assert_difference('Move.count') do
      post :create, :move => @move.attributes
    end

    assert_redirected_to move_path(assigns(:move))
  end

  test "should show move" do
    get :show, :id => @move.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @move.to_param
    assert_response :success
  end

  test "should update move" do
    put :update, :id => @move.to_param, :move => @move.attributes
    assert_redirected_to move_path(assigns(:move))
  end

  test "should destroy move" do
    assert_difference('Move.count', -1) do
      delete :destroy, :id => @move.to_param
    end

    assert_redirected_to moves_path
  end
end
