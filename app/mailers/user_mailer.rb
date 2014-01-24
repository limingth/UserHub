class UserMailer < ActionMailer::Base
  default from: "limingth@gmail.com"

  def registration_confirmation(user)
    mail(to: user.email, subject: "Thank you for registration")
  end
end