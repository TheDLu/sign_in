class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]
  #before_action :correct_user, only: [:edit, :update, :destroy]
  #before_action :authenticate_user!, except: [:show, :index]

  def index
    @residents = Resident.all
  end

  def show
  end

  def new
    @res_id = params[:residence_id]
    redirect_to residents_path, notice: "Not authorized to edit this Residence" if @res_id.nil?
    @resident = Resident.new()
  end

  def edit
    @res_id = @resident.residence_id
  end

  def create
    @resident = Resident.new(resident_params)

    respond_to do |format|
      if @resident.save
        format.html { redirect_to @resident, notice: 'Resident was successfully created.' }
        format.json { render action: 'show', status: :created, location: @resident }
      else
        format.html { render action: 'new' }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @resident.update(resident_params)
        format.html { redirect_to @resident, notice: 'Resident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resident.destroy
    respond_to do |format|
      format.html { redirect_to residents_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resident
      @resident = Resident.find(params[:id])
    end

    def correct_user
      @resident = current_user.residence.residents.find_by(id: params[:id])
      redirect_to residents_path, notice: "Add residents by selecting a Residence" if @resident.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_params
      params.require(:resident).permit(:name, :phone_number, :email, :residence_id)
    end
end
