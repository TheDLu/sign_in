class ResidencesController < ApplicationController
  before_action :set_residence, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @residences = Residence.all
  end

  def show
  end

  def new
    @residence = current_user.residences.build
  end

  def edit
  end

  def create
    @residence = current_user.residences.build(residence_params)

    respond_to do |format|
      if @residence.save
        format.html { redirect_to @residence, notice: 'Residence was successfully created.' }
        format.json { render action: 'show', status: :created, location: @residence }
      else
        format.html { render action: 'new' }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @residence.update(residence_params)
        format.html { redirect_to @residence, notice: 'Residence was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @residence.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @residence.destroy
    respond_to do |format|
      format.html { redirect_to residences_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_residence
      @residence = Residence.find(params[:id])
    end

    def correct_user
      @residence = current_user.residences.find_by(id: params[:id])
      redirect_to residences_path, notice: "Not authorized to edit this Residence" if @residence.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def residence_params
      params.require(:residence).permit(:name, :description)
    end
end
