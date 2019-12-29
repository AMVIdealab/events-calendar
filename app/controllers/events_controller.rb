class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  def index
    @events = Event.all
=begin
SELECT  "events".* 
 FROM "events" 
 WHERE "activities"."place_id" = 1 AND 
 (start_date BETWEEN '2019-12-19 09:41:00' AND '2020-05-01 09:47:00')
=end
    
    @search = params["search"]
    if @search.present?

    


      @start_date = @search['start_date']
      @end_date = @search['end_date']
      if @start_date == @end_date
        #@start_date = (@start_date.to_date - 1)
        @end_date = @end_date.to_date + 1
      end
      #@title = @search["title"]
      #@events = Event.where("title LIKE ?", "%#{@title}%")
      #@events = Event.where('start_date BETWEEN ? AND ?', "#{@start_date.to_date}", "#{@end_date.to_date}")
      @events = Event.today_place
    end

  end

  def show
    @event = Event.find(params[:id]) 
  end
  
  def edit
  end

  def new 
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
    end
  end

  def destroy
  end

  private
  
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :end_date)
  end


end
