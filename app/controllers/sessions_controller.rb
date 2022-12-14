class SessionsController < ApplicationController
    def login
        user = User.find_by(email: params[:email])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json:user, status: :created
        else
            render json: { error: "Invalid email or password. Please verify your credentials and try again " }, status: :unauthorized
        end
    end

    def user_profile
        
    end
  
    def logout
        session.delete :user_id
        head :no_content
    end
 end
 