require 'spec_helper'

describe "home/index.html.haml" do
  it "shows the greeting" do
    visit 'home/index'
    expect(page).to have_text "Welcome"
  end
end
