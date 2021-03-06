class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  # GET /questions
  # GET /questions.jsonth
  # Added auth for the user to see all the questions
  def index
    Auth()
    @questions = Question.where(user: current_user.uid )
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    Auth()
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
    Auth()
    set_question()
    if @question.user != current_user.uid
      redirect_to root_url
    end
  end

  # POST /questions
  # POST /questions.json
  def Auth()
    if session[:user_id]== nil
      redirect_to root_url
    end  
  end

  def create
    @question = Question.new(question_params)
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit([:name,:user,:tags])
    end

      
end
