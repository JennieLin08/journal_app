class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness:true,format: { with: URI::MailTo::EMAIL_REGEXP, message:" Invalid email address" } 
    validates :password_digest, presence:true
    has_secure_password
end
