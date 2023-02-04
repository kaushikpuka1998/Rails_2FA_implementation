class OtpController < ApplicationController
  before_action :require_user
  
  def new
  end
  
  def create
    user = current_user
    if user.validate_and_consume_otp!(params[:otp])
      session[:otp_validated] = true
      redirect_to root_path
    else
      flash[:danger] = 'Invalid OTP'
      render 'new'
    end
  end
end
