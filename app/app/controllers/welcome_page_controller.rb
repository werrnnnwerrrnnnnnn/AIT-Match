class WelcomePageController < ApplicationController
  def index
    @user_count = User.count  # Count the number of users
  end
end
