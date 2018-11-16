class Instructor::DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permission
  
  def index
  	@course = current_user.created
  	#render json: @course
  end
end
