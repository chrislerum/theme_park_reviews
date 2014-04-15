require 'spec_helper'

describe "home/index.html.haml" do

  before do
    visit 'home/index'
  end

  it "has a link to home page" do
    expect(page).to have_link '', href: root_path
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

    it "lets you log out" do
      click_link 'Logout'
      expect(page).to have_text 'Signed out successfully'
    end

  end

  it "lets you edit your account" do
    click_link 'Sign up'
    fill_in 'Email', with: 'hello@gmail.com'
    fill_in 'Password', with: 'hellobaby'
    fill_in 'Password confirmation', with: 'hellobaby'
    click_button 'Sign up'
    click_link 'Edit account'
    expect(page).to have_text 'My Account'
    fill_in 'Email', with: 'newemail@email.com'
    fill_in 'Current password', with: 'hellobaby'
    click_button 'Update'
    expect(page).to have_text 'You updated your account successfully'
  end
end
