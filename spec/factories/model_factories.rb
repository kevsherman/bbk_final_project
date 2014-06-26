FactoryGirl.define do
  factory :user do
    email "testuser@email.com"
    password "testpass"
    password_confirmation "testpass"
  end
end

FactoryGirl.define do
  factory :guest do 
    main_event_id 9
    email  "testguest@email.com"
    first  "testpass"
    last   "testpass"
  end
end

FactoryGirl.define do
  factory :assignment do
    guest_id 9
    sub_event_id 3
  end
end

FactoryGirl.define do
  factory :main_event do
    user_id 9
    title "Brett's Wedding"
    date "2014-06-26"
    start_time "2000-01-01 17:05:00"
    end_time "2000-01-01 19:05:00"
    groom_full_name "Brett Campbell"
    bride_full_name "Kev Sherman"
  end
end

FactoryGirl.define do
  factory :sub_event do
    main_event_id 9
    title "Brett's Bachelor Par-tay"
    location "Vegas"
    date "2014-06-26"
    start_time "2000-01-01 17:05:00"
    end_time "2000-01-01 19:05:00"
  end
end