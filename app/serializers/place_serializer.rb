# == Schema Information
#
# Table name: places
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#
# Indexes
#
#  index_places_on_event_id  (event_id)
#

class PlaceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_one :address 
end
