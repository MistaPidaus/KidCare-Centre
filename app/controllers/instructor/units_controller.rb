class Instructor::UnitsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission
  before_action :set_unit, only: [:show, :edit, :update, :destroy]

  def create
    @unit = Unit.new(unit_params)
    #@unit.course_id = current_user.id if current_user
    #authorize! :create, @unit

    respond_to do |format|
      if @unit.save
        format.html { redirect_to @unit, notice: 'Unit was successfully created.' }
        format.json { render :show, status: :created, location: @unit }
      else
        format.html { render :new }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @unit = Unit.new
    authorize! :create, @unit
  end

  def edit
    authorize! :edit, @unit
  end

  def update
    authorize! :update, @unit
    respond_to do |format|
      if @unit.update(unit_params)
        format.html { redirect_to @unit, notice: 'Unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit }
      else
        format.html { render :edit }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize! :delete, @unit
    @unit.destroy
    respond_to do |format|
      format.html { redirect_to units_url, notice: 'Unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit
      @unit = Unit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_params
      params.require(:unit).permit(:title, :description, :picture, {attachment: []}, :course_id)
    end
end
