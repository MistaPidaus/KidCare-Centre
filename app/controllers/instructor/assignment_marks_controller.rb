class Instructor::AssignmentMarksController < ApplicationController
  before_action :authenticate_user!
  before_action :check_permission
  before_action :set_assignment_mark, only: [:edit, :update]

  def edit
  end

  def update
    respond_to do |format|
      if @assignment_mark.update(assignment_mark_params)

      	#check qualification for user
      	check_qualification(@assignment_mark.user_id, @assignment_mark.assignment.course_id)

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

    def check_qualification(a, b)
    	#find user
    	user = User.find(a)
    	#Collect user assignment mark and assignment total score data
    	data = user.assignment_mark.joins(:assignment).select('assignment_marks.id, assignment_marks.marks, assignment_marks.assignment_id, assignment_marks.user_id, assignments.id, assignments.total_score').where("assignments.course_id = ?", b)

    	#get required data
    	marks = data.sum(:marks).to_f
    	total_score = data.sum(:total_score).to_f

    	#do calculation
	  	calculation = (((marks / total_score * 100) * 100) / 100).round(2)

	  	#check passing mark, award cert
	  	if calculation >= 80
	  		certificate = Certificate.find(b) #lets assume that the cert id same as course id
	  		user.certificates << certificate
	  	end
	end

end
