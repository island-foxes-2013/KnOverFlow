class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end

  def new
    if logged_in?
      @question = Question.new
    else
      flash[:error] = "You must be signed in to ask a question."
      redirect_to new_session_path 
    end
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
      if @question.comments
        @question.comments.destroy_all
      end
      if @question.answers
        @question.answers.destroy_all
      end
      @question.destroy
      redirect_to root_path
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update 
    @question = Question.find(params[:id])
    @question.title = params["question"]["title"]
    @question.content = params["question"]["content"]
    if @question.save
      redirect_to question_path(@question)
    else
      redirect_to edit_question_path(@question)
      flash[:error] = "Error!"
    end
  end
end
