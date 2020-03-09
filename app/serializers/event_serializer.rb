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

class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :start_date, :end_date
  has_many :places
end
