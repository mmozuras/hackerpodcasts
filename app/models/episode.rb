class Episode < ActiveRecord::Base
  attr_accessible :url, :audio_url, :description, :name, :published_at, :entry_id
  belongs_to :podcast
end
