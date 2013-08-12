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
    comment = Comment.new(params[:comment])
    comment.user = current_user
    if comment.save
      render json: {
        html: render_to_string(partial: 'comments', locals: {commentable: comment.commentable})
      }
    else
      render json: {
        html: render_to_string(partial: 'form', locals: { commentable: comment.commentable, comment: comment })
      }, status: :unprocessable_entity
    end
  end

  def destroy
    if params.has_key?("question_id")
      @comment = Comment.find(params["question_id"])
      @question = Question.find(@comment.commentable_id)
    else
      @comment = Comment.find(params["answer_id"])
      @answer = Answer.find(@comment.commentable_id)
      @question = @answer.question_id
    end

    if @comment.user == current_user
      @comment.destroy
      redirect_to question_path(@question)
    end
  end

  def edit
    if params.has_key?("question_id")
      @comment = Comment.find(params["id"])
      @question = Question.find(params["question_id"])
    else
      @comment = Comment.find(params["id"])
      @answer = Answer.find(params["answer_id"])
    end
  end

  def update
    if params.has_key?("question_id")
      @comment = Comment.find(params["id"])
      @question = Question.find(params["question_id"])
    else
      @comment = Comment.find(params["id"])
      @answer = Answer.find(params["answer_id"])
      @question = @answer.question_id
    end

    @comment.content = params["comment"]["content"]

    if @comment.save
      redirect_to question_path(@question)
    else
      flash[:error] = "Error!"
      if params.has_key?("question_id")
        redirect_to edit_question_comment_path(@question, @comment)
      else
        redirect_to edit_answer_comment_path(@answer, @comment)
      end
    end
  end
end
