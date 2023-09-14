module Authenticator
  extend ActiveSupport::Concern

  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def auth_header
    request.headers['Authorization']
  end

  def encode_token(payload)
    payload[:exp] = 1.day.from_now.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def decode_access_token
    token = auth_header.split(' ')[1]
    JWT.decode(token, HMAC_SECRET)[0]
  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError, StandardError => e
    raise ExceptionHandler::AuthenticationError, e.message
  end

  def authenticate!
    @current_user = User.find_by(email: decode_access_token['email'])
    return if @current_user

    raise ExceptionHandler::AuthenticationError
  end
end
