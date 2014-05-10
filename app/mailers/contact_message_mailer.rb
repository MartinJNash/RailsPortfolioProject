class ContactMessageMailer < ActionMailer::Base

  default to: ENV['GMAIL_ADDRESS']

  def basic_contact_email(contact_message)
    @email = contact_message.email
    @body = contact_message.body
    @name = contact_message.name
    mail(subject: 'Contact Form Inquiry', from: @email)
  end
end
