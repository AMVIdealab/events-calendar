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

class Place < ApplicationRecord
  
  belongs_to :event

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true 

end
