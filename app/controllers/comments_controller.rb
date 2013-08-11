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
      question = Question.find(params[:question_id])
      comment = question.comments.new(params[:comment])
      comment.user_id = current_user.id
      if comment.save
        render json: {
          html: render_to_string(partial: 'comments', locals: {commentable: question})
        }
      else
        puts "Failed to save comment for question"
      end
    elsif params.has_key?('answer_id')
      answer = Answer.find(params[:answer_id])
      answer = answer.comments.new(content: params[:comment][:content])
      answer.user_id = current_user.id
      if comment.save
        render json: {
          html: render_to_string(partial: 'comments', locals: { commentable: answer})
        }
      else
        puts "Failed to save comment for answer"
      end
    end
  end 
end
