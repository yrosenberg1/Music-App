class UsersController < ApplicationController
 def new
    @user = User.new
    render :new
 end

 def create
    @user = User.new(user_params)
    if @user.save 
        session[:session_token] = user.reset_session_token!
        # redirect_to somewhere_url
    else
        flash.now[:errors] = "Invalid username or password."
        render :new
    end

    def show
        @user = User.find(params[:id])
        render :show
    end
 end
    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end