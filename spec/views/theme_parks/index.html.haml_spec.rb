require 'spec_helper'

describe "theme_parks/index" do
  before(:each) do
    assign(:theme_parks, [
      stub_model(ThemePark,
        :name => "Name",
        :description => "MyText",
        :location => "Location",
        :rating => 1
      ),
      stub_model(ThemePark,
        :name => "Name",
        :description => "MyText",
        :location => "Location",
        :rating => 1
      )
    ])
  end

  it "renders a list of theme_parks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
