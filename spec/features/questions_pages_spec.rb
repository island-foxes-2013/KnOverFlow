require 'spec_helper'

feature "visitor or user lands on home page" do
  
  before(:each) do 
    visit questions_path
  end

  scenario "and reviews questions" do
    expect(page).to have_content('some question')
  end
end

feature "User create a new question" do

  before(:each) do
    # eventually a factory girl user will log in
    visit new_question_path
  end

  let(:question) { FactoryGirl.build(:question) }

  scenario "that is invalid" do
    fill_in "question title", { with: '' }
    fill_in "question content", { with: question.content } # testing that it can't be empty
    click_on "Create Question"
    expect(page).to have_content("Error!")
  end

  scenario "that is valid" do

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

    
