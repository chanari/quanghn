class Api::ApplicationController < ActionController::API
  include ExceptionHandler
  include Authenticator
end
