# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :datetime
#  start_date  :datetime
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Event < ApplicationRecord
  
  validates :title, presence:  true 
  has_rich_text :description
  
  has_many :places, inverse_of: :event
  accepts_nested_attributes_for :places, allow_destroy: true


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
