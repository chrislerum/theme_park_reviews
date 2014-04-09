require 'spec_helper'

describe "theme_parks/new.html.haml" do
  it "allows user to create a new theme park" do
    visit new_theme_park_path

  end
end
