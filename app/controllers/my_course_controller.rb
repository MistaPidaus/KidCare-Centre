class MyCourseController < ApplicationController
	before_action :authenticate_user!
	#before_action :set_course

  def index
  	@user = current_user
  	#course = Course.all 
  	#course = User.find(@user.id).courses
  	if @user.has_role? :instructor
		#@courses = Course.where(:creator_id => @user.id)
		render layout: 'my_course/instructor'
	end
  	#render layout: 'my_course/instructor'
  	#render json: @courses
  end

  def show
  	user = current_user
	course = user.courses.find_by_id(params[:id])

		if course.present? 
			@current_course = course
			#render json: user.assignment_marks.where(assignment_id: 1)
			@assignment_marks = user.assignment_mark
		else
			if course.blank?
				redirect_to my_course_path, alert: 'You are not enroll in the course.'
			end
		#end
	end

		@unit = Unit.all
  	#render json: course.exists?	
  end

  	#temporary award system (awarding yourself)
 	def award 
 		user = current_user
	    course = user.courses.find_by_id(params[:course_id])

	    #render json: user.courses.find_by_id(params[:course_id])

	    certificate = Certificate.find(params[:certificate_id])

	    cert = user.certificates.find_by_id(params[:certificate_id])

	    #render json: cert

	    if course.present?
	    	if cert.blank?
		    	user.certificates << certificate
		    	flash[:notice] = 'You have awarded a certification for completing the course!'
	    	else
	    		flash[:alert] = 'You already have the certification'
	    	end
	    	redirect_to view_mycourse_path(course)
	    else
	    	flash[:alert] = 'You are not enroll in the course.'
	    	redirect_to view_mycourse_path(course)
		end
	end
end
