class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:show, :index]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all.where(published: true)
    #render json: @courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    courses = Course.find(params[:id])
    user = current_user

    #@courses = Course.all.where('courses.id' => user.courses.each(&:id))

    #render json: courses
  end

  # GET /courses/new
  def new
    @course = Course.new
    authorize! :create, @course
  end

  # GET /courses/1/edit
  def edit
    authorize! :update, @course
  end

  # POST /courses
  # POST /courses.json
  def create
    authorize! :create, @course
    @course = Course.new(course_params)
    @course.user_id = current_user.id if current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    authorize! :update, @course
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    authorize! :destroy, @course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def enrol
    #authorize! :enrol, @course
    user = current_user
    course = Course.find(params[:course_id])

    if course.published
      check_enrol = user.courses.include?(course)
        if check_enrol.present?
          flash[:alert] = 'You already enrolled in this course'
        else 
          user.courses << course 
          flash[:notice] = 'You have successfully enrolled to this course'
        end
          redirect_to view_mycourse_path(course)
      else
        flash[:alert] = 'The course is not available'
        redirect_to my_course_path
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
