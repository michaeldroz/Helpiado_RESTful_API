class ApplicationController < ActionController::API
   http_basic_authenticate_with name: "apigee", password: "ColdWar44"
end 
