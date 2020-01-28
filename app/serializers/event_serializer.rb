class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :start_date, :end_date
  has_many :places
  has_one :address
end
