class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_profile_completion

  def index
    # Retrieve reports where the current user is the reporter
    @reports = current_user.profile.reports_as_reporter
  end

  def show
    @report = current_user.profile.reports_as_reporter.find(params[:id])
  end

  def new
    @report = Report.new
    @reported_profile = Profile.find_by(id: params[:reported_profile_id])
    
    if @reported_profile.nil?
      redirect_to profiles_path, alert: "Profile not found"
    end
  end

  def create
    @reported_profile = Profile.find(params[:reported_profile_id])
    @report = current_user.profile.reports_as_reporter.build(report_params.merge(reported_profile: @reported_profile, status: 'pending'))

    if @report.save
      redirect_to profile_path(@reported_profile), notice: 'Report submitted successfully.'
    else
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:reason)
  end

  def check_profile_completion
    if current_user.profile.nil?
      flash[:alert] = "Please complete your profile before accessing this page."
      redirect_to new_profile_path
    end
  end
end
