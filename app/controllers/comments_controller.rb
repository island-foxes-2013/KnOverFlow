class CommentsController < ApplicationController

  def new 
    if params.has_key?('question_id')
      @commentable = Question.find(params[:question_id])
    elsif params.has_key?('answer_id')
      @commentable = Answer.find(params[:answer_id])
    end
    render json: {
      html: render_to_string(partial: 'form', locals: { commentable: @commentable, comment: @commentable.comments.build })
    }
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
        render json: {
          html: render_to_string(partial: 'form', locals: { commentable: question, comment: comment })
        }, status: :unprocessable_entity
      end
    elsif params.has_key?('answer_id')
      answer = Answer.find(params[:answer_id])
      comment = answer.comments.new (params[:comment])
      comment.user_id = current_user.id
      if comment.save
        render json: {
          html: render_to_string(partial: 'comments', locals: { commentable: answer})
        }
      else
        render json: {
          html: render_to_string(partial: 'form', locals: { commentable: answer, comment: comment })
        }, status: :unprocessable_entity
      end
    end
  end 
end
