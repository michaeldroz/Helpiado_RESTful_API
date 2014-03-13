class ApplicationController < ActionController::API
  
  #before_action :validate_apigee
  before_action :basic_auth
  
  private
  def basic_auth
    http_basic_authenticate_with name: "apigee", password: "ColdWar44"
  end
=begin
  def validate_apigee
    if params[:apigee_key] != ENV[APIGEE]
      render json: status: "Unauthorized" # halts request cycle
    else
      return
    end
  end
=end
end 
