class DeedVotesController < ApplicationController
before_action :check_voting, only:[:create, :update]


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
    @deed_vote = DeedVote.new(deed_params)

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
 def check_voting
   @deed_hash = Deed.find(params[:deed_id])
   put "Voting #{deed_hash['voting']}"
    if @deed_hash.voting == 1
      @voteable = 1
   else
      render json: @deed_hash.errors, status: :unprocessable_entity
   end 
 end 

 def deed_params
  permit(:deed_id, :person_id, :votes)
end

end
