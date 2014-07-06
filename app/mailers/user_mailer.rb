class UserMailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, from: "BlackTie.com", subject: 'Welcome to BlackTie!')
  end

  def invite_guests(guest, main_event)
    @guest = guest
    @main_event = main_event
    mail(to: guest.email, from: "BlackTie.com", subject: "You've been invited to #{@main_event.title}!")
  end


end
