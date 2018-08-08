class MyCourseController < ApplicationController
	#before_action :set_course

  def index
  	@user = current_user
  	#course = Course.all 

  	#render json: user.courses
  end

  def show
  	user = current_user
	course = user.courses.find_by_id(params[:id])
	
	if course.present? 
		#unit = Unit.all
		@current_course = Course.find(params[:id])
		@myunits = course.unit

		#render json: course.unit
	else
		if course.blank?
			redirect_to my_course_path, alert: 'You are not enroll in the course.'
		end
	end

	

	@unit = Unit.all

  	#render json: course.exists?

  end


end
