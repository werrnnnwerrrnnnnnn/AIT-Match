class MessagesController < ApplicationController
  before_action :authenticate_user!

  # Index action to fetch messages in JSON format for a conversation
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages.order(created_at: :asc)
    
    render json: @messages.to_json(include: { profile: { only: :user_name } })
  end

  # Create action for sending a new message
  def create
    @conversation = Conversation.find(params[:conversation_id])

    if @conversation.sender == current_user.profile || @conversation.receiver == current_user.profile
      @message = @conversation.messages.build(message_params)
      @message.profile = current_user.profile

      if @message.save
        # Broadcast the message to the conversation's channel
        ActionCable.server.broadcast "conversation_#{@conversation.id}", {
          profile: @message.profile.user_name,
          message: @message.body,
          created_at: @message.created_at.strftime("%H:%M, %d %b %Y")
        }
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