class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user
            session[:user_id] = user
            flash.now[:alert] = 'U R Signed in!'
            redirect_to user

        else
            flash.now[:alert] = "User not found! #{user}."
            render 'new'
        end
    end

    # def show
    #     @all_users = User.all
    # end
    
    # def user_params

    #     params.require(:user).permit(:id)#:username, :password)
    # end
end
