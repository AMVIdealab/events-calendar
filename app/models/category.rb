# == Schema Information
#
# Table name: categories
#
#  id             :bigint           not null, primary key
#  children_count :integer          default(0), not null
#  depth          :integer          default(0), not null
#  lft            :integer          not null
#  name           :string
#  rgt            :integer          not null
#  parent_id      :integer
#
# Indexes
#
#  index_categories_on_lft        (lft)
#  index_categories_on_parent_id  (parent_id)
#  index_categories_on_rgt        (rgt)
#

class Category < ApplicationRecord
  acts_as_nested_set
  has_many :event_categories
  has_many :events, through: :event_categories
end
