require 'test_helper'

class VoteBalancesControllerTest < ActionController::TestCase
  setup do
    @vote_balance = vote_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vote_balances)
  end

  test "should create vote_balance" do
    assert_difference('VoteBalance.count') do
      post :create, vote_balance: { person_id: @vote_balance.person_id, vote_balance: @vote_balance.vote_balance }
    end

    assert_response 201
  end

  test "should show vote_balance" do
    get :show, id: @vote_balance
    assert_response :success
  end

  test "should update vote_balance" do
    put :update, id: @vote_balance, vote_balance: { person_id: @vote_balance.person_id, vote_balance: @vote_balance.vote_balance }
    assert_response 204
  end

  test "should destroy vote_balance" do
    assert_difference('VoteBalance.count', -1) do
      delete :destroy, id: @vote_balance
    end

    assert_response 204
  end
end
