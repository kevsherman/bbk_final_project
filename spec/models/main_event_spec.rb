require 'spec_helper'

describe MainEvent do
  
  it "should have a valid build" do
    expect(build(:main_event)).to be_valid
  end

  it "should have a user_id, title, start_time and end_time" do
    main_event = build(:main_event)
    main_event.title = nil
    main_event.end_time = nil
    expect(main_event).not_to be_valid
  end

  it "should not accept a string as an user_id" do
  main_event =  build(:main_event)
  main_event.user_id = "test String"
  expect(main_event).not_to be_valid
  end

end