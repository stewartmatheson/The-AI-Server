require 'test_helper'

class TurnsControllerTest < ActionController::TestCase
  setup do
    @turn = turns(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turn" do
    assert_difference('Turn.count') do
      post :create, :turn => @turn.attributes
    end

    assert_redirected_to turn_path(assigns(:turn))
  end

end
