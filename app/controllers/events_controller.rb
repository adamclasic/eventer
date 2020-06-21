class EventsController < ApplicationController

    before_action :auth, only: ['new', 'create']
    def new
        @event = Event.new
    end

    def create
        @event = User.find(session[:user_id]).events.build(event_params)
        if @event.save
            flash[:notice] = 'event created succefuly'
            redirect_to user_path(session[:user_id])
        else
            flash.now[:alert] = "something went wrong! #{event_params}"
            render 'new'
        end

    end

    def index
        @all_events = Event.all
    end

    def show
        @one_event = Event.find(params['id'])
    end

    def event_params
        params.require(:event).permit(:title, :description, :date)
    end
end
