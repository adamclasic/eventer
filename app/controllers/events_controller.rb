class EventsController < ApplicationController

    before_action :auth, exept: [:new, :create, :index]

    def new
        @event = Event.new
    end

    def create
        @event = User.find(session[:user_id]).createdevents.build(event_params)
        if @event.save
            flash[:notice] = 'event created succefuly'
            redirect_to user_path(session[:user_id])
        else
            flash.now[:alert] =  @event.errors.messages || "something went wrong!"
            render 'new'
        end

    end

    def index
        @all_events = Event.all
        @upcoming_events = Event.all.upcoming_events
        @prev_events = Event.all.previous_events
    end

    def show
        @one_event = Event.find(params['id'])
    end

    def event_params
        params.require(:event).permit(:title, :description, :date)
    end
end
