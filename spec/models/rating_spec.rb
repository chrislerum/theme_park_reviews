require 'spec_helper'

describe Rating do
  before do
    @rating = Rating.new
  end

  it "validates range of rating 1..5" do
    @rating.rating = 10
    @rating.save
    @rating.errors_on(:rating).should include "must be less than 6"
    @rating.rating = 0
    @rating.save
    @rating.errors_on(:rating).should include "must be greater than 0"
  end

  it "validates presence of rating" do
    @rating.errors_on(:rating).should include "can't be blank"
  end
end
