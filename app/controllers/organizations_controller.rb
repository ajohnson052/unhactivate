class OrganizationsController < ApplicationController
  before_action :set_org, only: [:show]

  def index
    @orgs = Organization.all
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_org
    @org = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def org_params
    params.require(:organization).permit(:name, :domain)
  end
end
