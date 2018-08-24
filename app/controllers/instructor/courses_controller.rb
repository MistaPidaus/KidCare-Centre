class Instructor::CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def show
    user = current_user
    course = user.courses.find_by_id(params[:id])

    course = user.created.find_by_id(params[:id])
    if course.present? 
      #unit = Unit.all
      @current_course = Course.find(params[:id])
      @myunits = course
      assignment = @current_course.assignment
      #render json: submission = assignment.assignment_mark


      #render json: @myunits
      #render json: @myunits

      #render json: @current_course.assignment
    else
      if course.blank?
        redirect_to my_course_path, alert: 'You are not enroll in the course.'
      end
    end
  end

  def create
    @course = Course.new(course_params)
    @course.creator_id = current_user.id if current_user
    authorize! :create, @course
    @certificate = Certificate.new(:name => @course.name, :description => @course.description, :file, :course_id => @course.id)

    respond_to do |format|
      if @course.save && @certificate.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize! :update, @course
    @certificate = Certificate.find(params[:id])
    cert_params = (:name => @course.name, :description => @course.description, :file, :course_id => @course.id)
    respond_to do |format|
      if @course.update(course_params) && @certificate.update(cert_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    #authorize! :update, @course
    #@courses = Course.find(params[:id])
    @course = Course.new
  end

  def new
    @course = Course.new
    authorize! :create, @course
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to leaves_url, notice: 'Leave was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:title, :description, :picture, :published, :college_id)
    end
end
