class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new

    end

    def show
        @all_users = User.all

    end
end
