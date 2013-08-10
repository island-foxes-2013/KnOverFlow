class AnswersController < ApplicationController

  def index
  end

  # def new
  #   @answer = Answer.new
  #   @question = Question.find(params[:question_id])
  # end

  def create
    answer = Answer.new(params[:answer])
    answer.user_id = current_user.id
    answer.question_id = params[:question_id]
    if answer.save
      render json: {
        html: render_to_string(partial: 'answer', locals: { answer: answer })
      }
    else
      question = Question.find(answer.question_id)
      render json: {
        html: render_to_string(partial: 'form', locals: { question: question, answer: answer })
      }, status: :unprocessable_entity
    end
  end

  def destroy
  end


end