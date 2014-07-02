class UserMailer < ActionMailer::Base

  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to BlackTie!')
  end

  def invite_guests(guest, main_event)
    @guest = guest
    @main_event = main_event
    mail(to: guest.email, subject: "you've been invited to #{@main_event.title}")
  end


end
