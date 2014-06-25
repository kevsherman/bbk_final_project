require 'spec_helper'

describe Assignment do
  
  it "should be valid build" do
    expect(build(:assignment)).to be_valid
  end

  it "should not accept empty fields" do
    assignment = build(:assignment)
    assignment.sub_event_id = " "
    expect(assignment).not_to be_valid
  end

  it "should not accept none integers" do
    assignment = build(:assignment)
    assignment.sub_event_id = "fail"
    expect(assignment).not_to be_valid
  end
end