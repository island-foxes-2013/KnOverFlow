require 'spec_helper'

feature "User creates a new question" do

  let(:current_user) { create(:user) }
  let(:question) { create(:question, :user => current_user) }
  let(:submit) { "Create Question" }
  let(:question_title_field) { fill_in "Title", { with: question.title } }
  let(:question_content_field) { fill_in "Content", { with: question.content } }

  before do 
    log_in current_user
    visit new_question_path
  end
  
  context "that is invalid" do 

    scenario "when content and title are missing" do
      click_button submit
      page.should have_content("Error!")
    end  
    
    scenario "when title is missing" do
      question_title_field
      click_button submit
      page.should have_content("Error!")
    end
    
    scenario "when content is missing" do
      question_content_field
      click_button submit
      page.should have_content("Error!")
    end
  end

  context "that is valid" do
    scenario "when content and title are included" do 
      question_title_field 
      question_content_field
      click_button submit
      page.should have_content(question.title)
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

    
