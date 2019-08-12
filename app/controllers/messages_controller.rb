class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      MessageMailer.email(@message).deliver_later
      redirect_to root_path, notice: "Thanks for reaching out. I will get back to you ASAP!"
    else
      redirect_to root_path, notice: "There was an error sending your message. Please try again."
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
