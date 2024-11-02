class Conversation < ApplicationRecord
  belongs_to :sender, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
  belongs_to :match, optional: true

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :sender_id, scope: :receiver_id

  # Find or create a conversation between two profiles (with or without a match)
  def self.between(sender_id, receiver_id, match = nil)
    # Find the existing conversation without creating duplicates
    existing_conversation = if match
      where(match_id: match.id).first
    else
      where(sender_id: sender_id, receiver_id: receiver_id)
        .or(where(sender_id: receiver_id, receiver_id: sender_id)).first
    end
  
    # If an existing conversation is found, return it
    return existing_conversation if existing_conversation
  
    # Create a new conversation if none exists
    if match
      create(sender_id: sender_id, receiver_id: receiver_id, match: match)
    else
      create(sender_id: sender_id, receiver_id: receiver_id)
    end
  end
end