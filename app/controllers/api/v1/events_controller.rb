class Api::V1::EventsController < ApplicationController
 
  def index
    @events = Event.search(params)
    render json: EventSerializer.new(@events).serializable_hash
    #@events = Event.all
    #render json: EventSerializer.new(@events).serialized_json
  end
  
  def show
    @event = Event.find(params[:id])
    render json: EventSerializer.new(@event).serialized_json
  end
  
end
