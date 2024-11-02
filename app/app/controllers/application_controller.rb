class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :show_navbar?
  before_action :set_match_requests_count


  def show_navbar?
    welcome_navbar_controllers = [
      'sessions', 'registrations', 'passwords', 
      'confirmations', 'unlocks', 'about_page', 
      'contact_page'
    ]
  
    # Controllers that should display the welcome navbar
    if welcome_navbar_controllers.include?(controller_name)
      Rails.logger.debug "Rendering welcome navbar"
      return :navbar_welcome_page
    end
  
    # Check if the controller is Admin::UsersController to render the admin navbar
    if controller_path == 'admin/users'
      Rails.logger.debug "Rendering admin navbar"
      return :navbar_admin
    end
  
    # Controllers that should display the default navbar for all actions
    navbar_controllers = ['profiles', 'preferences', 'matches', 'conversations', 'messages']
  
    if navbar_controllers.include?(controller_name)
      Rails.logger.debug "Rendering default navbar"
      return :navbar
    end
  
    Rails.logger.debug "No navbar to render"
    nil
  end
  
  private
  def set_match_requests_count
    @match_requests_count = current_user.profile.received_matches.where(status: 'pending').count
  end

  protected
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_users_path  # Redirect admin users to the admin users index page
    elsif resource.profile.present?
      profiles_path(resource.profile)
    else
      new_profile_path
    end
  end
end

# <li><%= link_to 'Home', profiles_path(@profile) %></li>
# <li><%= link_to 'Profile', profile_path(current_user.profile) %></li>  