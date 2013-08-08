class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end
  
  def create # need error messaging / validations on model
    @question = Question.new(params[:question])
    if @question.save
      # do something
    else
      render 'new'
    end
  end
end
