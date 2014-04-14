require 'spec_helper'

describe "theme_parks/edit" do
  before(:each) do
    @theme_park = assign(:theme_park, stub_model(ThemePark,
      :name => "MyString",
      :description => "MyText",
      :location => "MyString",
      :rating => 1
    ))
  end

  it "renders the edit theme_park form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theme_park_path(@theme_park), "post" do
      assert_select "input#theme_park_name[name=?]", "theme_park[name]"
      #assert_select "textarea#theme_park_description[name=?]", "theme_park[description]"
      assert_select "input#theme_park_location[name=?]", "theme_park[location]"
      assert_select "input#theme_park_rating[name=?]", "theme_park[rating]"
    end
  end
end
