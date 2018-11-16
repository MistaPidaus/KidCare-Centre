class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show]

  # GET /quizzes/1
  # GET /quizzes/1.json
  def show
  end

  def start
    @quiz = Quiz.find(params[:quiz_id])
    #@question = Question.find(10)
    #render json: @question.answers
    #@result = @quiz.questions.joins(:answers).select("questions.id as question_id, question, answers.id as answer_id, answer, correct, quiz_id")
  end

  def submit
    #@quiz = quiz_param

    render json: params.dig(:questions, :answers)
  end

  # POST /quizzes
  # POST /quizzes.json
  def create
    @quiz = Quiz.new(quiz_params)

    respond_to do |format|
      if @quiz.save
        format.html { redirect_to @quiz, notice: 'Quiz was successfully created.' }
        format.json { render :show, status: :created, location: @quiz }
      else
        format.html { render :new }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quizzes/1
  # PATCH/PUT /quizzes/1.json
  def update
    respond_to do |format|
      if @quiz.update(quiz_params)
        format.html { redirect_to @quiz, notice: 'Quiz was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz }
      else
        format.html { render :edit }
        format.json { render json: @quiz.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:questions).permit(:answers)
    end
end
