class ContactMessagesController < ApplicationController

  def create
    message = ContactMessage.new(params[:contact_message])
    mail = ContactMessageMailer.basic_contact_email(message).deliver
    redirect_to request.referrer
  end

end
