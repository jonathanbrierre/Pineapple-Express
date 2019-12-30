class PasswordsController < ApplicationController
    skip_before_action :authorized
    def index

    end
    
    def forgot
        # byebug
        if post_params[:email].blank? # check if email is present
            flash[:notice]=  'Email address not present'
            
            redirect_to passwords_path and return
        end
    
        user = User.find_by(email: post_params[:email]) # if present find user by email
    
        if user.present?
            user.generate_password_token! #generate pass token
            UserMailer.forgot_password(user).deliver_now
            flash[:sent] = 'Email with reset code has been sent!'
            
            redirect_to new_password_path and return
        else
            flash[:notice] = 'Email address not found'
            redirect_to passwords_path and return
        end
    end

    def new
        # byebug
        @user = User.new
    end
    
    def reset
        # byebug
        token = user_params[:reset_password_token]
    
        if user_params[:email].blank?
            flash[:notice] = "Please provide your email address"
            redirect_to "/passwords/new" and return
        end
    
        user = User.find_by(email: user_params[:email])
    
        if user.present? && user.password_token_valid?(token)
            if user.reset_password!(user_params[:password_digest], user_params[:password_confirmation])
                user.reset_password!(user_params[:password_digest], user_params[:password_confirmation])
                flash[:notice] = 'Successfully updated password!'
                redirect_to '/home' and return
            else
                flash[:errors] = user.errors.full_messages
                redirect_to '/passwords/new' and return
            end
        else
            flash[:notice] = 'Either the code expired, is wrong, or you put in a wrong email. Try generating a new code!'
            redirect_to '/login' and return
        end
    end

    private 

    def user_params
        params.require(:user).permit(:email, :reset_password_token, :password_digest, :password_confirmation)
    end
    def post_params
        params.require(:post).permit(:email)
    end
end
