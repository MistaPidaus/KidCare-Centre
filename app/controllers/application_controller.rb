class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!

  def check_permission
  	if !current_user.has_role? :instructor
  		redirect_to my_course_path, alert: 'You do not have permission to access'
  	end
  end
end
