require 'spec_helper'

describe "home/index.html.haml" do

  before do
    visit 'home/index'
  end

  it "shows the greeting" do
    expect(page).to have_text "Welcome"
  end

  context "when not logged in" do
    it "shows login link" do
      expect(page).to have_link 'Login'
    end

    it "shows a sign up link" do
      expect(page).to have_link 'Sign up'
    end

    it "doesn't show edit account or logout links" do
      expect(page).to have_no_link 'Edit account'
      expect(page).to have_no_link 'Logout'
    end
  end

  context "when already logged in" do
    before do
      click_link 'Sign up'
      fill_in 'Email', with: 'hello@gmail.com'
      fill_in 'Password', with: 'hellobaby'
      fill_in 'Password confirmation', with: 'hellobaby'
      click_button 'Sign up'
    end

    it "doesn't show login link or sign up link" do
      expect(page).to have_text 'Welcome! You have signed up successfully.'
      expect(page).to have_no_text 'Login'
      expect(page).to have_no_text 'Sign up'
    end

    it "shows 'edit account' and log out links" do
      expect(page).to have_link 'Edit account'
      expect(page).to have_link 'Logout'
    end
  end
end
