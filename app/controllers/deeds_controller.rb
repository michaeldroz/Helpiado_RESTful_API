class DeedsController < ApplicationController
  # GET /deeds
  # GET /deeds.json
  def index
    @deeds = Deed.all

    render json: @deeds
  end

  # GET /deeds/1
  # GET /deeds/1.json
  def show
    @deed = Deed.find(params[:id])

    render json: @deed
  end

  # POST /deeds
  # POST /deeds.json
  def create
    @deed = Deed.create(deed_params)

    if @deed.save
      render json: @deed, status: :created, location: @deed
    else
      render json: @deed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deeds/1
  # PATCH/PUT /deeds/1.json
  def update
    @deed = Deed.find(params[:id])

    if @deed.update(params[:deed])
      head :no_content
    else
      render json: @deed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deeds/1
  # DELETE /deeds/1.json
  def destroy
    @deed = Deed.find(params[:id])
    @deed.destroy

    head :no_content
  end

private
    def deed_params
	params.permit(:person_id, :descripton, :votes, :recurring)
   end

end
