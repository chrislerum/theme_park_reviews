require 'spec_helper'

describe "theme_parks/new" do
  before(:each) do
    assign(:theme_park, stub_model(ThemePark,
      :name => "MyString",
      :description => "MyText",
      :location => "MyString",
      :rating => 1
    ).as_new_record)
  end

  it "renders new theme_park form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", theme_parks_path, "post" do
      assert_select "input#theme_park_name[name=?]", "theme_park[name]"
      assert_select "textarea#theme_park_description[name=?]", "theme_park[description]"
      assert_select "input#theme_park_location[name=?]", "theme_park[location]"
      assert_select "input#theme_park_rating[name=?]", "theme_park[rating]"
    end
  end
end
