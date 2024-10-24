class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @conversation = Conversation.find(params[:conversation_id])

    if @conversation.sender == current_user.profile || @conversation.receiver == current_user.profile
      @message = @conversation.messages.build(message_params)
      @message.profile = current_user.profile

      if @message.save
        redirect_to conversation_path(@conversation)
      else
        redirect_to conversation_path(@conversation), alert: "Message could not be sent."
      end
    else
      redirect_to conversations_path, alert: "You are not authorized to send messages in this conversation."
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end