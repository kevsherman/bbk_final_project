require 'spec_helper'

describe User do 

  it "should have valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "should have an email, password and password confirmation" do 
    expect(:user).to be_valid
  end

  it "should not accept an empty name field" do
    user = User.new(email: " ")
    expect(user).not_to be_valid
  end
end