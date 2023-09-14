module RequestAuthenticationHelper
  def user_token(user)
    secret = Rails.application.secrets.secret_key_base
    JWT.encode({ email: user.email }, secret)
  end

  def authenticate_headers(user)
    {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json',
      'Authorization' => "Bearer #{user_token(user)}"
    }
  end
end
