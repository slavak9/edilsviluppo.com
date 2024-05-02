class MessageMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  # en.message_mailer.message_delivery.subject
  #

  def message_delivery
    @name = params[:name]
    @last_name = params[:last_name]
    @email = params[:email]
    @message = params[:message]
    mail(
      from: 'supportslavakudaka@gmail.com',
      to: "slavakudaka@gmail.com",
      subject: "Edilsviluppo Ask form: #{@name} #{@last_name}",
      )
  end
end
