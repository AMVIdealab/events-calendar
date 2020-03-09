# == Schema Information
#
# Table name: addresses
#
#  id             :bigint           not null, primary key
#  city           :string
#  nation         :string
#  state          :string
#  street_address :string
#  zip_code       :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  place_id       :bigint           not null
#
# Indexes
#
#  index_addresses_on_place_id  (place_id)
#
# Foreign Keys
#
#  fk_rails_...  (place_id => places.id)
#

class AddressSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city, :state 
  belongs_to :place
end
