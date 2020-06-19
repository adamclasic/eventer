class EventsController < ApplicationController
    def new
        @event = Event.new
    end

    def create
        @event = Event.new

    end

    def show
        @all_events = Event.all

    end
end
