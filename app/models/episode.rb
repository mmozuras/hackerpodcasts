class Episode < ActiveRecord::Base
  belongs_to :podcast
  attr_accessible :audio_url, :description, :name, :published_at
end
