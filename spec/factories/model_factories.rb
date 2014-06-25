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
    start_time "Nine O'Clock"
    end_time "Nine Thirty"
    groom_full_name "Brett Campbell"
    bride_full_name "Kev Sherman"
  end
end

FactoryGirl.define do
  factory :sub_event do
    main_event_id 9
    title "Brett's Bachelor Par-tay"
    location "Vegas"
    start_time "Nine O'Clock"
    end_time "Nine Thirty"
  end
end