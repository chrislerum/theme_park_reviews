require 'spec_helper'

describe "ThemeParks" do
  describe "GET /theme_parks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get theme_parks_path
      response.status.should be(200)
    end
  end
end
