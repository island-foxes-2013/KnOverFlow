class CommentsController < ApplicationController

  def new 
    @comment = Comment.new
    @question = Question.find(params[:question_id])
  end 

  # def new 
  #   @answer = Answer.new
  #   @question = Question.find(params[:question_id])
  # end 

  def create
  p params
  end 
end