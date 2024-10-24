class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :show_navbar?

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
  
    # Controllers that should display the default navbar for all actions
    navbar_controllers = ['profiles', 'preferences', 'matches']
  
    if navbar_controllers.include?(controller_name)
      Rails.logger.debug "Rendering default navbar"
      return :navbar
    end
  
    Rails.logger.debug "No navbar to render"
    nil
  end

  protected
  def after_sign_in_path_for(resource)
    if resource.profile.present?
      profiles_path(resource.profile) 
    else
      new_profile_path 
    end
  end
end

# <li><%= link_to 'Home', profiles_path(@profile) %></li>
# <li><%= link_to 'Profile', profile_path(current_user.profile) %></li>  