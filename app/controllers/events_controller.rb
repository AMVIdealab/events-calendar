class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]


  def index
    @events = Event.all
    #@events = Event.where(nil)
    #@events = @events.today
   
   #@yesterday = @events.yesterday
   #@today = @events.today
   #@tomorrow = @events.tomorrow
  end

  #def index
    #@events = Event.all

    #SELECT  "events".* 
    #FROM "events" 
    #WHERE "activities"."place_id" = 1 AND 
    #(start_date BETWEEN '2019-12-19 09:41:00' AND '2020-05-01 09:47:00')

    
    #@search = params["search"]
    #if @search.present?
      #@start_date = @search['start_date']
      #@end_date = @search['end_date']
      #if @start_date == @end_date
        #@start_date = (@start_date.to_date - 1)
        #@end_date = @end_date.to_date + 1
      #end
      #@title = @search["title"]
      #@events = Event.where("title LIKE ?", "%#{@title}%")
      #@events = Event.where('start_date BETWEEN ? AND ?', "#{@start_date.to_date}", "#{@end_date.to_date}")
      #@events = Event.today_place
    #end
  #end

  def today
    @events = Event.today
  end


  def show
    @event = Event.find(params[:id]) 
  end
  
  def new 
    @event = Event.new
    @place = @event.places.build
    @address = @place.build_address
  end
  
  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, norice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy 
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private
  
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :start_date, :end_date, places_attributes: [:id, :name, :_destroy, address_attributes: [:id, :city, :street_address, :zip_code, :state, :nation, :_destroy]])  
  end


end
