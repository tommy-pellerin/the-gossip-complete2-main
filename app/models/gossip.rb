class Gossip < ApplicationRecord
  validates :title, 
    presence: true, 
    length: { in: 3..14 }
  validates :content, presence: true

  belongs_to :user
  has_many :comments
  has_many :join_tag_with_gossips
  has_many :tags, through: :join_tag_with_gossips
end
