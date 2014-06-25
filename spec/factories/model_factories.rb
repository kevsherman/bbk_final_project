FactoryGirl.define do
  factory :user do
    email "testuser@email.com"
    password "testpass"
    password_confirmation "testpass"
  end

  factory :main_event do
    user_id 1
    title "Main Event Test"
    start_time 
  end
end