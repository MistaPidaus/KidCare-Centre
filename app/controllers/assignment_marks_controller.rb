class AssignmentMarksController < ApplicationController
  before_action :set_assignment_mark, only: [:edit, :update, :destroy]

  # GET /assignment_marks
  # GET /assignment_marks.json
  def index
    @assignment_marks = AssignmentMark.all
  end

  # GET /assignment_marks/1
  # GET /assignment_marks/1.json
  def show
    #@assignment = Assignment.find(1)
    #user = User.find(1)
    #render json: @assignment
    #render json: current_user.assignment_marks
    @submission = current_user.assignment_marks.find_by(assignment_id: params[:id])
    if @submission.blank?
    #@assignment = Assignment.find_by(params[:id])
    #render json: @submission
    end
  end

  # GET /assignment_marks/new
  def new
    @assignment_mark = AssignmentMark.new(assignment_id: params[:assignment])
    @assignment = Assignment.find(params[:assignment])
  end

  # GET /assignment_marks/1/edit
  def edit
  end

  # POST /assignment_marks
  # POST /assignment_marks.json
  def create
    @assignment_mark = AssignmentMark.new(assignment_mark_params)

    respond_to do |format|
      if @assignment_mark.save
        format.html { redirect_to assignment_path(params[:assignment]), notice: 'Assignment mark was successfully created.' }
        format.json { render :show, status: :created, location: @assignment_mark }
      else
        format.html { render :new }
        format.json { render json: @assignment_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assignment_marks/1
  # PATCH/PUT /assignment_marks/1.json
  def update
    respond_to do |format|
      if @assignment_mark.update(assignment_mark_params)
        format.html { redirect_to assignment_path(params[:assignment]), notice: 'Assignment mark was successfully updated.' }
        format.json { render :show, status: :ok, location: @assignment_mark }
      else
        format.html { render :edit }
        format.json { render json: @assignment_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignment_marks/1
  # DELETE /assignment_marks/1.json
  def destroy
    @assignment_mark.destroy
    respond_to do |format|
      format.html { redirect_to assignment_path(params[:assignment]), notice: 'Assignment mark was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment_mark
      @assignment_mark = AssignmentMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def assignment_mark_params
      params.require(:assignment_mark).permit(:marks, :user_id, {file: []}, :assignment_id)
    end
end
