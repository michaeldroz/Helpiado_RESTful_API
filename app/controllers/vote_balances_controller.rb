class VoteBalancesController < ApplicationController
  # GET /vote_balances
  # GET /vote_balances.json
  def index
    @vote_balances = VoteBalance.all

    render json: @vote_balances
  end

  # GET /vote_balances/1
  # GET /vote_balances/1.json
  def show
    @vote_balance = VoteBalance.find(params[:id])

    render json: @vote_balance
  end

  # POST /vote_balances
  # POST /vote_balances.json
  def create
    @vote_balance = VoteBalance.new(params[:vote_balance])

    if @vote_balance.save
      render json: @vote_balance, status: :created, location: @vote_balance
    else
      render json: @vote_balance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vote_balances/1
  # PATCH/PUT /vote_balances/1.json
  def update
    @vote_balance = VoteBalance.find(params[:id])

    if @vote_balance.update(params[:vote_balance])
      head :no_content
    else
      render json: @vote_balance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vote_balances/1
  # DELETE /vote_balances/1.json
  def destroy
    @vote_balance = VoteBalance.find(params[:id])
    @vote_balance.destroy

    head :no_content
  end
end
