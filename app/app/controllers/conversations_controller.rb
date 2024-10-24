class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Display all conversations where the current user's profile is either the sender or receiver
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.profile.id, current_user.profile.id)
  end

  def create
    receiver = Profile.find(params[:receiver_id])
    
    # Find the conversation between the current user and the receiver or create one
    @conversation = Conversation.between(current_user.profile.id, receiver.id) || Conversation.new(sender_id: current_user.profile.id, receiver_id: receiver.id)
  
    if @conversation.new_record?
      @conversation.save
    end
  
    # Redirect to the show page of the conversation
    redirect_to conversation_path(@conversation)
  end
  
  def show
    @conversation = Conversation.find(params[:id])
  
    # Ensure that only participants in the conversation can view it
    if @conversation.sender == current_user.profile || @conversation.receiver == current_user.profile
      @messages = @conversation.messages.order(created_at: :asc)
      @message = Message.new
    else
      redirect_to conversations_path, alert: "You are not authorized to view this conversation."
    end
  end
end