require 'spec_helper'

describe ThemePark do
  before do
    @tp = ThemePark.new
    @tp.save
  end

  it "validates presence of name" do
    @tp.errors_on(:name).should include "can't be blank"
  end

  it "validates presence of description" do
    @tp.errors_on(:description).should include "can't be blank"
  end

  it "validates presence of location" do
    @tp.errors_on(:location).should include "can't be blank"
  end
end
