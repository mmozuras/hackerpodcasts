class EpisodesController < ApplicationController
  def index
    @episodes = Episode.limit(20).order("published_at desc")
  end
end
