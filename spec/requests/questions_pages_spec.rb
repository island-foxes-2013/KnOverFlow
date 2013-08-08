require 'spec_helper'

describe "QuestionIndex" do
  describe "GET /question_index" do
    it 'displays some questions' do
      visit questions_path
      page.should have_content 'some question'
    end
  end
end


  # Given I haven't logged in
  # When I visit the index I want to review questions
  # Then review comments to the selected question
  # Then review answers to the selected question
  # Then review comments to the selected answers
  
  # User Index Test
  # Given I am logged in
  # When I visit the index I want to review questions
  # Then review comments to the selected question
  # Then review answers to the selected question
  # Then review comments to the selected answers

