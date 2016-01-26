class BreachesController < ApplicationController
  before_action :set_breach, only: [:show]

  def index
    @breaches = Breach.order(breach_date: :desc)
  end

  def show
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_breach
    @breach = Breach.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def breach_params
    params.require(:breach).permit(:title, :breach_date, :description)
  end
end
