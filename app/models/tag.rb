class Tag < ApplicationRecord
  has_many :join_tag_with_gossips
  has_many :gossips, through: :join_tag_with_gossips
end
