class ApplicationController < ActionController::API
  before_action :validate_apigee
 
  private
 
  def validate_apigee
    if params[:apigee_key] != ENV["APIGEE"]
      render json: status: "Unauthorized" # halts request cycle
    end
  end
end 
