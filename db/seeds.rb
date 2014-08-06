#create users
@password = "password"

barrett = User.create(
  firstname: "Barrett",
  lastname: "Stutzman",
  email: "Barrett.Stutzman@gmail.com",
  password: @password,
  password_confirmation: @password,
  phone: "214-598-5266"
  )
puts "created Barrett" if barrett.valid?

brett = User.create(
  firstname: "Brett",
  lastname: "Campbell",
  email: "campbell.b@live.ca",
  password: @password,
  password_confirmation: @password,
  phone: "902-300-4226"
  )
puts "created Brett" if brett.valid?

kevin = User.create(
  firstname: "Kevin",
  lastname: "Sherman",
  email: "KevSherman@gmail.com",
  password: @password,
  password_confirmation: @password,
  phone: "604-880-2258"
  )
puts "created Kevin" if kevin.valid?

gabe = User.create(
  firstname: "Gabe",
  lastname: "Russ",
  email: "gabriel.taylor.russ@gmail.com",
  password: @password,
  password_confirmation: @password,
  phone: "604-880-2258"
  )
puts "created Gabe" if gabe.valid?

#create main events

User.all.each do |user|
  1.times do |i|
    mainevent = MainEvent.create(
      user_id: user.id,
      title: Faker::Lorem.sentence,
      description: Faker::Lorem.sentence,
      bride_full_name: Faker::Name.name,
      groom_full_name: Faker::Name.name,
      rsvp_sent: [true, false][i%2]
      )
    puts "created main event" if mainevent.valid?
  end
end

#create sub events

MainEvent.all.each do |mainevent|
  5.times do |i|
    subevent = SubEvent.create(
      main_event_id: mainevent.id,
      title: Faker::Lorem.sentence,
      location: "Vancouver",
      description: Faker::Lorem.sentence,
      date: Date.new(2014,i%12+1),
      start_time: Time.at(628232400+i*10000),
      end_time: Time.at(628232400+i*10000),
      attire: ["formal", "casual"][i%2]
      )
    puts "created sub event" if subevent.valid?
  end
end

#create guests

MainEvent.all.each do |mainevent|
  50.times do |i|
    guest = Guest.create(
      main_event_id: mainevent.id,
      email: (rand(1000) + 100).to_s + Faker::Internet.email,
      first: Faker::Name.first_name,
      last: Faker::Name.last_name
    )
    puts "created guest" if guest.valid?
  end
end

#create assignments

SubEvent.all.each do |sub_event|
  Guest.all.each do |guest|
    1.times do |i|
      assignment = Assignment.create(
        sub_event_id: sub_event.id,
        guest_id: guest.id,
        rsvp: ["true", "false", "no_response"].sample
        )
    puts "created assignment" if assignment.valid?
    end
  end
end