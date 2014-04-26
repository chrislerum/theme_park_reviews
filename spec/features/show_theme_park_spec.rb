require 'spec_helper'

describe "show theme park" do
  before do
    @theme_park = create(:theme_park, name: 'Disney')
  end

  it "lists theme parks" do
    visit root_path
    click_link "List Theme Parks"
    expect(page).to have_link 'Disney'
  end

  it "shows average of user ratings for a theme park" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    rating = create(:rating, theme_park: @theme_park, user: user1, rating: 2)
    rating = create(:rating, theme_park: @theme_park, user: user2, rating: 4)
    rating = create(:rating, theme_park: @theme_park, user: user3, rating: 3)
    visit root_path
    click_link "List Theme Parks"
    click_link 'Disney'
    expect(page).to have_content 'Average Rating: 3'
  end

  it "shows message if there are no ratings for a theme park" do
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    visit root_path
    click_link "List Theme Parks"
    click_link 'Disney'
    expect(page).to have_content 'Average Rating: N/A'
  end

  it "let's you rate the theme park" do
    user = create(:user, email: 'bob@bobby.com', password: 'happyface')
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: 'bob@bobby.com'
    fill_in 'Password', with: 'happyface'
    click_button 'Sign in'
    click_link "List Theme Parks"
    click_link 'Disney'
    click_link 'Rate this theme park'
    expect(page).to have_content 'Rate Disney here!'
    fill_in "Rating", with: '2'
    click_on 'Create Rating'
  end

  it "doesn't use one theme park's rating for another" do
    @other_theme_park = create(:theme_park, name: 'Busch Gardens')
    visit root_path
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    rating = create(:rating, theme_park: @theme_park, user: user1, rating: 2)
    rating = create(:rating, theme_park: @theme_park, user: user2, rating: 4)
    rating = create(:rating, theme_park: @theme_park, user: user3, rating: 3)
    click_link 'List Theme Parks'
    within "td#theme_park_number_#{@other_theme_park.id}" do
      expect(page).to have_content 'N/A'
    end
    within "td#theme_park_number_#{@theme_park.id}" do
      expect(page).to have_content '3'
    end
    click_link 'Busch Gardens'
    expect(page).to have_content 'Average Rating: N/A'
  end
end
