class AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city, :state 
  belongs_to :place
end
