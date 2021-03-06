class UsersController < ApplicationController
    before_action :auth, except: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to signin_path
        else
            flash.now[:alert] = @user.errors.messages || 'something went wrong!'
            render 'new'
        end
        
    end

    def show
        @one_user = User.find(params[:id])
        @upcoming_events = @one_user.goingevents.upcoming_events
        @prev_events = @one_user.goingevents.previous_events
    end

    def index
        @all_events = Event.all
        @all_users = User.all
        @current_user_events = User.find_by(username: session[:username]).createdevents

    end
    
    def user_params

        params.require(:user).permit(:username, :password)
    end

end
