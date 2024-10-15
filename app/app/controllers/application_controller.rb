class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :show_navbar?

  def show_navbar?
    welcome_navbar_actions = [
      ['sessions', 'new'],          # Sign in
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
    ]
    
    Rails.logger.debug "Controller: #{controller_name}, Action: #{action_name}"
    if  welcome_navbar_actions.include?([controller_name, action_name]) && 
        !(controller_name == 'registrations' && action_name == 'new')
        Rails.logger.debug "Rendering welcome navbar"
        return :navbar_welcome_page
    end

    if  navbar_actions.include?([controller_name, action_name])
        Rails.logger.debug "Rendering default navbar"
        return :navbar
    end

  end

  protected
  def after_sign_in_path_for(resource)
    if resource.profile.present?
      show_profile_path(resource.profile) 
    else
      new_profile_path 
    end
  end
end
