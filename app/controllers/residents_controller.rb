class ResidentsController < ApplicationController
  before_action :set_resident, only: [:show, :edit, :update, :destroy]

  def index
    @residents = Resident.all
  end

  def show
  end

  def new
    @resident = current_user.residents.build
  end

  def edit
  end

  def create
    @resident = current_user.residents.build(resident_params)

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

    # Never trust parameters from the scary internet, only allow the white list through.
    def resident_params
      params.require(:resident).permit(:name, :phone_number, :email)
    end
end
