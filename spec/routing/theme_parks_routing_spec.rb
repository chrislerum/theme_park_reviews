require "spec_helper"

describe ThemeParksController do
  describe "routing" do

    it "routes to #index" do
      get("/theme_parks").should route_to("theme_parks#index")
    end

    it "routes to #new" do
      get("/theme_parks/new").should route_to("theme_parks#new")
    end

    it "routes to #show" do
      get("/theme_parks/1").should route_to("theme_parks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/theme_parks/1/edit").should route_to("theme_parks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/theme_parks").should route_to("theme_parks#create")
    end

    it "routes to #update" do
      put("/theme_parks/1").should route_to("theme_parks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/theme_parks/1").should route_to("theme_parks#destroy", :id => "1")
    end

  end
end
