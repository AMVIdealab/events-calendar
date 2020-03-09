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

require 'test_helper'

class EventCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
