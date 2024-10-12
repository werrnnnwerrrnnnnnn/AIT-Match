class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :show_navbar?

  def show_navbar?
    # Logic to determine if the navbar should be shown
    # Example: Show navbar except on the login or signup pages
    !(controller_name == 'welcome_page' && action_name == 'index') 
    # &&
    # !(controller_name == 'registrations' && action_name == 'new')
  end

  def after_sign_in_path_for(resource)
    root_path  # Redirect to the homepage after login
  end
end
