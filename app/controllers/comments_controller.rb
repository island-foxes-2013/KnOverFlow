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

  def create
    p params[:comment]
    if params.has_key?('question_id')
      Question.find(params[:question_id]).comments.create(content: params[:comment][:content], user_id: session[:id])
      redirect_to question_path(params[:question_id])
    elsif params.has_key?('answer_id')
      answer = Answer.find(params[:answer_id])
      answer.comments.create(content: params[:comment][:content], user_id: session[:id])
      redirect_to question_path(answer.question_id)
    end
  end 
end