class ApplicationController < ActionController::API 
include  ActionController::HttpAuthentication::Basic::ControllerMethods
   http_basic_authenticate_with name: "apigee", password: "ColdWar44"
end 
