class SessionsController < ApplicationController
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )
        if user.nil
            flash.now[:errors] = "User not found"
            render :new 
        else
            log_in_user!(user)
         redirect_to user_url(user)
        end
    end

    def destroy
        sessions[:session_token] = nil
        user.reset_session_token!
        redirect_to new_session_url
    end
end