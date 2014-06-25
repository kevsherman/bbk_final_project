require 'spec_helper'

describe User do 

  it "should have valid factory" do
    expect(build(:user)).to be_valid
  end

  it "should not accept an empty name field" do
    user = build(:user)
    user.email = " "
    expect(user).not_to be_valid
  end

  it "should not allow dupilicate emails" do
    user1 = create(:user)
    user2 = build(:user)
    expect(user2).not_to be_valid
  end

  it "should only allow proper email format" do
    user = build(:user)
    user.email = "nopenopenope"
    expect(user).not_to be_valid
  end

  it "should not accept an empty password field" do
    user = build(:user)
    user.password = nil
    expect(user).not_to be_valid
  end
end