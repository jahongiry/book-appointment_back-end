class ApplicationController < ActionController::API
  def jwt_key
    Rails.application.secrets.secret_key_base
  end

  def issue_token(user)
    JWT.encode({ user_id: user.id }, jwt_key, 'HS256')
  end

  def decoded_token
    # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjpudWxsfQ.9QXLOUfmUe4HKPuPayEuoc-vXdJuRQ7IOHSOjpuGpD4
    JWT.decode(token, jwt_key, true, { algorithm: 'HS256' })
  rescue StandardError => e
    [{ error: e }]
  end

  def token
    request.headers['Authorization'].split.last
  end

  def user_id
    decoded_token.first['user_id']
  end

  def current_user
    User.find_by(id: user_id)
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  def logged_in?
    !!current_user
  end
end
