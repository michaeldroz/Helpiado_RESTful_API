class DeedVotesController < ApplicationController
before_action :check_voting, only:[:create, :update]
before_action :check_vote_balance, only:[:create, :update]

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
      @update_vote_balance = VoteBalance.find_by(:person_id => params[:person_id])
      if @update_vote_balance.decrement!(:vote_balance, by = params[:votes])
         else
          puts "error error error"
         end 
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
    if @deed_hash.voting == true
   else
      render json: @deed_hash.errors, status: :unprocessable_entity
   end 
 end 

def check_vote_balance
  @vote_balance = VoteBalance.find_by(:person_id => params[:person_id])
   if @vote_balance.vote_balance.to_i >= (params[:votes].to_i)
  else 
    render json: @vote_balance.errors, status: :unprocessable_entity
  end
end 

 def deed_params
 params.permit(:deed_id, :person_id, :votes)
end

end
