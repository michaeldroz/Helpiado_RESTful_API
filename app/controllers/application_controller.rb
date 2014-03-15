class ApplicationController < ActionController::API 
include  ActionController::HttpAuthentication::Basic::ControllerMethods
   http_basic_authenticate_with name: ENV["BASE_AUTH_NAME"], password: ENV["BASE_AUTH_PASS"]
end 
