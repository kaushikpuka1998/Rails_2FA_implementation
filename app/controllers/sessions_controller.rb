class SessionsController < ApplicationController
  def login
    if params[:session].present?
      params_email = params[:session][:email]
      user = user = User.where(email: params_email).first
      if user&.authenticate(params[:session][:password])
        # Generate a unique code and save it to the user's model
        auth_code = SecureRandom.hex(4)
        user.generate_two_factor_auth_code(params_email,auth_code)
        user = User.where(email: params_email).first
        # Send the code to the user's email
        UserMailer.two_factor_auth_view(params[:session][:email],auth_code).deliver
        redirect_to "/two_fa?email=#{params[:session][:email]}"
      else
        render "new"
      end
    end
    
  end

  def two_factor_auth
    if params[:session].present? 
      user = User.where(email: params[:session][:email]).first
      puts "KKKK+ #{user["two_factor_auth_code"].to_s}"
      if user["two_factor_auth_code"].to_s == params[:session][:two_factor_auth_code]
        # redirect_to "https://www.google.co.in"
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        render "new"
      end
    else
      user = User.where(email:params[:email]).first
    end
    
  end
end
