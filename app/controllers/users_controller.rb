class UsersController < ApplicationController
    skip_before_action :authorized, only:[:new, :create]


    def new
        @user = User.new
    end

    def create 
        @user = User.create(strong_params)
        if @user.valid?
            flash[:notice] = 'Successfully created a new user!'
            login_user(@user)
            UserMailer.welcome_email(@user).deliver_now
            redirect_to items_path
        else
            @user.destroy
            flash[:notice] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end

    

    private

    def strong_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :email, :password_confirmation)
    end

    
end
