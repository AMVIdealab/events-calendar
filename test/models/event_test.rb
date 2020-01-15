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
#  place_id    :integer
#
# Indexes
#
#  index_events_on_place_id  (place_id)
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
