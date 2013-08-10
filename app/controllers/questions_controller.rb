class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end
  
  def create # need error messaging / validations on model
    p "these are the params #{params}"
    @question = Question.new(params[:question])
    @question.user = current_user
    if @question.save
      p "it's here when question is created"
      redirect_to question_path(@question)
    else
      flash[:error] = "Error!"
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
  end
end
