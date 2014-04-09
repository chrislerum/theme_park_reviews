require 'spec_helper'

describe "theme_parks/new.html.haml" do
  it "allows user to create a new theme park" do
    visit root_path
    click_link 'New Theme Park'
    fill_in 'Name', with: 'Disney World Orlando'
    fill_in 'Description', with: 'talking about disney'
    fill_in 'Location', with: 'Orlando, FL'
    fill_in 'Rating', with: 3
    click_button 'Save'
    expect(page).to have_text 'Theme park was successfully created'
    expect(page).to have_text 'Disney World Orlando'
  end
end
