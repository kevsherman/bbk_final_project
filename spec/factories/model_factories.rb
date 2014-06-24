FactoryGirl.define do
  factory :user do
    email "testuser@email.com"
    password "testpass"
    password_confirmation "testpass"
  end
  
  factory :sub_event do 
    main_event_id 1
    title "SubEvent Test"
    start_time 
    end_time  ""
  end
  
end