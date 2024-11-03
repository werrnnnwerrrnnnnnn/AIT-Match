module Admin
  class Admin::ReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :require_admin

    def index
      @reports = Report.all
    end

    def show
      @report = Report.find(params[:id])
    end

    def update
      @report = Report.find(params[:id])
      if @report.update(status: params[:status])
        redirect_to admin_reports_path, notice: "Report status updated."
      else
        render :show
      end
    end

    #-----------------------------Private------------------------------------#
    private

    def require_admin
      redirect_to root_path, alert: "Access Denied" unless current_user.admin?
    end
  end
end
