class Instructor::AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission
  before_action :set_assignment, only: [:show, :edit, :update, :destroy]

  def create
    @assignment = Assignment.new(assignment_params)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        format.json { render :show, status: :created, location: @assignment }
      else
        format.html { render :new }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @assignment = Assignment.new
    #@course = Course.find(params[:id])
    #render json: @course.unit
  end

  def edit
  end

  def update
    respond_to do |format|
      if @assignment.update(assignment_params)
        format.html { redirect_to instructor_course_path(@assignment.course), notice: 'Assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment }
      else
        format.html { render :edit }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @assignment.destroy
    respond_to do |format|
      format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
      @assignment = Assignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_params
      params.require(:assignment).permit(:title, {assignment_file: []}, :description, :course_id, :total_score)
    end
end
