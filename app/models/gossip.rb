class Gossip < ApplicationRecord
  belongs_to :user, optional: true
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  has_many :commentaries
end