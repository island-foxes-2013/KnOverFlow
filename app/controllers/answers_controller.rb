class AnswersController < ApplicationController

  def index
  end

  # def new
  #   @answer = Answer.new
  #   @question = Question.find(params[:question_id])
  # end

  def create
    @answer = Answer.new(params[:answer])
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
      @answers = Answer.find_by_question_id(params[:question_id])
      redirect_to question_path(@answer.question_id)
    else
      flash[:error] = "Error!"
      redirect_to question_path(@answer.question_id)
    end
  end

  def destroy
  end


end