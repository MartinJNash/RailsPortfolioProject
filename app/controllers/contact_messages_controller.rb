class ContactMessagesController < ApplicationController

  def create
    message = ContactMessage.new(params[:contact_message])
    if message.valid?
      ContactMessageMailer.delay.basic_contact_email(message)
    else
      flash[:alert] = 'Invalid message'
    end
    redirect_to request.referrer
  end

end
