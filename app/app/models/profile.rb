class Profile < ApplicationRecord
  validates :user_name,   presence: { message: "cannot be blank" },
                          uniqueness: { message: "is already taken." },
                          format: { with: /\A[a-zA-Z0-9_]+\z/, message: "can only contain letters, numbers, and underscores." }
  validates :first_name,  presence: { message: "cannot be blank" },
                          format: { with: /\A[a-zA-Z\s'-]+\z/, message: "can only contain letters, spaces, hyphens, and apostrophes." }
  validates :last_name,   presence: { message: "cannot be blank" },
                          format: { with: /\A[a-zA-Z\s'-]+\z/, message: "can only contain letters, spaces, hyphens, and apostrophes." }
  # validates :age,         presence: { message: "cannot be blank" },
  #                         numericality: { greater_than_or_equal_to: 18, message: "must be 18 or older." }
  validates :mbti_id, presence: { message: "must be selected." }
  validates :gender_id, presence: { message: "must be selected." }
  validates :degree_id, presence: { message: "must be selected." }
  validates :school_id, presence: { message: "must be selected." }
  validates :program_id, presence: { message: "must be selected." }
  validates :educational_background, presence: { message: "cannot be blank." }
  validates :profile_picture_url, presence: { message: "cannot be blank." }
  validate :single_profile_per_user   
  validate :interest_count_within_limit   
  validates :birthday, presence: { message: "must be provided" }, on: :update
  
                  
  belongs_to :user
  belongs_to :mbti, optional: true
  belongs_to :gender, optional: true
  belongs_to :degree, optional: true
  belongs_to :school, optional: true
  belongs_to :program, optional: true

  has_many :profile_preferred_genders
  has_many :profile_interests
  has_many :profile_preferred_interests
  has_many :profile_relationships
  has_many :profile_preferred_relationships
  
  has_many :profile_interests, dependent: :destroy
  has_many :interests, through: :profile_interests

  # before_save :calculate_age

  private
  def single_profile_per_user
    if user.present? && Profile.where(user_id: user.id).where.not(id: id).exists?
      errors.add(:base, "You can only have one profile.")
    end
  end

  def interest_count_within_limit
    errors.add(:interests, "can only select up to 5") if interests.size > 5
  end

  # def calculate_age
  #   if birthday.present?
  #     today = Date.today
  #     self.age = today.year - birthday.year - ((today.month > birthday.month || (today.month == birthday.month && today.day >= birthday.day)) ? 0 : 1)
  #   end
  # end
end
