require 'spec_helper'

describe "theme_parks/show" do
  before(:each) do
    @theme_park = assign(:theme_park, stub_model(ThemePark,
      :name => "Name",
      :description => "MyText",
      :location => "Location",
      :rating => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Location/)
    rendered.should match(/1/)
  end
end
