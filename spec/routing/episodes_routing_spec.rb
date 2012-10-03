require "spec_helper"

describe EpisodesController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("episodes#index")
    end

  end
end
