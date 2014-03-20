require 'test_helper'

class DeedVotesControllerTest < ActionController::TestCase
  setup do
    @deed_vote = deed_votes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:deed_votes)
  end

  test "should create deed_vote" do
    assert_difference('DeedVote.count') do
      post :create, deed_vote: { deed_id: @deed_vote.deed_id, person_id: @deed_vote.person_id, votes: @deed_vote.votes }
    end

    assert_response 201
  end

  test "should show deed_vote" do
    get :show, id: @deed_vote
    assert_response :success
  end

  test "should update deed_vote" do
    put :update, id: @deed_vote, deed_vote: { deed_id: @deed_vote.deed_id, person_id: @deed_vote.person_id, votes: @deed_vote.votes }
    assert_response 204
  end

  test "should destroy deed_vote" do
    assert_difference('DeedVote.count', -1) do
      delete :destroy, id: @deed_vote
    end

    assert_response 204
  end
end
