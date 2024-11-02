class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion

  def index
    # Fetch all conversations where the current user's profile is either the sender or receiver
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.profile.id, current_user.profile.id)
  end

  def create
    receiver = Profile.find(params[:receiver_id])
  
    # Find the conversation between the current user and the receiver or create one
    @conversation = Conversation.between(current_user.profile.id, receiver.id)
  
    if @conversation.nil?  # If no existing conversation found
      @conversation = Conversation.new(sender_id: current_user.profile.id, receiver_id: receiver.id)
  
      if @conversation.save
        # Successfully created new conversation
      else
        redirect_to profiles_path, alert: "Unable to create conversation."
        return
      end
    end
  
    # Redirect to the show page of the conversation
    redirect_to conversation_path(@conversation) # Ensure @conversation has an id
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

  def destroy
    @conversation = Conversation.find(params[:id])
    if @conversation.destroy
      redirect_to conversations_path, notice: 'Conversation deleted successfully.'
    else
      redirect_to conversations_path, alert: 'Unable to delete the conversation.'
    end
  end
end

#-----------------------------Private------------------------------------#
private
def check_profile_completion
  if current_user.profile.nil?
    flash[:alert] = "Please complete your profile before accessing this page."
    redirect_to new_profile_path
  end
end