class EpisodesController < ApplicationController
  def index
    @episodes = Episode.limit(24).order("published_at desc")
  end
end
