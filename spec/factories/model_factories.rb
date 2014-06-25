FactoryGirl.define do
  factory :user do
    email "testuser@email.com"
    password "testpass"
    password_confirmation "testpass"
  end
end

FactoryGirl.define do
  factory :guest do 
    main_event_id 1
    email  "testguest@email.com"
    first  "testpass"
    last   "testpass"
  end
end
FactoryGirl.define do
  factory :assignment do
    guest_id 1
    sub_event_id 3
    rsvp nil
  end
end