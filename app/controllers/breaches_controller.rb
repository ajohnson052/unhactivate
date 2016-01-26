class BreachesController < ApplicationController
  before_action :set_breach, only: [:show]

  def index
    @breaches = Breach.order(breach_date: :desc)
  end

  def new
    @breach = Breach.new
    @orgs = Organization.all
  end

  def create
    @breach = Breach.new(breach_params)
    @orgs = Organization.all

    respond_to do |format|
      if @breach.save
        format.html { redirect_to @breach, notice: 'Breach was successfully created.' }
        format.json { render :show, status: :created, location: @breach }
      else
        format.html { render :new }
        format.json { render json: @breach.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @orgs = Organization.all
  end

  def update
    respond_to do |format|
      if @breach.update(breach_params)
        format.html { redirect_to @breach, notice: 'Breach was successfully updated.' }
        format.json { render :show, status: :ok, location: @breach }
      else
        format.html { render :edit }
        format.json { render json: @breach.errors, status: :unprocessable_entity }
      end
    end
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
