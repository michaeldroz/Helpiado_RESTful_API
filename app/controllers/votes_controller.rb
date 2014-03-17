class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    render json: @votes
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    render json: @vote
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(params[:vote])

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    @vote = Vote.find(vote_params[:id])

    if @vote.update(accumulative_score: + vote_params[:accumulative_score])
      head :no_content
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    head :no_content
  end

private 
def vote_params
    params.permit(:id, :accumulative_score) 
end

end
