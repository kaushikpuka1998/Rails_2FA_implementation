# app/models/user.rb
class User < ApplicationRecord
    attr_accessor :two_factor_auth_code

    

    has_secure_password
    # Add validation for email and password fields
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }
    # Other code...

    def generate_two_factor_auth_code(email,auth_code)
      user = User.find_by(email: email)
      if user.update_column(:two_factor_auth_code,  auth_code )
        # Update successful
      else
        # Handle the error
        puts("Error updating two-factor authentication code: #{user.errors.full_messages.join(', ')}")
      end
      #user.update_attribute(:two_factor_auth_code, SecureRandom.hex(4) )
    end
  
    # Other code...
  end
  