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

  it "validates presence of rating" do
    @tp.errors_on(:rating).should include "can't be blank"
  end

  it "validates range of rating 1..5" do
    @tp.rating = 10
    @tp.save
    @tp.errors_on(:rating).should include "must be less than 6"
    @tp.rating = 0
    @tp.save
    @tp.errors_on(:rating).should include "must be greater than 0"
  end
end
