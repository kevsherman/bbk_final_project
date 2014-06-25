require 'spec_helper'

describe Guest do 

  it "should have valid factory" do
    expect(build(:guest)).to be_valid
  end

  it "should have an main_event_id, email, first and last name" do
    guest = build(:guest)
    expect(guest).to be_valid
  end

  it "should not accept any empty field" do
    guest = build(:guest)
    guest.email = " "
    expect(guest).not_to be_valid
  end

  it "should have valid email format" do
    guest = build(:guest)
    guest.email = "fakeemail"
    expect(guest).not_to be_valid 
  end

  it "should not accept an incorrect main_event_id" do 
    guest = build(:guest)
    guest.main_event_id = 9000
    expect(guest).not_to be_valid
  end
end
