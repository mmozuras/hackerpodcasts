require 'spec_helper'

describe EpisodesController do

  # This should return the minimal set of attributes required to create a valid
  # Episode. As you add validations to Episode, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # EpisodesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all episodes as @episodes" do
      episode = Episode.create! valid_attributes
      get :index, {}, valid_session
      assigns(:episodes).should eq([episode])
    end
  end
end
