require 'spec_helper'

feature "User creates a new question" do

  before(:all) { log_in }
  
  background { visit new_question_path }

  given(:question) { create(:question, user: create(:user)) }
  given(:submit) { "Create Question" }
  given(:question_title_field) { fill_in "Title", { with: question.title } }
  given(:question_content_field) { fill_in "Content", { with: question.content } }
  
  context "that is invalid" do 

    scenario "when content and title are missing" do 
      expect{click_button submit}.not_to change(Question, :count)
    end  
    
    scenario "when title is missing" do
      question_title_field
      click_button submit
      expect{page}.to have_content("Error!")
    end
    
    scenario "when content is missing" do
      question_content_field
      click_button submit
      expect{page}.to have_content("Error!")
    end
  end

  context "that is valid" do
    scenario "when content and title are included" do 
      question_title_field 
      question_content_field
      click_button submit
      expect{page}.to have_content(question.title)
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

    
