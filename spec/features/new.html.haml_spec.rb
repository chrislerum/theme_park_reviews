require 'spec_helper'

describe "theme_parks/new.html.haml" do
  it "allows user to create a new theme park" do
    visit root_path
    click_link 'New Theme Park'
    fill_in :theme_park_name, with: 'Disney World Orlando'
    fill_in :theme_park_description, with: 'talking about disney'
    fill_in :theme_park_location, with: 'Orlando, FL'
    fill_in :theme_park_rating, with: 3
    click_button 'Create Theme park'
    expect(page).to have_content 'Theme park was successfully created'
    expect(page).to have_content 'Disney World Orlando'
  end
end
