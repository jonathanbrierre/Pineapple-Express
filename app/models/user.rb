require 'uri'

class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, length: { in: (6..18)}, presence: true
    validates :first_name, length: {minimum: 2}
    validates :last_name, length: {minimum: 2}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
    


    def generate_password_token!
        
        self.reset_password_token =  generate_token
        self.reset_password_sent_at = Time.now.utc
        save!(:validate => false)
        
    end

    def password_token_valid?(token)
        (self.reset_password_sent_at + 4.hours) > Time.now.utc
        self.reset_password_token === token
    end

    def reset_password!(password, password_confirmation)
            self.reset_password_token =  nil
            self.password_confirmation = password_confirmation
            self.password = password
            self.save
    end

    private

    def generate_token
        rand(999999)
    end
end