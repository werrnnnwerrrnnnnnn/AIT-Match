class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :show_navbar?

  def show_navbar?
    welcome_navbar_actions = [
      ['sessions', 'new'],          # Sign in
      ['registrations', 'new'],     # Sign up
      ['passwords', 'new'],         # Request password reset
      ['passwords', 'create'],      # Send password reset instructions
      ['confirmations', 'new'],     # Request email confirmation
      ['confirmations', 'create'],  # Send confirmation instructions
      ['confirmations', 'show'],    # Confirm account
      ['unlocks', 'new'],           # Request unlock instructions
      ['unlocks', 'create'],        # Unlock account
      ['about_page', 'index'],
      ['contact_page', 'index']
    ]

    navbar_actions = [
      ['profiles', 'index'], 
      ['profiles', 'new'],      
      ['profiles', 'create'],      
      ['profiles', 'edit'],          
      ['profiles', 'update'],    
      ['profiles', 'show'],
      ['preferences', 'index'], 
      ['preferences', 'new'],      
      ['preferences', 'create'],      
      ['preferences', 'edit'],          
      ['preferences', 'update'],    
      ['preferences', 'show'],
      ['matches', 'requests'],
      ['matches', 'matched_profiles']
    ]
    
    Rails.logger.debug "Controller: #{controller_name}, Action: #{action_name}"
    if  welcome_navbar_actions.include?([controller_name, action_name])
        Rails.logger.debug "Rendering welcome navbar"
        return :navbar_welcome_page
    end

    if  navbar_actions.include?([controller_name, action_name])
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