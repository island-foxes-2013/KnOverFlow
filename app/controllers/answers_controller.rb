class AnswersController < ApplicationController
  
  def index
  end

  def new
    question = Question.find(params[:question_id])
    render json: {
      html: render_to_string(partial: 'form', locals: { question: question, answer: question.answers.build })
    }
  end

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

  def edit
    @answer = Answer.find(params[:answer_id])
  end

  def update
    @answer = Answer.find(params[:answer_id])
    @question = Question.find(@answer.question_id)
    @answer.content = params["answer"]["content"]
    if @answer.save
      redirect_to question_path(@question)
    else
      redirect_to edit_answer_path(@answer)
      flash[:error] = "Error!"
    end
  end
end
