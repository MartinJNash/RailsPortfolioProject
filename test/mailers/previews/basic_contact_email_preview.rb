class BasicContactEmailPreview <  ActionMailer::Preview
  def basic_contact_email


    message = ContactMessage.new(
      email: 'test@example.com', 
      body: "Hey I have a question about something and you can answer it, right?", 
      name: 'Mr. Mailer'
    )
    ContactMessageMailer.basic_contact_email(message)
  end
end
