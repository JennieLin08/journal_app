class MainController < ApplicationController
    def index
        # flash.now[:notice] = "Welcome to Journal App"
        # flash[:alert] = "Invalid Email or Password!"
        
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end
end