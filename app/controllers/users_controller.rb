class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
    end

    def show
        @all_users = User.all
    end
    
    def user_params

        params.require(:user).permit(:username, :password)
    end

end
