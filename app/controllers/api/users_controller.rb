class Api::UsersController < Api::ApplicationController
  def create
    user = User.create!(user_params)

    render json: { email: user.email, access_token: encode_token(email: user.email) }, status: :created
  end

  def log_in
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      render json: { access_token: encode_token(email: user.email) }, status: :accepted
    else
      handle_unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
