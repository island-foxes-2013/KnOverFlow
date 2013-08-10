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
    if params.has_key?('question_id')
      comment = Question.find(params[:question_id]).comments.new(params[:comment])
      comment.user_id = current_user.id
      if comment.save
        puts "Success!"
      else
        puts "Fail"
      end
    end
    #   Question.find(params[:question_id]).comments.create(content: params[:comment][:content], user: current_user)
    #   redirect_to question_path(params[:question_id])
    # elsif params.has_key?('answer_id')
    #   answer = Answer.find(params[:answer_id])
    #   answer.comments.create(content: params[:comment][:content], user_id: session[:id])
    #   redirect_to question_path(answer.question_id)
    # end
  end 
end
