class ConversationChannel < ApplicationCable::Channel
  def subscribed
    conversation = Conversation.find(params[:conversation_id])
    stream_from "conversation_#{conversation.id}"
  end

  def unsubscribed
    # Cleanup when channel is unsubscribed
  end
end
