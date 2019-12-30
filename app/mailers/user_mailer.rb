class UserMailer < ApplicationMailer

    def welcome_email(user)
        @the_user = user
        mail(to: @the_user.email, subject: 'Welcome to Pineapple Express!')
    end

    def forgot_password(user)
      @the_user = user
      mail(to: @the_user.email, subject: "Password Reset at Pineapple Express")
    end


end
