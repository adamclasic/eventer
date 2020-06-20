class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(username: params[:session][:username])
        if user
            session[:username] = user.username
            session[:user_id] = user.id
            flash[:alert] = 'U R Signed in!'
            redirect_to user

        else
            flash.now[:alert] = "User not found! #{user}."
            render 'new'
        end

        
    end

    def destroy
        session[:username] = nil
        session[:user_id] = nil
        flash[:alert] = "You've been sinned out!."

        redirect_to signin_path
    end

    # def show
    #     @all_users = User.all
    # end
    
    # def user_params

    #     params.require(:user).permit(:id)#:username, :password)
    # end
end
