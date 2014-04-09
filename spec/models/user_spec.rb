require 'spec_helper'

describe User do
  it "has a first name" do
    user = User.new
    expect(user).to respond_to :first_name
  end
end
