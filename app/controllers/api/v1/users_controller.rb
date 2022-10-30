class API::V1::UsersController < ApplicationController
    def create
        if User.find_by_email(user_params[:email])
          render json: { error: 'Email Exist , try a diffrent one' }, status: :not_acceptable
        else
          user = User.new(user_params)
          if user.save
            token = issue_token(user)
            render json: { user: UserSerializer.new(user), jwt: token }
          elsif user.errors.messages
            render json: { error: user.errors.messages }
          else
            render json: { error: 'User could not be created. Please try again' }
          end
        end
      end
    
      
    
      private
    
      def user_params
        params.permit(:first_name, :last_name, :email)
      end
    
end
