class Instructor::AssignmentMarksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission
  before_action :set_assignment_mark, only: [:edit, :update]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @assignment_mark.update(assignment_mark_params)
        format.html { redirect_to instructor_assignment_path(@assignment_mark.assignment), notice: 'Assignment mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_mark }
      else
        format.html { render :edit }
        format.json { render json: @assignment_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_mark
      @assignment_mark = AssignmentMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_mark_params
      params.require(:assignment_mark).permit(:marks)
    end
end
