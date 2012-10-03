class Podcast < ActiveRecord::Base
  attr_accessible :feed_url, :name
  has_many :episodes
end
