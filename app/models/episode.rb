class Episode < ActiveRecord::Base
  attr_accessible :audio_url, :description, :name, :published_at, :entry_id
end
