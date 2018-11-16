class MyCertController < ApplicationController
	before_action :authenticate_user!
  def index
  	@user = current_user
  end

  def show
  	@certificates = Certificate.find(params[:id])
  	@user = current_user
  	check_cert = @user.certificates.include?(@certificates)
  	if !check_cert.present?
  		redirect_to my_cert_path, flash[:alert] = 'You are not eligible for the certificate'
  	end

  	@course = Course.find(@certificates.course_id)

  	respond_to do |format|
  		format.html
  		format.json
  		format.pdf { render template: 'my_cert/show.html', pdf: 'Certification', layout: 'pdf.html' }
  	end
  end
end
