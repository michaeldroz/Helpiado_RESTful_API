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
    @deed_score = DeedVote.group('votes').sum(:votes, :conditions =>['deed_id = ?', params[:id]])
    render :json => @deed.attributes.merge(@deed_score)
    #render json: @deed
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
    @deed = Deed.find(deed_params[:id])

    if @deed.update(deed_params[:accumulative_votes])
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
      params.permit(:id, :person_id, :voting, :description, :votes, :recurring, :accumulative_votes, :deed_id)
   end

end
