class TokensController < ApplicationController
  skip_before_action :authorize_request
  include TokensHelper

  def create
    user = AdminUser.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      # sign_in(user) if necessary
      token = JwtHelper.encode({user_id: user.id}, expires_in)
      render json: { token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def expires_in
    Rails.env.development? ? 1.year.from_now : 24.hours.from_now
  end
end
