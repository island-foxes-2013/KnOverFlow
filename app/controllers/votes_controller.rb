class VotesController < ApplicationController
  
  def create
    # votable class, votable id, votable value
      if params.has_key?(:up_voted)
        answer = Answer.find(params[:answer_id])
        vote = answer.votes.new(up_voted: true)
        vote.user_id = current_user.id
      # vote = current_user.votes.where(voteable_id: params[:answer_id]).first_or_initialize(up_voted: params[:up_voted])
      elsif 
        answer = Answer.find(params[:answer_id])
        vote = answer.votes.new(up_voted: false)
        vote.user_id = current_user.id 
      end                                                                                # voteable_type: params[:voteable_type],
                                                                                         # voteable_id: params[:answer_id])
    if vote.id != current_user.id
      vote.save
      render json: 'Your vote has been saved!'.to_json # opportunity to send status back here too for controller testing
    else
      render json: 'Fuck Off!'.to_json #opportunity to send status back here for controller testing
    end
  end

  # def update
  #   if params.has_key?(question.id)
  #     vote_count = Question.find(params[:question_id]).vote_count
  #     @vote = Question.find(params[:question_id]).update.vote_count
  #   elsif 
  #   end
  # end
end