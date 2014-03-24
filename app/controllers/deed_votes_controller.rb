class DeedVotesController < ApplicationController
#  before_action :set_voteable, only:[create, update, destory]


  # GET /deed_votes
  # GET /deed_votes.json
  def index
    @deed_votes = DeedVote.all

    render json: @deed_votes
  end

  # GET /deed_votes/1
  # GET /deed_votes/1.json
  def show
    @deed_vote = DeedVote.find(params[:id])

    render json: @deed_vote
  end

  # POST /deed_votes
  # POST /deed_votes.json
  def create
    @deed_vote = DeedVote.new(params[:deed_vote])

    if @deed_vote.save
      render json: @deed_vote, status: :created, location: @deed_vote
    else
      render json: @deed_vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deed_votes/1
  # PATCH/PUT /deed_votes/1.json
  def update
    @deed_vote = DeedVote.find(params[:id])

    if @deed_vote.update(params[:deed_vote])
      head :no_content
    else
      render json: @deed_vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deed_votes/1
  # DELETE /deed_votes/1.json
  def destroy
    @deed_vote = DeedVote.find(params[:id])
    @deed_vote.destroy

    head :no_content
  end
  
 private
 def set_voteable
   @deed_hash = Deed.find(params[:deed_id])
   if @deed_hash.voting == 1
      @voteable = 1
   else
      render json: @deed_hash.errors, status: :unprocessable_entity
   end 
 end 


end
