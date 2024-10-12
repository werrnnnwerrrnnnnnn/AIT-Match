class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable #, :validatable

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= 'user'
  end

  #Validates for Sign up form
  validates :email, presence: { message: "Email can't be blank" },
                    uniqueness: { message: "has already been taken" },
                    format: { 
                      with: /\Ast\d{6}@(ait\.ac\.th|ait\.asia)\z/, 
                      message: "must follow AIT format"
                    }

  validates :password, presence: { message: "can't be blank" }
end