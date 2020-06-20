class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user
            session[:user_id] = user
            redirect_to user
        else
            flash.now[:alert] = 'Not a user!'
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
