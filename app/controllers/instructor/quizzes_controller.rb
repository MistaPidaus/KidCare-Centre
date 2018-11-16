class Instructor::QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  # GET /quizzes
  # GET /quizzes.json
  def index
    @quizzes = Quiz.all
  end

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  # GET /quizzes/new
  def new
    @quiz = Quiz.new
    1.times do 
       question = @quiz.questions.build
       2.times { question.answers.build  }
     end
  end

  # GET /quizzes/1/edit
  def edit
    @quiz
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.course_id = params[:course_id]

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to instructor_quiz_path(@quiz), notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: instructor_quiz_path(@quiz) }
      else
        format.html { render :new, course_id: params[:course_id] }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to instructor_quiz_path(@quiz), notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: instructor_quiz_path(@quiz) }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quizzes/1
  # DELETE /quizzes/1.json
  def destroy
    @quiz.destroy
    respond_to do |format|
      format.html { redirect_to quizzes_url, notice: 'Quiz was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit(:id, :title,
          questions_attributes: [:id, :question, :quiz_id, :_destroy, 
            answers_attributes: [:id, :answer, :correct, :question_id, :_destroy]
          ]
        )
    end
end

