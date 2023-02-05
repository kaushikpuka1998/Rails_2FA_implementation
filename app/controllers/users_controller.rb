  class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      
      begin
        if @user.save
          # log_in @user
          flash[:success] = "Welcome to the Sample App!"
          redirect_to @user
        else
          render 'new'
        end
      rescue exception => e
        puts "KKKK + #{e}"
      end
    end

    def show
      begin
        if session[:user_id] == -56 ||  session[:user_id].to_i != params[:id].to_i
          redirect_to "/login"
        else
          @user= User.find_by_id(session[:user_id])
        end
      rescue exception => e
        puts "ISSUE: => #{e}"
          redirect_to "/new"
      end    
    end


    def logout
      session[:user_id] = -56
      redirect_to "/login"
    end
    
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  end
