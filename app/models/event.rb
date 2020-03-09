# == Schema Information
#
# Table name: events
#
#  id          :bigint           not null, primary key
#  description :text
#  end_date    :datetime
#  name        :string
#  start_date  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  
  validates :name, presence:  true 
  has_rich_text :description
  
  has_many :places, inverse_of: :event
  accepts_nested_attributes_for :places, allow_destroy: true

  has_many :event_categories
  has_many :categories, through: :event_categories
  
  scope :filter_by_name, lambda {|keyword| where('lower(name) LIKE ?', "%#{keyword.downcase}%")}


  #scope :filter_by_city, lambda { |city| Event.joins(places: :address).where(addresses: {city:  "#{city.capitalize}"})}
  #Set defaul_scoped or unscoped
  #Utilizzando unscoped sono sicuro di prendere tutti gli eventi anche quelli che hanno un default scope
  scope :filter_by_city, lambda { |city| Event.unscoped.joins(places: :address).where('lower(city) LIKE ?', "%#{city.downcase}%")}


  def self.search(params = {})
    events = params[:events_ids].present? ? Events.find(params[:event_ids]) : Event.all
    events = events.filter_by_name(params[:keyword]) if params[:keyword]
    events = events.filter_by_city(params[:city]) if params[:city]
  
    events
  end
  


=begin
  SELECT  "activities".*
    FROM "activities"
    WHERE "activities"."place_id" = ?
    AND (DATE(start_date) = Date.today)
=end
  #@today = Date.today
  
 
  scope :yesterday, -> {Event.find_by_sql("SELECT * FROM events WHERE(DATE(start_date) = '#{Date.today - 1}')")} 
  scope :today, -> {Event.find_by_sql("SELECT * FROM events WHERE(DATE(start_date) = '#{Date.today}')")}
  scope :tomorrow, -> {Event.find_by_sql("SELECT * FROM events WHERE(DATE(start_date) = '#{Date.today + 1}')")}  
  scope :today_place, -> {Event.find_by_sql("SELECT * FROM events WHERE(place_id = 2 AND (DATE(start_date) = '#{Date.today}'))")} 
end
