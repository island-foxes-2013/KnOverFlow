class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end
  
  def create # need error messaging / validations on model
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      redirect_to question_path(@question)
    else
      flash[:error] = "Error!"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.user == current_user
      @question.destroy
      redirect_to root_path
    end
  end
end
