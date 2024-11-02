# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion

  def accept
    @match = Match.find(params[:id])
    if @match.receiver == current_user.profile && @match.status == 'pending'
      @match.update(status: 'accepted')
      # Create a conversation after the match is accepted
      Conversation.between(@match.requestor.id, @match.receiver.id, @match)
      redirect_to matches_requests_path, notice: 'Match accepted. Conversation created!'
    else
      redirect_to matches_requests_path, alert: 'You are not authorized to modify this match.'
    end
  end

  def destroy
    @match = Match.find(params[:id])

    # Ensure the current user is part of the match
    if @match.requestor == current_user.profile || @match.receiver == current_user.profile
      @match.destroy
      redirect_to matches_matched_profiles_path, notice: "Match deleted successfully. You can send a match request again."
    else
      redirect_to matches_matched_profiles_path, alert: "You are not authorized to delete this match."
    end
  end

  def decline
    @match = Match.find(params[:id])

    if @match.receiver == current_user.profile && @match.status == 'pending'
      @match.update(status: 'declined')
      redirect_to matches_requests_path, notice: 'Match declined.'
    else
      redirect_to matches_requests_path, alert: 'You are not authorized to modify this match.'
    end
  end

  # Create a new match request
  def create
    # Find the receiver profile using the ID passed from the button
    @receiver = Profile.find(params[:profile_id])

    # Check if a declined match already exists between the sender and receiver
    existing_match = current_user.profile.sent_matches.find_by(receiver: @receiver, status: 'declined')
    
    if existing_match
      # Update the existing declined match back to pending
      existing_match.update(status: 'pending')
      redirect_to profile_path(@receiver), notice: 'Match request sent again.'
    else
      # Otherwise, create a new match request
      @match = current_user.profile.sent_matches.build(receiver: @receiver, status: 'pending')
      
      if @match.save
        redirect_to profile_path(@receiver), notice: 'Match request sent.'
      else
        redirect_to profile_path(@receiver), alert: 'Unable to send match request.'
      end
    end
  end
  
  # Update match status based on incoming status ('accepted' or 'declined')
  def update
    @match = Match.find(params[:id])
    
    if @match.receiver == current_user.profile && @match.status == 'pending'
      if params[:status] == 'accepted'
        @match.update(status: 'accepted')
        redirect_to matches_requests_path, notice: 'Match accepted.'
      elsif params[:status] == 'declined'
        @match.update(status: 'declined')
        redirect_to matches_requests_path, notice: 'Match declined.'
      end
    else
      redirect_to matches_requests_path, alert: 'You are not authorized to modify this match.'
    end
  end

  # Show pending match requests
  def index
    @matches = current_user.profile.received_matches.where(status: 'pending')
    @matched_profiles = current_user.profile.matched_profiles
  end

  # Action to show match requests
  def requests
    # Get the current user's profile
    user_profile = current_user.profile

    # Find all pending match requests where the user is the receiver
    @matches = Match.where(receiver_id: user_profile.id, status: 'pending')
    @match_requests_count = @matches.count # Count pending requests
  end

  # Action to show matched profiles
  def matched_profiles
    # Get the current user's profile
    user_profile = current_user.profile

    # Find all matches where the user is either the requestor or the receiver and the status is 'accepted'
    @matches = Match.where("(requestor_id = ? OR receiver_id = ?) AND status = ?", user_profile.id, user_profile.id, 'accepted')

    # Retrieve the matched profiles (either requestor or receiver, excluding the current user's profile)
    @matched_profiles = @matches.map do |match|
      match.requestor_id == user_profile.id ? match.receiver : match.requestor
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