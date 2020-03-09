# == Schema Information
#
# Table name: event_categories
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  event_id    :bigint           not null
#
# Indexes
#
#  index_event_categories_on_category_id  (category_id)
#  index_event_categories_on_event_id     (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (event_id => events.id)
#

class EventCategory < ApplicationRecord
  belongs_to :event
  belongs_to :category
end
