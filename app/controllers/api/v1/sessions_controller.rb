class API::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(sessions_params[:email])
    if user
      token = issue_token(user)
      render json: { user: UserSerializer.new(user), jwt: token }
    else
      render json: { error: 'Incorrect email' }, status: :unauthorized
    end
  end

  def show
    if logged_in?
      render json: current_user
    else
      render json: { error: 'User is not logged in/could not be found.' }
    end
  end

  private

  def sessions_params
    params.permit(:email)
  end
end
