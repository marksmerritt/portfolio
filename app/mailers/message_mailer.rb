class MessageMailer < ApplicationMailer
  def email(message)
    @message = message
    mail(to: ENV["MAIL_TO"], subject: "New Portfolio Message")
  end
end
