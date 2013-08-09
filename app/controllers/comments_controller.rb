class CommentsController < ApplicationController

  def new 
    if params.has_key?('question_id')
      @comment = Comment.new
      @commentable = Question.find(params[:question_id])
    elsif params.has_key?('answer_id')
      @comment = Comment.new
      @commentable = Answer.find(params[:answer_id])
    end
  end 

  # def new 
  #   @answer = Answer.new
  #   @question = Question.find(params[:question_id])
  # end 

  def create
    if params.has_key?('question_id')
      Question.find(params[:question_id]).comments.create(content: params[:comment], user_id: session[:id])
      redirect_to question_path(params[:question_id])
    elsif params.has_key?('answer_id')
      Answer.find(params[:answer_id]).comments.create(content: params[:comment], user_id: session[:id])
      redirect_to question_path(params[:answer_id])
    end
  end 
end