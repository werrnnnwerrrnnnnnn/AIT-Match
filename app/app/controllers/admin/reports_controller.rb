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

    def destroy
      @report = Report.find(params[:id])
      @report.destroy
      redirect_to admin_reports_path, notice: 'Report was successfully deleted.'
    end

    def update
      @report = Report.find(params[:id])
      if @report.update(report_params)
        redirect_to admin_reports_path, notice: "Report status updated."
      else
        render :show, alert: "Failed to update report status."
      end
    end

    #-----------------------------Private------------------------------------#
    private

    def report_params
      params.require(:report).permit(:status)
    end

    def require_admin
      redirect_to root_path, alert: "Access Denied" unless current_user.admin?
    end
  end
end
