class MainController < ApplicationController

    def index
        @categories = Category.where(user_id: current_user.id)
        # @category_tasks = @categories.tasks.where(:deadline => Date.today)
        @tasks = Task.where(category_id:current_user.categories.map(&:id))
        
        if session[:user_id]
            @user = User.find(session[:user_id])
        end
    end

end