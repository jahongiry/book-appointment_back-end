class ApplicationController < ActionController::API
  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    "#{user.id}"
  end

  def decoded_token
    token
  end

  def token
    request.headers['Authorization']
  end

  def user_id
    decoded_token
  end

  def current_user
    User.find_by(id: decoded_token)
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def logged_in?
    !!current_user
  end
end
