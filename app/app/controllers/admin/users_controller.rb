module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      # Display all users except the currently logged-in admin
      @users = User.where.not(id: current_user.id)
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_users_path, notice: "User profile updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @user = User.find(params[:id])
      
      # Prevent admin from deleting their own account
      if @user == current_user
        redirect_to admin_users_path, alert: "You cannot delete your own account."
      else
        @user.destroy
        redirect_to admin_users_path, notice: "User profile deleted successfully."
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :other_attributes_as_needed)
    end

    def require_admin
      redirect_to root_path, alert: "Access Denied" unless current_user.admin?
    end
  end
end