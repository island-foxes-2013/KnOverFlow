require 'spec_helper'

feature "writing comments", js: true do

  let(:user) { create(:user) }
  let(:question) { create(:question, user: user) }
  let(:answer) { create(:answer, question: question, user: user) }

  before do
    # log_in(user)
    visit question_path(question)
    click_link "answer question"
  end

  # subject { page }

  # scenario "a question will have a link to create a comment" do
  #   expect(page).to have_link("create comment")
  # end

  scenario "an answer will have a link to create a comment", js: true do
    
    # sleep(10)
    fill_in "Content", with: "blah"
    click_button "Create Answer"
    # sleep(10)
    page.should have_content("blah") 
  end

  scenario "clicking the comment link instantiates a partial" do
    pending
  end

  scenario "create a comment" do
    pending "add some examples to (or delete) #{__FILE__}"
  end

  scenario "as an authorized user, I want to comment on questions" do
    pending
  end

  scenario "as an authorized user, I want to comment on answers" do
    pending
  end

  scenario "empty comments will not be saved" do
    pending
  end

  scenario "comments will appear automatically without refreshing" do
    pending
  end

end
