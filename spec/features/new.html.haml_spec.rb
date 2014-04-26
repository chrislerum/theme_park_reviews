require 'spec_helper'

describe "theme_parks/new.html.haml" do
  context "with valid values" do
    before do
      visit root_path
      click_link 'New Theme Park'
      fill_in :theme_park_name, with: 'Disney World Orlando'
      fill_in :theme_park_description, with: 'talking about disney'
      fill_in :theme_park_location, with: 'Orlando, FL'
    end

    it "allows user to create a new theme park" do
      click_button 'Create Theme park'
      expect(page).to have_content 'Theme park was successfully created'
      expect(page).to have_content 'Disney World Orlando'
    end

    it "allows an image with title" do
      fill_in :theme_park_theme_park_images_attributes_0_title, with: 'Selena'
      attach_file 'theme_park_theme_park_images_attributes_0_photo', 'spec/features/selena.jpg'
      click_button 'Create Theme park'
      expect(page).to have_content 'Theme park was successfully created'
      expect(page).to have_content 'Selena'
    end
  end

  context "with invalid values" do
    it "doesn't allow creation of theme park" do
      visit root_path
      click_link 'New Theme Park'
      click_button 'Create Theme park'
      expect(page).to have_no_content 'Theme park was successfully created'
      expect(page).to have_no_content 'Disney World Orlando'
      expect(page).to have_content "Name can't be blank"
    end
  end

end
