class SessionsController < ApplicationController
    skip_before_action :authorized, only:[:home, :new, :create]

    def home
        render :home
    end

    def new
    end

    def create
        @user= User.find_by(username: params[:username])
        
        if @user && @user.authenticate(params[:password]) # Returns self if the password is correct, otherwise false.
            login_user(@user)
            flash[:notice] = "Login Successful"
            redirect_to items_path
        else
            flash[:notice] = 'Invalid username and/or password'
            redirect_to login_path
        end
    end

    def destroy 
        session.delete(:user_id)
        flash[:notice] = "Logout successful"
        redirect_to  home_path
    end

    private

    def strong_params
        params.require().permit(:password)
    end
end
