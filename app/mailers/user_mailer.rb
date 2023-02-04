class UserMailer < ApplicationMailer
    def two_factor_auth_view(email,auth_code)
        @auth_code = auth_code 
        mail(to: email, subject: 'Two-Factor Authentication Code')
      end

      
end
