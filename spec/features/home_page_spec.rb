require 'spec_helper'

feature "Visitor visits home page" do

  let!(:user) { create(:user) }
  let!(:questions) do
    questions = []
    (1..3).each do |i|
      create(:question, user: user, title: "question #{i}")
    end
    questions
  end

  before do
    visit root_path
  end

  scenario "and can see all questions" do
    questions.each do |question|
      page.should have_content(question.title)
    end
  end

  scenario "and can see a 'sign up' and 'sign in' links" do
    page.should have_link("sign up")
    page.should have_link("sign in")
  end

  scenario "and can see an 'ask a question' link" do
    page.should have_link("ask a question")
  end

  scenario "and clicks on the 'sign up' link" do
    click_link "sign up"
    current_path.should eq new_user_path
  end

  scenario "and clicks on the 'sign in' link" do
    click_link "sign in"
    current_path.should eq new_session_path
  end

  scenario "and clicks on the 'ask a question' link" do
    click_link "ask a question"
    page.should have_content("You must be signed in to ask a question.")
    current_path.should eq new_session_path
  end

end
