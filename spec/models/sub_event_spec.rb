require 'spec_helper'

describe SubEvent do 

  it "should be valid build" do
    expect(build(:sub_event)).to be_valid
  end

  it "should not have empty main_event_id, title, location, start_time or end_time" do
    sub_event = build(:sub_event)
    sub_event.title = nil
    sub_event.end_time = nil
    expect(sub_event).not_to be_valid
  end

  it "should only accept main_event_id as an integer" do
    sub_event = build(:sub_event)
    sub_event.main_event_id = "not a string"
    expect(sub_event).not_to be_valid
  end
end